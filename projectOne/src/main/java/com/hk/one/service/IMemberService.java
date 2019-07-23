package com.hk.one.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.hk.one.dto.MemberDto;

public interface IMemberService {

	public List<MemberDto> getAllMember(); //전체멤버보기
	public MemberDto getMember(String mem_id); //멤버상세보기
	
	public boolean joinMember(MemberDto memberDto); //회원가입
	public boolean deleteMember(String mem_id); //회원탈퇴
	public boolean updateMember(MemberDto memberDto); //회원정보 수정
	public MemberDto existMember(String mem_id, String mem_pw); //회원 존재 확인
	public MemberDto checkIdMember(String mem_id) throws Exception; //아이디 중복 확인
	public MemberDto checkEmailMember(String mem_email) throws Exception; //이메일 중복 확인
	public List<MemberDto> searchMember(String searchOption, String keyword) throws Exception; //회원 조회 기능
	public int countArticle(String searchOption, String keyword) throws Exception; //조회 결과 개수 확인
	public String findPw(Map<String, Object> paramMap) throws Exception; //비밀번호 찾기 기능
	public List<MemberDto> getEnabledMember(); // 활성화된 멤버 불러오기
	public boolean approveMember(String mem_id);
}
