package com.kosta136th.user;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService{
	@Inject
	private UserDAO userDAO;
	
	@Override
	public LoginSessionDTO signinEmail(LoginEmailDTO loginEmailDTO) throws Exception {
		// TODO Auto-generated method stub
		LoginSessionDTO loginSessionDTO = null;
		loginSessionDTO = userDAO.signinEmail(loginEmailDTO);
		return loginSessionDTO;
	}

	@Override
	public boolean signupEmail(LoginEmailDTO loginEmailDTO) throws Exception {
		
		boolean signupSuccess = false;
		
		signupSuccess = userDAO.signupEmail(loginEmailDTO);
		
		return signupSuccess;
		
	}
}
