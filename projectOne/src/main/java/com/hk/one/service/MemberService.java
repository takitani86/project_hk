package com.hk.one.service;

import java.util.List;

import com.hk.one.dto.MemberDto;

public class MemberService implements IMemberService {

	@Override
	public List<MemberDto> getAllMember() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberDto getMember(int mem_seq) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean joinMember(MemberDto memberDto) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteMember(int mem_seq) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean updateMember(MemberDto memberDto) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public MemberDto existMember(String mem_id, String mem_pw) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean checkIdMember(String mem_id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean checkEmailMember(String mem_email) {
		// TODO Auto-generated method stub
		return false;
	}

}
