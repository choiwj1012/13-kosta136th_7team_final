package com.kosta136th.freeBoard;

import java.util.Date;

public class FreeBoard {

	private Integer freeBoard_Num;
	private String title;
	private String content;
	private String writer;
	private Date regdate;
	private int viewCnt;
	private int replyCnt;
	
	
	public Integer getFreeBoard_Num() {
		return freeBoard_Num;
	}
	public void setFreeBoard_Num(Integer freeBoard_Num) {
		this.freeBoard_Num = freeBoard_Num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}
	public int getReplyCnt() {
		return replyCnt;
	}
	public void setReplyCnt(int replyCnt) {
		this.replyCnt = replyCnt;
	}
	
	@Override
	public String toString() {
		return "freeBoard [freeBoard_Num=" + freeBoard_Num + ", title=" + title + ", content="
				+ content + ", writer=" + writer + ", regdate=" + regdate
				+ ", viewCnt=" + viewCnt + "]";
	}
}
