package com.hk.one;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Locale;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.hk.one.dto.BoardDto;
import com.hk.one.service.IBoardService;

@Controller
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	private static final String UPLOAD_PATH = "C:\\Users\\HKEDU\\git\\project_hk1\\projectOne\\src\\main\\webapp\\img";
	@Autowired
	private IBoardService bService;
	
	@RequestMapping(value = "/board/member_board.do", method = RequestMethod.GET)
	public String member_board(Locale locale, Model model) {
		logger.info("member_board 호출 {}.", locale);
		
		List<BoardDto> list = bService.selectList();
		model.addAttribute("board", list);
		
		return "board/member_board";
	}
	
	@RequestMapping(value = "/board/member_boarddetail.do", method = RequestMethod.GET)
	public String member_detail(Locale locale, Model model, int seq) {
		logger.info("member_detail 호출 {}.", locale);
		
		BoardDto dto = bService.selectOne(seq);
		model.addAttribute("boarddetail", dto);
		
		return "board/member_boarddetail";
	}
	
	@RequestMapping(value = "/board/member_del.do", method = RequestMethod.GET)
	public String member_del(Locale locale, Model model, int seq) {
		logger.info("member_del 호출 {}.", locale);
		
		boolean success = bService.delete(seq);
		if (success) {
			System.out.println(seq + "번 글삭제 성공");
			return "redirect:member_board.do";
		} else {
			System.out.println(seq + "번 글삭제 실패");
			return "redirect:member_board.do";
		}
	}
	
	@RequestMapping(value = "/board/member_writeForm.do", method = RequestMethod.GET)
	public String member_write(Locale locale, Model model) {
		logger.info("member_writeForm 호출 {}.", locale);
		
		return "board/member_writeForm";
	}
	
	@RequestMapping(value = "/board/member_writeBoard.do", method = RequestMethod.POST)
	public String member_writeBoard(Locale locale, Model model, BoardDto dto, MultipartFile uploadFile) {
		logger.info("member_writeBoard 호출 {}.", locale);
		logger.info("uploadFile {}.", locale);
		logger.info("파일 이름: {}.", uploadFile.getOriginalFilename());
		logger.info("파일 용량: {}.", uploadFile.getSize());
		saveFile(uploadFile);
		
		boolean success = bService.insert(dto);
		if (success) {
			System.out.println("글추가 성공");
			return "redirect:member_board.do";
		} else {
			System.out.println("글추가 실패");
			return "redirect:member_board.do";
		}
	}
	
	private String saveFile(MultipartFile file) {
		// 파일이름 변경
		UUID uuid = UUID.randomUUID();
		String saveName = uuid + "_" + file.getOriginalFilename();
		logger.info("파일 이름: {}.", saveName);
		// 저장할 파일 객체를 생성(껍데기 파일)
		File saveFile = new File(UPLOAD_PATH, saveName); // 저장할 폴더 이름, 저장할 파일 이름
				
				try {
					file.transferTo(saveFile); // 업로드파일에 saveFile이라는 껍데기를 입힌다
				} catch (IOException e) {
					e.printStackTrace();
					return null;
				}
		return saveName;
	}
	@RequestMapping(value = "/board/member_updateForm.do", method = RequestMethod.GET)
	public String member_updateForm(Locale locale, Model model, int seq) {
		logger.info("member_updateForm 호출 {}.", locale);
		
		BoardDto dto = bService.selectOne(seq);
		model.addAttribute("boarddetail", dto);
		
		return "board/member_updateForm";
	}
	
	@RequestMapping(value = "/board/member_updateBoard.do", method = RequestMethod.POST)
	public String member_updateBoard(Locale locale, Model model, BoardDto dto) {
		logger.info("member_updateBoard 호출 {}.", locale);
		
		boolean success = bService.updateBoard(dto);
		if (success) {
			System.out.println("글수정 성공");
			return "redirect:member_boarddetail.do?seq=" + dto.getQna_seq();
		} else {
			System.out.println("글수정 실패");
			return "redirect:member_board.do";
		} 
	}
}
