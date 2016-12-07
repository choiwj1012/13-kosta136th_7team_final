package com.kosta136th.user;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAOImpl implements UserDAO{
	@Inject
	private SqlSession session;
	private static String namespace = "com.kosta136th.mappers.UserMapper";
	
	@Override
	public LoginSessionDTO signinEmail(LoginEmailDTO loginEmailDTO) throws Exception {
		// TODO Auto-generated method stub
		LoginSessionDTO loginSessionDTO = null;
		loginSessionDTO = session.selectOne(namespace + ".getLoginProfileByEmail", loginEmailDTO);
		return loginSessionDTO;
	}
	
	@Override
	public boolean signupEmail(LoginEmailDTO loginEmailDTO) {
		// TODO Auto-generated method stub
		int affectedRows = 0;
		boolean signupSuccess = false;
		System.out.println(loginEmailDTO.getEmail());
		
		affectedRows = session.insert(namespace + ".insertLoginProfileByEmail", loginEmailDTO);
		
		if (affectedRows > 0){
			signupSuccess = true;
		}else{
			signupSuccess = false;
		}
		
		return signupSuccess;
	}
}
