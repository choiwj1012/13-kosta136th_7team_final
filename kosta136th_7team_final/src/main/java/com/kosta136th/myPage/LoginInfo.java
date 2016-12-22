package com.kosta136th.myPage;

public class LoginInfo {
	
	private String USER_EMAIL;
	private String REGISTER_TYPE_CODE;
	public String getUSER_EMAIL() {
		return USER_EMAIL;
	}
	public void setUSER_EMAIL(String uSER_EMAIL) {
		USER_EMAIL = uSER_EMAIL;
	}
	public String getREGISTER_TYPE_CODE() {
		return REGISTER_TYPE_CODE;
	}
	public void setREGISTER_TYPE_CODE(String rEGISTER_TYPE_CODE) {
		REGISTER_TYPE_CODE = rEGISTER_TYPE_CODE;
	}
	@Override
	public String toString() {
		return "LoginInfo [USER_EMAIL=" + USER_EMAIL + ", REGISTER_TYPE_CODE=" + REGISTER_TYPE_CODE + "]";
	}
	
	

}
