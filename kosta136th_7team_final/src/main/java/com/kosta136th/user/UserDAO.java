package com.kosta136th.user;

public interface UserDAO {
	public User signinEmail(User loginEmailDTO) throws Exception;
	public boolean signupEmail(User loginEmailDTO) throws Exception;
	public String encryptPasswordSHA256(String password) throws Exception;
}
