package com.kosta136th.user;

public interface UserDAO {
	public LoginSessionDTO signinEmail(LoginEmailDTO loginEmailDTO) throws Exception;
	public boolean signupEmail(LoginEmailDTO loginEmailDTO) throws Exception;
}
