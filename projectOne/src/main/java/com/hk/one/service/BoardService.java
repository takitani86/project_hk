package com.hk.one.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.hk.one.dao.IBoardDao;
import com.hk.one.dto.BoardDto;

@Service
public class BoardService implements IBoardService {

	@Autowired
	private IBoardDao boardDao;
	
	private static final String UPLOAD_PATH = "C:\\Users\\HKEDU\\git\\project_hk1\\projectOne\\src\\main\\webapp\\img";

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
		return UPLOAD_PATH + saveName;
	}
	
	@Override
	public List<BoardDto> selectList() {
		return boardDao.selectList();
	}

	@Override
	public boolean insert(BoardDto dto) {
		return boardDao.insert(dto);
	}

	@Override
	public boolean delete(int seq) {
		return boardDao.delete(seq);
	}

	@Override
	public BoardDto selectOne(int seq) {
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
}
