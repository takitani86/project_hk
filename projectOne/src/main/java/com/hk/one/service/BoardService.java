package com.hk.one.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.hk.one.dao.IBoardDao;
import com.hk.one.dto.BoardDto;

@Service
public class BoardService implements IBoardService {

	@Autowired
	private IBoardDao boardDao;

	@Override
	public String saveFile(MultipartFile file) {
		return boardDao.saveFile(file);
	}
	
	@Override
	public List<BoardDto> selectList(int section, int curPage) {
		return boardDao.selectList(section, curPage);
	}

	@Override
	public boolean insert(BoardDto dto) {
		return boardDao.insert(dto);
	}

	@Override
	public boolean delete(int seq) {
		return boardDao.delete(seq);
	}
	
	@Transactional
	@Override
	public BoardDto selectOne(int seq) {
		boardDao.readcount(seq);
		return boardDao.selectOne(seq);
	}

	@Override
	public boolean updateBoard(BoardDto dto) {
		return boardDao.updateBoard(dto);
	}

	@Override
	public boolean mulDel(String[] seq) {
		return boardDao.mulDel(seq);
	}
	
	@Override
	public boolean readcount(int seq) {
		return boardDao.readcount(seq);
	}

	@Override
	public int selectBoardListCnt() {
		return boardDao.selectBoardListCnt();
	}

	@Override
	public int selectBoardSearchListCnt(String searchType, String keyword) {
		return boardDao.selectBoardSearchListCnt(searchType, keyword);
	}

	@Override
	public List<BoardDto> selectSearchList(int section, int curPage, String searchType, String keyword) {
		return boardDao.selectBoardSearchList(section, curPage, searchType, keyword);
	}
}
