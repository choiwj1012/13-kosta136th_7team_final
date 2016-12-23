package com.kosta136th.user;

import com.kosta136th.myPage.ChangePassword;

public interface UserService {
	
	public String checkEmailDuplication(String email) throws Exception;

	public String signupEmail(User userInfo, String register_type_code) throws Exception;

	public LoginInfo signinEmail(User user) throws Exception;

	public boolean signout(User user) throws Exception;

	public boolean updateUserPassword(User user) throws Exception;

	public String getUserNickName(String email) throws Exception;

	public void changeNickName(User user) throws Exception;

	public String changePassword(ChangePassword userInfo) throws Exception;

}
