package com.hk.one.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		return sqlSession.selectList(namespace+"getAllBoard");
	}

	@Override
	public boolean insert(BoardDto dto) {
		int success = sqlSession.insert(namespace+"insertBoard", dto);
		return success > 0 ? true:false;
	}

	@Override
	public boolean delete(int seq) {
		int success = sqlSession.update(namespace+"deleteBoard", seq);
		return success > 0 ? true:false;
	}

	@Override
	public BoardDto selectOne(int seq) {
		return sqlSession.selectOne(namespace+"selectOneBoard", seq);
	}

	@Override
	public boolean updateBoard(BoardDto dto) {
		int success = sqlSession.update(namespace+"updateBoard", dto);
		return success > 0 ? true:false;
	}

	@Override
	public boolean mulDel(String[] seq) {
		Map<String, String[]> map = new HashMap<String, String[]>();
		map.put("nos", seq);
		int success = sqlSession.update(namespace+"mulDelBoard", map);
		return success > 0 ? true:false;
	}

}
