package com.kosta136th.user;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService{
	@Inject
	private UserDAO userDAO;
	
	@Override
	public User signinEmail(User loginEmailDTO) throws Exception {
		User loginSessionDTO;
		loginSessionDTO = userDAO.signinEmail(loginEmailDTO);
		return loginSessionDTO;
	}

	@Override
	public boolean signupEmail(User loginEmailDTO) throws Exception {
		
		boolean signupSuccess;
		
		signupSuccess = userDAO.signupEmail(loginEmailDTO);
		
		return signupSuccess;
		
	}

	@Override
	public String checkEmailDuplication(String email) throws Exception{
		
		String email_state;
		
		email_state = userDAO.checkEmailDuplication(email);
	
		return email_state;
	}
	
	@Override
	public String checkNicknameDuplication(String nickname) throws Exception{
		
		String nickname_state;
		
		nickname_state = userDAO.checkNicknameDuplication(nickname);
		
		return nickname_state;
	}

	@Override
	public User signinNaver(String email) throws Exception {
		
		User loginSessionDTO;
		
		loginSessionDTO = userDAO.signinNaver(email);
		
		return loginSessionDTO;
	}

	@Override
	public boolean signupNaver(User signinNaverVO) throws Exception {
		
		boolean signupSuccess;
		
		signupSuccess = userDAO.signupNaver(signinNaverVO);
		
		return signupSuccess;
	}

	@Override
	public boolean updateUserPassword(User userVO) throws Exception {

		boolean updateUserPasswordSuccess;
		
		updateUserPasswordSuccess = userDAO.updateUserPassword(userVO);
		
		return updateUserPasswordSuccess;
	}

	@Override
	public boolean signout(User signoutVO) throws Exception {
		
		boolean updateUserSignoutSuccess;
		
		updateUserSignoutSuccess = userDAO.signout(signoutVO);
		
		return updateUserSignoutSuccess;
	}
}
