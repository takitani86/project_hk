package com.hk.one.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.one.dao.IMemberDao;
import com.hk.one.dao.MemberDao;
import com.hk.one.dto.MemberDto;

@Service
public class MemberService implements IMemberService {
	
	@Autowired
	private IMemberDao memberDao;

	@Override
	public List<MemberDto> getAllMember() {
		return memberDao.getAllMember();
	}

	@Override
	public MemberDto getMember(String mem_id) {
		return memberDao.getMember(mem_id);
	}

	@Override
	public boolean joinMember(MemberDto memberDto) {
		return memberDao.joinMember(memberDto);
	}

	@Override
	public boolean deleteMember(String mem_id) {
		return memberDao.deleteMember(mem_id);
	}

	@Override
	public boolean updateMember(MemberDto memberDto) {
		return memberDao.updateMember(memberDto);
	}

	@Override
	public MemberDto existMember(String mem_id, String mem_pw) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberDto checkIdMember(String mem_id) throws Exception {
		return memberDao.checkIdMember(mem_id);
	}

	@Override
	public MemberDto checkEmailMember(String mem_email) throws Exception {
		return memberDao.checkEmailMember(mem_email);
	}
	
	@Override
	public List<MemberDto> searchMember(String searchOption, String keyword) throws Exception {
		return memberDao.searchMember(searchOption, keyword);
	}
	
	@Override
	public int countArticle(String searchOption, String keyword) throws Exception {
		return memberDao.countArticle(searchOption, keyword);
	}
	
	 @Override
	public MemberDto findPw(Map<String, Object> paramMap) throws Exception {
		
	}

}
