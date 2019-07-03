package com.hk.one;

import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hk.one.dto.BoardDto;
import com.hk.one.service.IBoardService;

@Controller
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private IBoardService bService;
	
	@RequestMapping(value = "/member_board.do", method = RequestMethod.GET)
	public String member_board(Locale locale, Model model) {
		logger.info("member_board 호출 {}.", locale);
		
		List<BoardDto> list = bService.selectList();
		model.addAttribute("board", list);
		
		return "board/member_board";
	}
	
	@RequestMapping(value = "/member_detail.do", method = RequestMethod.GET)
	public String member_detail(Locale locale, Model model, int seq) {
		logger.info("member_detail 호출 {}.", locale);
		
		BoardDto dto = bService.selectOne(seq);
		model.addAttribute("boarddetail", dto);
		
		return "member_boarddetail";
	}
	
	@RequestMapping(value = "/member_del.do", method = RequestMethod.GET)
	public String member_del(Locale locale, Model model, int seq) {
		logger.info("member_del 호출 {}.", locale);
		
		boolean success = bService.delete(seq);
		if (success) {
			System.out.println(seq + "번 글삭제 성공");
			return "member_board";
		} else {
			System.out.println(seq + "번 글삭제 실패");
			return "member_board";
		}
	}
	
	@RequestMapping(value = "/member_writeForm.do", method = RequestMethod.GET)
	public String member_write(Locale locale, Model model) {
		logger.info("member_writeForm 호출 {}.", locale);
		
		return "member_writeForm";
	}
	
	@RequestMapping(value = "/member_writeBoard.do", method = RequestMethod.POST)
	public String member_writeBoard(Locale locale, Model model, BoardDto dto) {
		logger.info("member_writeBoard 호출 {}.", locale);
		
		boolean success = bService.insert(dto);
		if (success) {
			System.out.println("글추가 성공");
			return "redirect:member_board.do";
		} else {
			System.out.println("글추가 실패");
			return "redirect:member_board.do";
		}
	}
	@RequestMapping(value = "/member_updateForm.do", method = RequestMethod.GET)
	public String member_updateForm(Locale locale, Model model, int seq) {
		logger.info("member_updateForm 호출 {}.", locale);
		
		return "member_updateForm";
	}
	
	@RequestMapping(value = "/member_updateBoard.do", method = RequestMethod.POST)
	public String member_updateBoard(Locale locale, Model model, BoardDto dto) {
		logger.info("member_updateBoard 호출 {}.", locale);
		
		boolean success = bService.updateBoard(dto);
		if (success) {
			System.out.println("글수정 성공");
			return "redirect:member_boarddetail?seq=" + dto.getQna_seq();
		} else {
			System.out.println("글수정 실패");
			return "redirect:member_board";
		} 
	}
}
