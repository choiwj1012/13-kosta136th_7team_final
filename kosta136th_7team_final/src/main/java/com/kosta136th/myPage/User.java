package com.kosta136th.myPage;

public class User {

	private int USER_NUM;
	private String USER_EMAIL;
	private String USER_PASSWORD;
	private String USER_NICKNAME;
	
	public User(){}
	
	public User(String USER_EMAIL, String USER_PASSWORD) {
		this.USER_EMAIL = USER_EMAIL;
		this.USER_PASSWORD = USER_PASSWORD;
	}

	public User(String email, String password, String nickname) {
		USER_EMAIL = email;
		USER_PASSWORD = password;
		USER_NICKNAME = nickname;
	}
	
	public int getUSER_NUM() {
		return USER_NUM;
	}
	public void setUSER_NUM(int USER_NUM) {
		this.USER_NUM = USER_NUM;
	}
	public String getUSER_EMAIL() {
		return USER_EMAIL;
	}
	public void setUSER_EMAIL(String USER_EMAIL) {
		this.USER_EMAIL = USER_EMAIL;
	}
	public String getUSER_PASSWORD() {
		return USER_PASSWORD;
	}
	public void setUSER_PASSWORD(String USER_PASSWORD) {
		this.USER_PASSWORD = USER_PASSWORD;
	}
	public String getUSER_NICKNAME() {
		return USER_NICKNAME;
	}
	public void setUSER_NICKNAME(String USER_NICKNAME) {
		this.USER_NICKNAME = USER_NICKNAME;
	}
	@Override
	public String toString() {
		return "User [USER_NUM=" + USER_NUM + ", USER_EMAIL=" + USER_EMAIL + ", USER_PASSWORD=" + USER_PASSWORD
				+ ", USER_NICKNAME=" + USER_NICKNAME + "]";
	}

	
	
	
}
