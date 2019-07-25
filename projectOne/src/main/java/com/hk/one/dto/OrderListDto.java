package com.hk.one.dto;

import java.util.Date;

public class OrderListDto {
	private int ord_num;
	private long ord_bill;
	private Date ord_date;
	private String ord_id;
	private int ord_pronum;
	private int ord_proprice;
	
	
	public OrderListDto() {
		super();
	}

	public OrderListDto(String ord_id, long uid, int ord_pronum, int ord_proprice) {
		this.ord_id=ord_id;
		this.ord_bill=uid;
		this.ord_pronum=ord_pronum;
		this.ord_proprice=ord_proprice;
	}

	public OrderListDto(int ord_num, long ord_bill, Date ord_date, String ord_id, int ord_pronum, int ord_proprice) {
		super();
		this.ord_num = ord_num;
		this.ord_bill = ord_bill;
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
	public long getord_bill() {
		return ord_bill;
	}
	public void setord_bill(long ord_bill) {
		this.ord_bill = ord_bill;
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
		return "OrderListDto [ord_num=" + ord_num + ", ord_bill=" + ord_bill + ", ord_date=" + ord_date
				+ ", ord_id=" + ord_id + ", ord_pronum=" + ord_pronum + ", ord_proprice=" + ord_proprice
				+ ", getOrd_num()=" + getOrd_num() + ", getord_bill()=" + getord_bill() + ", getOrd_date()="
				+ getOrd_date() + ", getOrd_id()=" + getOrd_id() + ", getOrd_pronum()=" + getOrd_pronum()
				+ ", getOrd_proprice()=" + getOrd_proprice() + ", getClass()=" + getClass() + ", hashCode()="
				+ hashCode() + ", toString()=" + super.toString() + "]";
	}
	
	
	
}
