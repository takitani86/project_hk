package com.hk.one.dao;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.hk.one.dto.MemberDto;

@Repository
public class MemberDao implements IMemberDao {
	
	private String namespace="Member.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private static final String UPLOAD_PATH = "C:\\Users\\HKEDU\\git\\project_hk\\projectOne\\src\\main\\webapp\\resources\\img";

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
	public List<MemberDto> getAllMember() {
		return sqlSession.selectList(namespace + "getAllMember");
	}

	@Override
	public MemberDto getMember(String mem_id) {
		return sqlSession.selectOne(namespace + "getMember", mem_id);
	}

	@Override
	public boolean joinMember(MemberDto member) {
		int count = sqlSession.insert(namespace + "joinMember", member);
		return count>0 ? true:false;
	}

	@Override
	public boolean deleteMember(String mem_id) {
		int count = sqlSession.update(namespace + "deleteMember", mem_id);
		return count>0 ? true:false;
	}

	@Override
	public boolean updateMember(MemberDto member) {
		int count = sqlSession.update(namespace + "updateMember", member);
		return count>0 ? true:false;
	}

	@Override
	public MemberDto existMember(String mem_id, String mem_pw) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberDto checkIdMember(String mem_id) throws Exception {
		return sqlSession.selectOne(namespace + "checkIdMember", mem_id);
	}

	@Override
	public MemberDto checkEmailMember(String mem_email) throws Exception {
		return sqlSession.selectOne(namespace + "checkEmailMember", mem_email);
	}
	
	@Override
	public List<MemberDto> searchMember(String searchOption, String keyword) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		return sqlSession.selectList(namespace + "searchMember", map);
	}
	
	@Override
	public int countArticle(String searchOption, String keyword) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		return sqlSession.selectOne(namespace + "countArticle", map);
	}
	
	@Override
	public String findPw(Map<String, Object> paramMap) throws Exception {
		 String pw = sqlSession.selectOne(namespace + "getPw", paramMap);
		 return pw;
	}

	@Override
	public List<MemberDto> getEnabledMember() {
		return sqlSession.selectList(namespace + "getEnabledMember");
	}

	@Override
	public boolean approveMember(String mem_id) {
		int success = sqlSession.update(namespace + "approveMember", mem_id);
		return success > 0 ? true:false;
	}

}
