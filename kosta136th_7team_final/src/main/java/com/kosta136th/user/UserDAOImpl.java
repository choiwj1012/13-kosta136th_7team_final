package com.kosta136th.user;

import java.security.MessageDigest;

import javax.inject.Inject;
import javax.xml.bind.DatatypeConverter;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAOImpl implements UserDAO{
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "com.kosta136th.mapper.UserMapper";
	
	@Override
	public User signinEmail(User loginEmailDTO) throws Exception {
		
		User loginSessionDTO = null;
		loginEmailDTO.setPassword(encryptPasswordSHA256(loginEmailDTO.getPassword()));
		loginSessionDTO = session.selectOne(namespace + ".getLoginProfileByEmail", loginEmailDTO);
		System.out.println(loginSessionDTO.getEmail());
		System.out.println(loginSessionDTO.getNickname());
		return loginSessionDTO;
		
	}
	
	@Override
	public boolean signupEmail(User loginEmailDTO) throws Exception {

		int affectedRows = 0;
		boolean signupSuccess = false;
		System.out.println(loginEmailDTO.getEmail());
		System.out.println(loginEmailDTO.getPassword());
		loginEmailDTO.setPassword(encryptPasswordSHA256(loginEmailDTO.getPassword()));
		System.out.println(loginEmailDTO.getNickname());
		affectedRows = session.insert(namespace + ".insertLoginProfileByEmail", loginEmailDTO);
		if (affectedRows > 0){
			signupSuccess = true;
		}else{
			signupSuccess = false;
		}
		
		return signupSuccess;
	}

	@Override
	public String encryptPasswordSHA256(String password) throws Exception {
		
		String encryptedPassword;

		MessageDigest digest = null;
		digest = MessageDigest.getInstance("SHA-256");
		byte[] hash = digest.digest(password.getBytes("UTF-8"));
		
		System.out.print("해쉬값 : ");
		for (int i = 0; i < hash.length; i++){
			System.out.print(hash[i]);
		}
		System.out.println();
		
		encryptedPassword = DatatypeConverter.printHexBinary(hash);
		System.out.println(encryptedPassword);
		
		return encryptedPassword;
	}
		
}
