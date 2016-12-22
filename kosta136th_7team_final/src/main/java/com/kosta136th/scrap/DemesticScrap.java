package com.kosta136th.scrap;

public class DemesticScrap {
	private int user_num;
	private String email;
	private String title;
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
		return "DemesticScrap [user_num=" + user_num + ", email=" + email + ", title=" + title + ", link=" + link
				+ ", description=" + description + ", pubDate=" + pubDate + ", keyword=" + keyword + "]";
	}

	

	
	
}
