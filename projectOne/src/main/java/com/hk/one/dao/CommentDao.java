package com.hk.one.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.one.dto.CommentDto;

@Repository
public class CommentDao implements ICommentDao {

	private String namespace = "Comment.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int commentCount() {
		return sqlSession.selectOne(namespace+"comentCount");
	}

	@Override
	public List<CommentDto> commentList(int seq) {
		return sqlSession.selectList(namespace+"commentList", seq);
	}

	@Override
	public boolean commentInsert(CommentDto dto) {
		int success = sqlSession.insert(namespace+"commentInsert", dto);
		return success > 0 ? true:false;
	}

	@Override
	public boolean commentUpdate(CommentDto dto) {
		int success = sqlSession.update(namespace+"commentUpdate", dto);
		return success > 0 ? true:false;
	}

	@Override
	public boolean commentDelete(int seq) {
		int success = sqlSession.update(namespace+"commentDelete", seq);
		return success > 0 ? true:false;
	}
}
