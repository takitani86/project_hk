package com.hk.one.service;

import java.util.List;

import com.hk.one.dto.MemberDto;

public interface IMemberService {

	public List<MemberDto> getAllMember(); //전체멤버보기
	public MemberDto getMember(String mem_id); //멤버상세보기
	
	public boolean joinMember(MemberDto memberDto); //회원가입
	public boolean deleteMember(String mem_id); //회원탈퇴
	public boolean updateMember(MemberDto memberDto); //회원정보 수정
	public MemberDto existMember(String mem_id, String mem_pw); //회원 존재 확인
	public boolean checkIdMember(String mem_id); //아이디 중복 확인
	public boolean checkEmailMember(String mem_email); //이메일 중복 확인
	public List<MemberDto> searchMember(String searchOption, String keyword) throws Exception; //회원 조회 기능
	public int countArticle(String searchOption, String keyword) throws Exception; //조회 결과 개수 확인
}
