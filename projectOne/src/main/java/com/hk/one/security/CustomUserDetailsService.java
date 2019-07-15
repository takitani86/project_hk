package com.hk.one.security;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

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
		
		logger.info("사용자 로그인 인증 실행");
		MemberDto dto = sqlSession.selectOne("Member.getMember", username);

		if (dto == null) {
			throw new UsernameNotFoundException(username);
		}
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