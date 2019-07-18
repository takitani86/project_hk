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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.hk.one.dto.BoardDto;
import com.hk.one.service.IBoardService;

@Controller
@RequestMapping(value = "/admin/board/*")
public class AdminBoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminBoardController.class);

	@Autowired
	private IBoardService boardService;
	
	// 관리자 컨트롤러
	// 게시판 목록
	@RequestMapping(value = "/admin_board.do", method = RequestMethod.GET)
	public String admin_board(Locale locale, Model model,
			@RequestParam(defaultValue="1") int section, @RequestParam(defaultValue="1") int curPage) {
		logger.info("admin_board 호출 {}.", locale);
		
		// 전체 글 수 조회
		int totalArticles = boardService.selectBoardListCnt();
		//전체리스트 출력
		List<BoardDto> list = boardService.selectList(section, curPage);
		
		model.addAttribute("board", list);
		model.addAttribute("totalArticles", totalArticles);
		model.addAttribute("section", section);
		model.addAttribute("curPage", curPage);
		
		return "board/admin_board";
	}
	
	// 게시글 상세보기
	@RequestMapping(value = "/admin_boarddetail.do", method = RequestMethod.GET)
	public String admin_detail(Locale locale, Model model, int seq) {
		logger.info("admin_detail 호출 {}.", locale);
		
		BoardDto dto = boardService.selectOne(seq);
		model.addAttribute("boarddetail", dto);
		
		return "board/admin_boarddetail";
	}
	
	// 게시글 삭제하기(isdel을 1로 바꾸고 게시판목록 메소드에서 isdel이 0인 칼럼만 출력)
	@RequestMapping(value = "/admin_del.do", method = RequestMethod.GET)
	public String admin_del(Locale locale, Model model, int seq) {
		logger.info("admin_del 호출 {}.", locale);
		
		boolean success = boardService.delete(seq);
		if (success) {
			System.out.println(seq + "번 글삭제 성공");
			return "redirect:admin_board.do";
		} else {
			System.out.println(seq + "번 글삭제 실패");
			return "redirect:admin_board.do";
		}
	}
	
	// 글작성 폼으로 이동
	@RequestMapping(value = "/admin_writeForm.do", method = RequestMethod.GET)
	public String admin_write(Locale locale, Model model) {
		logger.info("admin_writeForm 호출 {}.", locale);
		
		return "board/admin_writeForm";
	}
	
	// 글작성 후 insert
	@RequestMapping(value = "/admin_writeBoard.do", method = RequestMethod.POST)
	public String admin_writeBoard(Locale locale, Model model, BoardDto dto, MultipartFile uploadFile) {
		logger.info("admin_writeBoard 호출 {}.", locale);
		logger.info("파일 이름: {}.", uploadFile.getOriginalFilename());
		logger.info("파일 용량: {}.", uploadFile.getSize());
		dto.setQna_fileName(boardService.saveFile(uploadFile)); // 파일을 업로드하고 파일명을 저장
		boolean success = boardService.insert(dto);
		if (success) {
			System.out.println("글추가 성공");
			return "redirect:admin_board.do";
		} else {
			System.out.println("글추가 실패");
			return "redirect:admin_board.do";
		}
	}
	
	// 글수정 폼으로 이동
	@RequestMapping(value = "/admin_updateForm.do", method = RequestMethod.GET)
	public String admin_updateForm(Locale locale, Model model, int seq) {
		logger.info("admin_updateForm 호출 {}.", locale);
		
		BoardDto dto = boardService.selectOne(seq);
		model.addAttribute("boarddetail", dto);
		
		return "board/admin_updateForm";
	}
	
	// 글수정 후 update
	@RequestMapping(value = "/admin_updateBoard.do", method = RequestMethod.POST)
	public String admin_updateBoard(Locale locale, Model model, BoardDto dto, MultipartFile uploadFile) {
		logger.info("admin_updateBoard 호출 {}.", locale);
		logger.info("파일 이름: {}.", uploadFile.getOriginalFilename());
		logger.info("파일 용량: {}.", uploadFile.getSize());
		
		dto.setQna_fileName(boardService.saveFile(uploadFile)); // 수정폼에서 파일업로드 할 경우
		boolean success = boardService.updateBoard(dto);
		if (success) {
			System.out.println("글수정 성공");
			return "redirect:admin_boarddetail.do?seq=" + dto.getQna_seq();
		} else {
			System.out.println("글수정 실패");
			return "redirect:admin_board.do";
		} 
	}
	
/*	// 답글달기
	@RequestMapping(value = "/admin_replyForm.do", method = RequestMethod.GET)
	public String admin_replyForm(Locale locale, Model model, int seq) {
		logger.info("admin_replyForm 호출 {}.", locale);
		
		model.addAttribute("seq", seq);
		
		return "board/admin_replyForm";
	}*/
	
	@RequestMapping(value = "/admin_replyBoard.do", method = RequestMethod.POST)
	public String admin_replyBoard(Locale locale, Model model, int seq, BoardDto dto, MultipartFile uploadFile) {
		logger.info("admin_writeBoard 호출 {}.", locale);
		logger.info("파일 이름: {}.", uploadFile.getOriginalFilename());
		logger.info("파일 용량: {}.", uploadFile.getSize());
		dto.setQna_fileName(boardService.saveFile(uploadFile)); // 파일을 업로드하고 파일명을 저장
		dto.setQna_refer(seq);
		boolean success = boardService.insert(dto);
		if (success) {
			System.out.println("글추가 성공");
			return "redirect:admin_board.do";
		} else {
			System.out.println("글추가 실패");
			return "redirect:admin_board.do";
		}
	}
	
	// 검색기능(공통)
	@RequestMapping(value = "/searchBoard.do", method = RequestMethod.POST)
	public String search(Locale locale, Model model,
			@RequestParam(defaultValue="1") int section, @RequestParam(defaultValue="1") int curPage,
			@RequestParam(defaultValue="title") String searchType, @RequestParam(defaultValue="") String keyword) {
		logger.info("searchBoard 호출 {}.", locale);
		
		// 검색 글 수 조회
		int searchArticles = boardService.selectBoardSearchListCnt(searchType, keyword);
		//전체리스트 출력
		List<BoardDto> list = boardService.selectSearchList(section, curPage, searchType, keyword);
		
		model.addAttribute("searchArticles", list);
		model.addAttribute("searchCount", searchArticles);
		model.addAttribute("section", section);
		model.addAttribute("curPage", curPage);
		
		return "board/boardSearch";
	}
}
