package com.hk.one.security;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.hk.one.dto.MemberDto;

public class CustomUserDetailsService implements UserDetailsService {
	
	private static final Logger logger = LoggerFactory.getLogger(CustomUserDetailsService.class);
	private SqlSessionTemplate sqlSession;
	
	public CustomUserDetailsService() {

	}

	public CustomUserDetailsService(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}


	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

		logger.info("dto실행");
		MemberDto dto = sqlSession.selectOne("Member.getMember", username);

		if (dto == null) {
			logger.info("예외실행"); 
			throw new UsernameNotFoundException(username);
		}
		logger.info("user 실행");
		CustomUserDetails user = new CustomUserDetails();
		user.setSecu_id(dto.getMem_id());
		user.setSecu_pw(dto.getMem_pw());
		user.setSecu_email(dto.getMem_email());
		user.setSecu_name(dto.getMem_name());
		if (dto.getMem_isApprove() == 1) {
			user.setEnabled(true);
		} else {
			user.setEnabled(false);
		}
		if (dto.getMem_isAdmin() == 1) {
			user.setAuth("ROLE_ADMIN");
		} else {
			user.setAuth("ROLE_MEMBER");
		}
		return user;
	}

}