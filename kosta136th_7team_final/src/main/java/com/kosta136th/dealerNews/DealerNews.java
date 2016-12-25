package com.kosta136th.dealerNews;

import java.util.Date;

public class DealerNews {
	//아래는 VO. 테이블의 요소들을 모두 포함.
	private int dealer_news_num;
	private String title;
	private String content;
	private int user_num;
	private int currentPage = 1;
	private int perPageNum = 8;
	private int perPagebarPage = 5;
	private int firstPage;
	private int lastPage;
	private Date regi_date;

	//아래는 DTO의 요소가 강함.
	//글쓴이는 user_num으로부터 읽어낼 수 있음.
	private String writer;

	public DealerNews() {
	}
	
	public DealerNews(int dealer_news_num, String title, String content) {
		this.dealer_news_num = dealer_news_num;
		this.title = title;
		this.content = content;
	}

	public int getDealer_news_num() {
		return dealer_news_num;
	}

	public void setDealer_news_num(int dealer_news_num) {
		this.dealer_news_num = dealer_news_num;
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

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getPerPageNum() {
		return perPageNum;
	}

	public void setPerPageNum(int perPageNum) {
		this.perPageNum = perPageNum;
	}
	
	
	public int getPerPagebarPage() {
		return perPagebarPage;
	}

	public void setPerPagebarPage(int perPagebarPage) {
		this.perPagebarPage = perPagebarPage;
	}
	
	public int getFirstPage() {
		return firstPage;
	}

	public void setFirstPage(int firstPage) {
		this.firstPage = firstPage;
	}

	public int getLastPage() {
		return lastPage;
	}

	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}
	
	public int getUser_num() {
		return user_num;
	}

	public void setUser_num(int user_num) {
		this.user_num = user_num;
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

	@Override
	public String toString() {
		return "DealerNews [dealer_news_num=" + dealer_news_num + ", title=" + title + ", content=" + content
				+ ", user_num=" + user_num + ", currentPage=" + currentPage + ", perPageNum=" + perPageNum
				+ ", perPagebarPage=" + perPagebarPage + ", firstPage=" + firstPage + ", lastPage=" + lastPage
				+ ", regi_date=" + regi_date + ", writer=" + writer + "]";
	}

}
