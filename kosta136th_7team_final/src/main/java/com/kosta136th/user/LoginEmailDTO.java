package com.kosta136th.user;

public class LoginEmailDTO {
	private String email;
	private String password;
	private String nickname;
	
	public LoginEmailDTO() {
	}

	public LoginEmailDTO(String email, String password, String nickname) {
		this.email = email;
		this.password = password;
		this.nickname = nickname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	@Override
	public String toString() {
		return "LoginSessionDTO [email=" + email + ", password=" + password + ", nickname=" + nickname + "]";
	}
}
