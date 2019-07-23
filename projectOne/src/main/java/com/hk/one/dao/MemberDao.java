package com.hk.one.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.one.dto.MemberDto;

@Repository
public class MemberDao implements IMemberDao {
	
	private String namespace="Member.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;

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
