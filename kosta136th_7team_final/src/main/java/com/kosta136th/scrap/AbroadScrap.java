package com.kosta136th.scrap;

public class AbroadScrap {
	
	private int user_num;
	private String email;
	private String link;
	private String author;
	private String title;
	private String date;
	private String description;
	private String imgSrc;
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
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getImgSrc() {
		return imgSrc;
	}
	public void setImgSrc(String imgSrc) {
		this.imgSrc = imgSrc;
	}
	@Override
	public String toString() {
		return "AbroadScrap [user_num=" + user_num + ", email=" + email + ", link=" + link + ", author=" + author
				+ ", title=" + title + ", date=" + date + ", description=" + description + ", imgSrc=" + imgSrc + "]";
	}
	
	

}

