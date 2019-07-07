package com.hk.one.dto;

import java.util.Date;

public class BoardDto {

	private int level;
	private int qna_seq;
	private String qna_title;
	private String qna_content;
	private int qna_refer;
	private int qna_step;
	private int qna_depth;
	private int qna_readCount;
	private int qna_isDel;
	private Date qna_regDate;
	private Date qna_updateDate;
	private String qna_fileName;
	private String qna_fileLocation;
	private String mem_id;
	private int qna_announce;
	private int startIndex;
	private int setCntPerPage;
	
	
	public int getStartIndex() {
		return startIndex;
	}
	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}
	public int getSetCntPerPage() {
		return setCntPerPage;
	}
	public void setSetCntPerPage(int setCntPerPage) {
		this.setCntPerPage = setCntPerPage;
	}
	public int getQna_seq() {
		return qna_seq;
	}
	public void setQna_seq(int qna_seq) {
		this.qna_seq = qna_seq;
	}
	public String getQna_title() {
		return qna_title;
	}
	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}
	public String getQna_content() {
		return qna_content;
	}
	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}
	public int getQna_refer() {
		return qna_refer;
	}
	public void setQna_refer(int qna_refer) {
		this.qna_refer = qna_refer;
	}
	public int getQna_step() {
		return qna_step;
	}
	public void setQna_step(int qna_step) {
		this.qna_step = qna_step;
	}
	public int getQna_depth() {
		return qna_depth;
	}
	public void setQna_depth(int qna_depth) {
		this.qna_depth = qna_depth;
	}
	public int getQna_readCount() {
		return qna_readCount;
	}
	public void setQna_readCount(int qna_readCount) {
		this.qna_readCount = qna_readCount;
	}
	public int getQna_isDel() {
		return qna_isDel;
	}
	public void setQna_isDel(int qna_isDel) {
		this.qna_isDel = qna_isDel;
	}
	public Date getQna_regDate() {
		return qna_regDate;
	}
	public void setQna_regDate(Date qna_regDate) {
		this.qna_regDate = qna_regDate;
	}
	public Date getQna_updateDate() {
		return qna_updateDate;
	}
	public void setQna_updateDate(Date qna_updateDate) {
		this.qna_updateDate = qna_updateDate;
	}
	public String getQna_fileName() {
		return qna_fileName;
	}
	public void setQna_fileName(String qna_fileName) {
		this.qna_fileName = qna_fileName;
	}
	public String getQna_fileLocation() {
		return qna_fileLocation;
	}
	public void setQna_fileLocation(String qna_fileLocation) {
		this.qna_fileLocation = qna_fileLocation;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public int getQna_announce() {
		return qna_announce;
	}
	public void setQna_announce(int qna_announce) {
		this.qna_announce = qna_announce;
	}
	
	@Override
	public String toString() {
		return "BoardDto [qna_seq=" + qna_seq + ", qna_title=" + qna_title + ", qna_content=" + qna_content + ", qna_refer="
				+ qna_refer + ", qna_step=" + qna_step + ", qna_depth=" + qna_depth + ", qna_readCount=" + qna_readCount
				+ ", qna_isDel=" + qna_isDel + ", qna_regDate=" + qna_regDate + ", qna_updateDate=" + qna_updateDate
				+ ", qna_fileName=" + qna_fileName + ", qna_fileLocation=" + qna_fileLocation + ", mem_id=" + mem_id
				+ ", qna_announce=" + qna_announce + "]";
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	
}
