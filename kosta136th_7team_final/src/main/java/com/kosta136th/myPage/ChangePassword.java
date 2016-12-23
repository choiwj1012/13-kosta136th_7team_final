package com.kosta136th.myPage;

public class ChangePassword {
	
	private String USER_EMAIL;
	private String NOW_USER_PASSWORD;
	private String CHANGE_USER_PASSWORD;
	public String getUSER_EMAIL() {
		return USER_EMAIL;
	}
	public void setUSER_EMAIL(String uSER_EMAIL) {
		USER_EMAIL = uSER_EMAIL;
	}
	public String getNOW_USER_PASSWORD() {
		return NOW_USER_PASSWORD;
	}
	public void setNOW_USER_PASSWORD(String nOW_USER_PASSWORD) {
		NOW_USER_PASSWORD = nOW_USER_PASSWORD;
	}
	public String getCHANGE_USER_PASSWORD() {
		return CHANGE_USER_PASSWORD;
	}
	public void setCHANGE_USER_PASSWORD(String cHANGE_USER_PASSWORD) {
		CHANGE_USER_PASSWORD = cHANGE_USER_PASSWORD;
	}
	@Override
	public String toString() {
		return "ChangePassword [USER_EMAIL=" + USER_EMAIL + ", NOW_USER_PASSWORD=" + NOW_USER_PASSWORD
				+ ", CHANGE_USER_PASSWORD=" + CHANGE_USER_PASSWORD + "]";
	}
	
	
	
	
	

}
