package com.kosta136th.user;

public class LoginInfo {
	
	private String USER_EMAIL;
	private String REGISTER_TYPE_CODE;
	private String USER_NICKNAME;
	
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
	public String getUSER_NICKNAME() {
		return USER_NICKNAME;
	}
	public void setUSER_NICKNAME(String uSER_NICKNAME) {
		USER_NICKNAME = uSER_NICKNAME;
	}
	
	@Override
	public String toString() {
		return "LoginInfo [USER_EMAIL=" + USER_EMAIL + ", REGISTER_TYPE_CODE=" + REGISTER_TYPE_CODE + "]";
	}

}
