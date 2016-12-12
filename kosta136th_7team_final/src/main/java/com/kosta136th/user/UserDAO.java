package com.kosta136th.user;

public interface UserDAO {
	//이메일로그인
	public User signinEmail(User loginEmailVO) throws Exception;
	//이메일가입
	public boolean signupEmail(User loginEmailVO) throws Exception;
	//네이버로그인
	public User signinNaver(String email) throws Exception;
	//네이버가입
	public boolean signupNaver(User signupNaverVO) throws Exception;
	
	//유틸
	public String encryptPasswordSHA256(String password) throws Exception;
	public String checkEmailDuplication(String email) throws Exception;
	public String checkNicknameDuplication(String nickname) throws Exception;
	public boolean updateUserPassword(User userVO) throws Exception;
}
