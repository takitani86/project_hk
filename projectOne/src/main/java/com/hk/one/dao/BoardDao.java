package com.hk.one.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.one.dto.BoardDto;

@Repository
public class BoardDao implements IBoardDao {

	private String namespace = "Board.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<BoardDto> selectList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean insert(BoardDto dto) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete(int seq) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public BoardDto selectOne(int seq) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean updateBoard(BoardDto dto) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean mulDel(String[] seq) {
		// TODO Auto-generated method stub
		return false;
	}

}
