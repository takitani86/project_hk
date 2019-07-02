package com.hk.one.dto;

import java.util.Date;

public class MemberDto {
	private int mem_seq;
	private String mem_id;
	private String mem_pw;
	private String mem_image;
	private String mem_email;
	private String mem_name;
	private String mem_address;
	private String mem_phone;
	private String mem_b_name;
	private String mem_b_status;
	private int mem_isAdmin;
	private int mem_isApprove;
	private int mem_isDel;
	private Date mem_regDate;
	private Date mem_loginTime;
	private Date mem_logoutTime;
	
	public MemberDto() {
		super();
	}

	public int getMem_seq() {
		return mem_seq;
	}

	public void setMem_seq(int mem_seq) {
		this.mem_seq = mem_seq;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getMem_pw() {
		return mem_pw;
	}

	public void setMem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
	}

	public String getMem_image() {
		return mem_image;
	}

	public void setMem_image(String mem_image) {
		this.mem_image = mem_image;
	}

	public String getMem_email() {
		return mem_email;
	}

	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}

	public String getMem_address() {
		return mem_address;
	}

	public void setMem_address(String mem_address) {
		this.mem_address = mem_address;
	}

	public String getMem_phone() {
		return mem_phone;
	}

	public void setMem_phone(String mem_phone) {
		this.mem_phone = mem_phone;
	}

	public String getMem_b_name() {
		return mem_b_name;
	}

	public void setMem_b_name(String mem_b_name) {
		this.mem_b_name = mem_b_name;
	}

	public String getMem_b_status() {
		return mem_b_status;
	}

	public void setMem_b_status(String mem_b_status) {
		this.mem_b_status = mem_b_status;
	}

	public int getMem_isAdmin() {
		return mem_isAdmin;
	}

	public void setMem_isAdmin(int mem_isAdmin) {
		this.mem_isAdmin = mem_isAdmin;
	}

	public int getMem_isApprove() {
		return mem_isApprove;
	}

	public void setMem_isApprove(int mem_isApprove) {
		this.mem_isApprove = mem_isApprove;
	}

	public int getMem_isDel() {
		return mem_isDel;
	}

	public void setMem_isDel(int mem_isDel) {
		this.mem_isDel = mem_isDel;
	}

	public Date getMem_regDate() {
		return mem_regDate;
	}

	public void setMem_regDate(Date mem_regDate) {
		this.mem_regDate = mem_regDate;
	}

	public Date getMem_loginTime() {
		return mem_loginTime;
	}

	public void setMem_loginTime(Date mem_loginTime) {
		this.mem_loginTime = mem_loginTime;
	}

	public Date getMem_logoutTime() {
		return mem_logoutTime;
	}

	public void setMem_logoutTime(Date mem_logoutTime) {
		this.mem_logoutTime = mem_logoutTime;
	}
	
	@Override
	public String toString() {
		return "MemberDto [mem_seq=" + mem_seq + ", mem_id=" + mem_id + ", mem_pw=" + mem_pw + ", mem_image="
				+ mem_image + ", mem_email=" + mem_email + ", mem_name=" + mem_name + ", mem_address=" + mem_address
				+ ", mem_phone=" + mem_phone + ", mem_b_name=" + mem_b_name + ", mem_b_status=" + mem_b_status
				+ ", mem_isAdmin=" + mem_isAdmin + ", mem_isApprove=" + mem_isApprove + ", mem_isDel=" + mem_isDel
				+ ", mem_regDate=" + mem_regDate + ", mem_loginTime=" + mem_loginTime + ", mem_logoutTime="
				+ mem_logoutTime + "]";
	}

	public MemberDto(int mem_seq, String mem_id, String mem_pw, String mem_image, String mem_email, String mem_name,
			String mem_address, String mem_phone, String mem_b_name, String mem_b_status, int mem_isAdmin,
			int mem_isApprove, int mem_isDel, Date mem_regDate, Date mem_loginTime, Date mem_logoutTime) {
		this.mem_seq = mem_seq;
		this.mem_id = mem_id;
		this.mem_pw = mem_pw;
		this.mem_image = mem_image;
		this.mem_email = mem_email;
		this.mem_name = mem_name;
		this.mem_address = mem_address;
		this.mem_phone = mem_phone;
		this.mem_b_name = mem_b_name;
		this.mem_b_status = mem_b_status;
		this.mem_isAdmin = mem_isAdmin;
		this.mem_isApprove = mem_isApprove;
		this.mem_isDel = mem_isDel;
		this.mem_regDate = mem_regDate;
		this.mem_loginTime = mem_loginTime;
		this.mem_logoutTime = mem_logoutTime;
	}
	
}
