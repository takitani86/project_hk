package com.hk.one.dto;

public class CategoryDto {
	private int cat_seq;
	private String cat_name;
	private String mem_id;
	private int cat_isdel;
	
	public CategoryDto() {
		super();
	}

	public CategoryDto(int cat_seq, String cat_name, String mem_id, int cat_isdel) {
		super();
		this.cat_seq = cat_seq;
		this.cat_name = cat_name;
		this.mem_id = mem_id;
		this.cat_isdel = cat_isdel;
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

	@Override
	public String toString() {
		return "CategoryDto [cat_seq=" + cat_seq + ", cat_name=" + cat_name + ", mem_id=" + mem_id + ", cat_isdel="
				+ cat_isdel + "]";
	}
	
	
}
