package com.hk.one.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.one.dao.ICommentDao;
import com.hk.one.dto.CommentDto;

@Service
public class CommentService implements ICommentService {

	@Autowired
	private ICommentDao commentDao;
	
	@Override
	public int commentCount() {
		return commentDao.commentCount();
	}

	@Override
	public List<CommentDto> commentList(int seq) {
		return commentDao.commentList(seq);
	}

	@Override
	public boolean commentInsert(CommentDto dto) {
		return commentDao.commentInsert(dto);
	}

	@Override
	public boolean commentUpdate(CommentDto dto) {
		return commentDao.commentUpdate(dto);
	}

	@Override
	public boolean commentDelete(int seq) {
		return commentDao.commentDelete(seq);
	}

}
