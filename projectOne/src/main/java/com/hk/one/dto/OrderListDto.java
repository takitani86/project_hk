package com.hk.one.dto;

import java.util.Date;

public class OrderListDto {
	private int ord_num;
	private int ord_billnum;
	private Date ord_date;
	private String ord_id;
	private int ord_pronum;
	private int ord_proprice;
	
	
	
	public OrderListDto() {
		super();
	}

	public OrderListDto(int ord_num, int ord_billnum, Date ord_date, String ord_id, int ord_pronum, int ord_proprice) {
		super();
		this.ord_num = ord_num;
		this.ord_billnum = ord_billnum;
		this.ord_date = ord_date;
		this.ord_id = ord_id;
		this.ord_pronum = ord_pronum;
		this.ord_proprice = ord_proprice;
	}
	
	public int getOrd_num() {
		return ord_num;
	}
	public void setOrd_num(int ord_num) {
		this.ord_num = ord_num;
	}
	public int getOrd_billnum() {
		return ord_billnum;
	}
	public void setOrd_billnum(int ord_billnum) {
		this.ord_billnum = ord_billnum;
	}
	public Date getOrd_date() {
		return ord_date;
	}
	public void setOrd_date(Date ord_date) {
		this.ord_date = ord_date;
	}
	public String getOrd_id() {
		return ord_id;
	}
	public void setOrd_id(String ord_id) {
		this.ord_id = ord_id;
	}
	public int getOrd_pronum() {
		return ord_pronum;
	}
	public void setOrd_pronum(int ord_pronum) {
		this.ord_pronum = ord_pronum;
	}
	public int getOrd_proprice() {
		return ord_proprice;
	}
	public void setOrd_proprice(int ord_proprice) {
		this.ord_proprice = ord_proprice;
	}

	@Override
	public String toString() {
		return "OrderListDto [ord_num=" + ord_num + ", ord_billnum=" + ord_billnum + ", ord_date=" + ord_date
				+ ", ord_id=" + ord_id + ", ord_pronum=" + ord_pronum + ", ord_proprice=" + ord_proprice
				+ ", getOrd_num()=" + getOrd_num() + ", getOrd_billnum()=" + getOrd_billnum() + ", getOrd_date()="
				+ getOrd_date() + ", getOrd_id()=" + getOrd_id() + ", getOrd_pronum()=" + getOrd_pronum()
				+ ", getOrd_proprice()=" + getOrd_proprice() + ", getClass()=" + getClass() + ", hashCode()="
				+ hashCode() + ", toString()=" + super.toString() + "]";
	}
	
	
	
}
