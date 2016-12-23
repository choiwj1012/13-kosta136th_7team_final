package com.kosta136th.user;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kosta136th.myPage.ChangePassword;

@Service
public class UserServiceImpl implements UserService{

	@Inject
	private UserDAO userDAO;
	
	@Override
	public String checkEmailDuplication(String email) throws Exception {
		String email_state;
		
		email_state = userDAO.checkEmailDuplication(email);
	
		return email_state;
	}

	@Override
	public String signupEmail(User userInfo, String register_type_code) throws Exception {
		String signupSuccess = null;
		
		signupSuccess = userDAO.signupEmail(userInfo, register_type_code);
		
		return signupSuccess;
	}

	@Override
	public LoginInfo signinEmail(User user) throws Exception {
		return userDAO.signinEmail(user);
	}

	@Override
	public boolean signout(User user) throws Exception {
		return userDAO.signout(user);
	}

	@Override
	public boolean updateUserPassword(User user) throws Exception {
		boolean updateUserPasswordSuccess;
		
		updateUserPasswordSuccess = userDAO.updateUserPassword(user);
		
		return updateUserPasswordSuccess;
		
	}

	@Override
	public String getUserNickName(String email) throws Exception {
		
		return userDAO.getUserNickName(email);
	}

	@Override
	public void changeNickName(User user) throws Exception {
		userDAO.changeNickName(user);
		
	}

	@Override
	public String changePassword(ChangePassword userInfo) throws Exception {
		
		return userDAO.changePassword(userInfo);
	}
	
}
