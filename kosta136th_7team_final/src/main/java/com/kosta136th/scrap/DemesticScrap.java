package com.kosta136th.scrap;

public class DemesticScrap {
	private int user_num;
	private String title;
	private String originallink;
	private String link;
	private String description;
	private String pubDate;
	private String keyword;
	
	public int getUser_num() {
		return user_num;
	}
	public void setUser_num(int user_num) {
		this.user_num = user_num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getOriginallink() {
		return originallink;
	}
	public void setOriginallink(String originallink) {
		this.originallink = originallink;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getPubDate() {
		return pubDate;
	}
	public void setPubDate(String pubDate) {
		this.pubDate = pubDate;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	@Override
	public String toString() {
		return "DomesticScrap [user_num=" + user_num + ", title=" + title + ", originallink=" + originallink + ", link="
				+ link + ", description=" + description + ", pubDate=" + pubDate + ", keyword=" + keyword + "]";
	}
	
	
}
