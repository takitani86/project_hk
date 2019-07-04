package com.hk.one;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hk.one.dto.CommentDto;
import com.hk.one.service.ICommentService;

@Controller
public class CommentController {

	@Autowired
	private ICommentService commentService;

	@RequestMapping("/board/comment.do") // 댓글 리스트
	@ResponseBody
	private List<CommentDto> commentService(Model model) throws Exception {
		
		return commentService.commentList();
	}
	
	@RequestMapping("/board/comment_insert.do")
	@ResponseBody
	private boolean commentInsert(@RequestParam int qna_seq, @RequestParam String com_content) throws Exception {
		
		CommentDto dto = new CommentDto();
		dto.setQna_seq(qna_seq);
		dto.setCom_content(com_content);
		dto.setMem_id("merchant");
		
		return commentService.commentInsert(dto);
	}
	
	@RequestMapping("/board/comment_update.do")
	@ResponseBody
	private boolean commentUpdate(@RequestParam int com_seq, @RequestParam String com_content) throws Exception {
		
		CommentDto dto = new CommentDto();
		dto.setCom_seq(com_seq);
		dto.setCom_content(com_content);
		
		return commentService.commentUpdate(dto);
	}
	
	@RequestMapping("/board/{com_seq}")
	@ResponseBody
	private boolean commentDelete(@RequestParam int com_seq) throws Exception {
		
		return commentService.commentDelete(com_seq);
	}
}
