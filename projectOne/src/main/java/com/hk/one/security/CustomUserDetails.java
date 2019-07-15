package com.hk.one.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

@SuppressWarnings("serial")
public class CustomUserDetails implements UserDetails {

	private String secu_id;
	private String secu_pw;
	private String secu_email;
	private String secu_name;
	private boolean enabled;
	private String auth;
	
	public String getAuth() {
		return auth;
	}

	public void setAuth(String auth) {
		this.auth = auth;
	}

	public String getSecu_id() {
		return secu_id;
	}

	public void setSecu_id(String secu_id) {
		this.secu_id = secu_id;
	}

	public String getSecu_pw() {
		return secu_pw;
	}

	public void setSecu_pw(String secu_pw) {
		this.secu_pw = secu_pw;
	}

	public String getSecu_email() {
		return secu_email;
	}

	public void setSecu_email(String secu_email) {
		this.secu_email = secu_email;
	}

	public String getSecu_name() {
		return secu_name;
	}

	public void setSecu_name(String secu_name) {
		this.secu_name = secu_name;
	}

	public boolean getEnabled() {
		return enabled;

	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		List<GrantedAuthority> authorities = new ArrayList<>();
		authorities.add(new SimpleGrantedAuthority(auth));
		return authorities;
	}

	@Override
	public String getPassword() {
		// TODO Auto-generated method stub
		return secu_pw;
	}

	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return secu_id;
	}

	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return enabled;
	}

}