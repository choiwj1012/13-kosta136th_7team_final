package com.kosta136th.freeBoard;

import java.util.Date;

public class FreeBoard {

	private Integer freeBoard_Num;
	private String title;
	private String content;
	private String writer;
	private Date regi_date;
	private int view_count;
	private int reply_count;
	
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
	
	public Date getRegi_date() {
		return regi_date;
	}
	
	public void setRegi_date(Date regi_date) {
		this.regi_date = regi_date;
	}
	
	public int getView_count() {
		return view_count;
	}
	
	public void setView_count(int view_count) {
		this.view_count = view_count;
	}
	
	public int getReply_count() {
		return reply_count;
	}
	
	public void setReply_count(int reply_count) {
		this.reply_count = reply_count;
	}

	@Override
	public String toString() {
		return "FreeBoard [freeBoard_Num=" + freeBoard_Num + ", title=" + title + ", content=" + content + ", writer="
				+ writer + ", regi_date=" + regi_date + ", view_count=" + view_count + ", reply_count=" + reply_count
				+ "]";
	}

}
