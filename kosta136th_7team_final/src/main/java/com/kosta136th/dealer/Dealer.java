package com.kosta136th.dealer;

public class Dealer {

	private int dealer_page_num; 
	private int user_num;
	private String category;
	private int like_count;
	private int disLike_count;
	private String user_email;
	private String user_nickName;
	private int score;
	
	
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public String getUser_nickName() {
		return user_nickName;
	}
	public void setUser_nickName(String user_nickName) {
		this.user_nickName = user_nickName;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public int getDealer_page_num() {
		return dealer_page_num;
	}
	public void setDealer_page_num(int dealer_page_num) {
		this.dealer_page_num = dealer_page_num;
	}
	public int getUser_num() {
		return user_num;
	}
	public void setUser_num(int user_num) {
		this.user_num = user_num;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getLike_count() {
		return like_count;
	}
	public void setLike_count(int like_count) {
		this.like_count = like_count;
	}
	public int getDisLike_count() {
		return disLike_count;
	}
	public void setDisLike_count(int disLike_count) {
		this.disLike_count = disLike_count;
	}
	
	
}
