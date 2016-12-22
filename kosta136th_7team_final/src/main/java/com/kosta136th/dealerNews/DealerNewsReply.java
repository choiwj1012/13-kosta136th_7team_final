package com.kosta136th.dealerNews;

import java.util.Date;

public class DealerNewsReply {
	//VO적 요소
	private int dealer_news_num;
	private int reply_num;
	private int user_num;
	private int parent_reply_num;
	private int rank;
	private int indent;
	private String content;
	private Date regi_date;

	//DTO적 요소
	private String writer;
	
	public DealerNewsReply() {
	}

	public int getDealer_news_num() {
		return dealer_news_num;
	}

	public void setDealer_news_num(int dealer_news_num) {
		this.dealer_news_num = dealer_news_num;
	}

	public int getReply_num() {
		return reply_num;
	}

	public void setReply_num(int reply_num) {
		this.reply_num = reply_num;
	}

	public int getParent_reply_num() {
		return parent_reply_num;
	}

	public void setParent_reply_num(int parent_reply_num) {
		this.parent_reply_num = parent_reply_num;
	}

	public int getRank() {
		return rank;
	}

	public void setRank(int rank) {
		this.rank = rank;
	}

	public int getIndent() {
		return indent;
	}

	public void setIndent(int indent) {
		this.indent = indent;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "DealerNewsReply [dealer_news_num=" + dealer_news_num + ", reply_num=" + reply_num + ", user_num="
				+ user_num + ", parent_reply_num=" + parent_reply_num + ", rank=" + rank + ", indent=" + indent
				+ ", content=" + content + ", regi_date=" + regi_date + ", writer=" + writer + "]";
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
	
}
