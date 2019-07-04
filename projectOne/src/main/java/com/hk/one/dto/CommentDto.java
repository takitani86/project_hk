package com.hk.one.dto;

import java.util.Date;

public class CommentDto {

	private int com_seq;
	private int qna_seq;
	private String com_content;
	private int com_step;
	private String mem_id;
	private Date com_regDate;
	private Date com_updateDate;
	private int com_star;
	private int com_isDel;
	
	public int getCom_seq() {
		return com_seq;
	}
	public void setCom_seq(int com_seq) {
		this.com_seq = com_seq;
	}
	public int getQna_seq() {
		return qna_seq;
	}
	public void setQna_seq(int qna_seq) {
		this.qna_seq = qna_seq;
	}
	public String getCom_content() {
		return com_content;
	}
	public void setCom_content(String com_content) {
		this.com_content = com_content;
	}
	public int getCom_step() {
		return com_step;
	}
	public void setCom_step(int com_step) {
		this.com_step = com_step;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public Date getCom_regDate() {
		return com_regDate;
	}
	public void setCom_regDate(Date com_regDate) {
		this.com_regDate = com_regDate;
	}
	public Date getCom_updateDate() {
		return com_updateDate;
	}
	public void setCom_updateDate(Date com_updateDate) {
		this.com_updateDate = com_updateDate;
	}
	public int getCom_star() {
		return com_star;
	}
	public void setCom_star(int com_star) {
		this.com_star = com_star;
	}
	public int getCom_isDel() {
		return com_isDel;
	}
	public void setCom_isDel(int com_isDel) {
		this.com_isDel = com_isDel;
	}
	
	@Override
	public String toString() {
		return "CommentDto [com_seq=" + com_seq + ", qna_seq=" + qna_seq + ", com_content=" + com_content + ", com_step="
				+ com_step + ", mem_id=" + mem_id + ", com_regDate=" + com_regDate + ", com_updateDate=" + com_updateDate
				+ ", com_star=" + com_star + ", com_isDel=" + com_isDel + "]";
	}
}
