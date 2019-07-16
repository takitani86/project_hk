package com.hk.one;

import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hk.one.dto.CommentDto;
import com.hk.one.service.ICommentService;

@Controller
@RequestMapping(value = {"/admin/board/comment", "/member/board/comment"})
public class CommentController {

	private static final Logger logger = LoggerFactory.getLogger(CommentController.class);
	
	@Autowired
	private ICommentService commentService;

	// 댓글 목록
	@RequestMapping("/list.do")
	@ResponseBody
	private List<CommentDto> commentService(Locale locale, Model model, int seq) throws Exception {
		logger.info("commentService 호출 {}.", locale);
		
		return commentService.commentList(seq);
	}
	
	// 댓글 작성
	@RequestMapping("/insert.do")
	@ResponseBody
	private boolean commentInsert(Locale locale, @RequestParam int qna_seq, @RequestParam String com_content) throws Exception {
		logger.info("commentInsert 호출 {}.", locale);
		
		CommentDto dto = new CommentDto();
		dto.setQna_seq(qna_seq);
		dto.setCom_content(com_content);
		dto.setMem_id("merchant");
		
		return commentService.commentInsert(dto);
	}
	
	// 댓글 수정
	@RequestMapping("/update.do")
	@ResponseBody
	private boolean commentUpdate(Locale locale, @RequestParam int com_seq, @RequestParam String com_content) throws Exception {
		logger.info("commentUpdate 호출 {}.", locale);
		
		CommentDto dto = new CommentDto();
		dto.setCom_seq(com_seq);
		dto.setCom_content(com_content);
		
		return commentService.commentUpdate(dto);
	}
	
	// 댓글 삭제 (isdel컬럼을 1로 변경하고 js에서 처리)
	@RequestMapping("/delete.do")
	@ResponseBody
	private boolean commentDelete(Locale locale, int seq) throws Exception {
		logger.info("commentDelete 호출 {}.", locale);
		return commentService.commentDelete(seq);
	}
}
