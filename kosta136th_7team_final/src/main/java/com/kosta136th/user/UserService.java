package com.kosta136th.user;

public interface UserService {
	public User signinEmail(User loginEmailDTO) throws Exception;
	public boolean signupEmail(User loginEmailDTO, String register_type_code) throws Exception;
	public String checkEmailDuplication(String email) throws Exception;
	public String checkNicknameDuplication(String nickname) throws Exception;
	public User signinNaver(String email) throws Exception;
	public boolean signout(User signoutVO) throws Exception;
	public boolean signupNaver(User signinNaverVO) throws Exception;
	public boolean updateUserPassword(User userVO) throws Exception;
}
