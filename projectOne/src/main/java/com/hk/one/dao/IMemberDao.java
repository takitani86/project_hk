package com.hk.one.dao;

import java.util.List;

import com.hk.one.dto.MemberDto;

public interface IMemberDao {
	
	public List<MemberDto> getAllMember(); //전체멤버보기
	public MemberDto getMember(int mem_seq); //멤버상세보기
	
	public boolean joinMember(MemberDto memberDto); //회원가입
	public boolean deleteMember(int mem_seq); //회원탈퇴
	public boolean updateMember(MemberDto memberDto); //회원정보 수정
	public MemberDto existMember(String mem_id, String mem_pw); //회원 존재 확인
	public boolean checkIdMember(String mem_id); //아이디 중복 확인
	public boolean checkEmailMember(String mem_email); //이메일 중복 확인
	
}
