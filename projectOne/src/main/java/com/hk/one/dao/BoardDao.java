package com.hk.one.dao;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.hk.one.dto.BoardDto;

@Repository
public class BoardDao implements IBoardDao {

	private String namespace = "Board.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private static final String UPLOAD_PATH = "C:\\Users\\HKEDU\\git\\project_hk\\projectOne\\src\\main\\webapp\\resources\\img\\board\\";

	@Override
	public String saveFile(MultipartFile file) {
		// 파일이름 변경
		UUID uuid = UUID.randomUUID();
		String saveName = uuid + "_" + file.getOriginalFilename();
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
	
	@Override
	public List<BoardDto> selectList(int section, int curPage) {
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("section", section);
		map.put("curPage", curPage);
		return sqlSession.selectList(namespace+"getAllBoard", map);
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
	@Override
	public boolean readcount(int seq) {
		int success = sqlSession.update(namespace+"readcount", seq);
		return success > 0 ? true:false;
	}

	@Override
	public int selectBoardListCnt() {
		return sqlSession.selectOne(namespace+"getCount");
	}

	@Override
	public int selectBoardSearchListCnt(String searchType, String keyword) {
		Map<String, String> map = new HashMap<>();
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		return sqlSession.selectOne(namespace+"getSearchCount", map);
	}

	@Override
	public List<BoardDto> selectBoardSearchList(int section, int curPage, String searchType, String keyword) {
			Map<String, Object> map = new HashMap<>();
			map.put("searchType", searchType);
			map.put("keyword", keyword);
			map.put("section", section);
			map.put("curPage", curPage);
		return sqlSession.selectList(namespace+"getSearchResult", map);
	}

}
