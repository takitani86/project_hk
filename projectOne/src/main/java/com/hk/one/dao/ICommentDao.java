package com.hk.one.dao;

import java.util.List;

import com.hk.one.dto.CommentDto;

public interface ICommentDao {

	// 댓글 개수
	public int commentCount();
	
	// 댓글 목록
	public List<CommentDto> commentList();
	
	// 댓글 작성
	public boolean commentInsert(CommentDto dto);
	
	// 댓글 수정
	public boolean commentUpdate(CommentDto dto);
	
	// 댓글 삭제
	public boolean commentDelete(int seq);
}
