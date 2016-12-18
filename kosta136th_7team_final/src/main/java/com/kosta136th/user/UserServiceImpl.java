package com.kosta136th.user;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

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
	
}
