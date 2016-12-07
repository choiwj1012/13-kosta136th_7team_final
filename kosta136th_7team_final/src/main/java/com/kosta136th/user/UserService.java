package com.kosta136th.user;

public interface UserService {
	public LoginSessionDTO signinEmail(LoginEmailDTO loginEmailDTO) throws Exception;
	public boolean signupEmail(LoginEmailDTO loginEmailDTO) throws Exception;
}
