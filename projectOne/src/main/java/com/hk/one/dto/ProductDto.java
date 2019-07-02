package com.hk.one.dto;

import java.util.Date;

public class ProductDto {
	//식별자
	private int cat_seq;
	
	//카테고리 조인시 사용할 멤버필드
	private String cat_name;
	private String mem_id;
	private int cat_isdel;
	
	//상품 멤버필드
	private int pro_seq;
	private String pro_name;
	private String pro_image;
	private int pro_price;
	private String pro_desc;
	private String pro_option;
	private int pro_menu;
	private Date pro_regdate;
	
	public ProductDto() {
		super();
	}
	
	public ProductDto(int cat_seq, String cat_name, String mem_id, int cat_isdel, int pro_seq, String pro_name,
			String pro_image, int pro_price, String pro_desc, String pro_option, int pro_menu, Date pro_regdate) {
		super();
		this.cat_seq = cat_seq;
		this.cat_name = cat_name;
		this.mem_id = mem_id;
		this.cat_isdel = cat_isdel;
		this.pro_seq = pro_seq;
		this.pro_name = pro_name;
		this.pro_image = pro_image;
		this.pro_price = pro_price;
		this.pro_desc = pro_desc;
		this.pro_option = pro_option;
		this.pro_menu = pro_menu;
		this.pro_regdate = pro_regdate;
	}
	
	public int getCat_seq() {
		return cat_seq;
	}
	public void setCat_seq(int cat_seq) {
		this.cat_seq = cat_seq;
	}
	public String getCat_name() {
		return cat_name;
	}
	public void setCat_name(String cat_name) {
		this.cat_name = cat_name;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public int getCat_isdel() {
		return cat_isdel;
	}
	public void setCat_isdel(int cat_isdel) {
		this.cat_isdel = cat_isdel;
	}
	public int getPro_seq() {
		return pro_seq;
	}
	public void setPro_seq(int pro_seq) {
		this.pro_seq = pro_seq;
	}
	public String getPro_name() {
		return pro_name;
	}
	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}
	public String getPro_image() {
		return pro_image;
	}
	public void setPro_image(String pro_image) {
		this.pro_image = pro_image;
	}
	public int getPro_price() {
		return pro_price;
	}
	public void setPro_price(int pro_price) {
		this.pro_price = pro_price;
	}
	public String getPro_desc() {
		return pro_desc;
	}
	public void setPro_desc(String pro_desc) {
		this.pro_desc = pro_desc;
	}
	public String getPro_option() {
		return pro_option;
	}
	public void setPro_option(String pro_option) {
		this.pro_option = pro_option;
	}
	public int getPro_menu() {
		return pro_menu;
	}
	public void setPro_menu(int pro_menu) {
		this.pro_menu = pro_menu;
	}
	public Date getPro_regdate() {
		return pro_regdate;
	}
	public void setPro_regdate(Date pro_regdate) {
		this.pro_regdate = pro_regdate;
	}

	@Override
	public String toString() {
		return "ProductDto [cat_seq=" + cat_seq + ", cat_name=" + cat_name + ", mem_id=" + mem_id + ", cat_isdel="
				+ cat_isdel + ", pro_seq=" + pro_seq + ", pro_name=" + pro_name + ", pro_image=" + pro_image
				+ ", pro_price=" + pro_price + ", pro_desc=" + pro_desc + ", pro_option=" + pro_option + ", pro_menu="
				+ pro_menu + ", pro_regdate=" + pro_regdate + "]";
	}
	
}
