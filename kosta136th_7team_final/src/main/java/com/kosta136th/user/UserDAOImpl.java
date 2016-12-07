package com.kosta136th.user;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAOImpl implements UserDAO{
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "com.kosta136th.mapper.userMapper";
	
	@Override
	public User signinEmail(User loginEmailDTO) throws Exception {
		
		User loginSessionDTO = null;
		
		loginSessionDTO = session.selectOne(namespace + ".getLoginProfileByEmail", loginEmailDTO);
		
		return loginSessionDTO;
		
	}
	
	@Override
	public boolean signupEmail(User loginEmailDTO) {

		int affectedRows = 0;
		boolean signupSuccess = false;
		System.out.println(loginEmailDTO.getEmail());
		System.out.println(loginEmailDTO.getPassword());
		System.out.println(loginEmailDTO.getNickname());
		affectedRows = session.insert(namespace + ".insertLoginProfileByEmail", loginEmailDTO);
		if (affectedRows > 0){
			signupSuccess = true;
		}else{
			signupSuccess = false;
		}
		
		return signupSuccess;
	}
}
