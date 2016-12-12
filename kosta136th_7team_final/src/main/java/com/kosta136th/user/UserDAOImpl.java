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
	public User signinEmail(User signinEmailVO) throws Exception {
		
		//DAO의 반환은 DTO
		User signinSessionDTO = null;
		
		//로그
		System.out.println("--DAOImpl Before--");
		System.out.println(signinEmailVO.toString());
		signinEmailVO.setPassword(encryptPasswordSHA256(signinEmailVO.getPassword()));
		System.out.println(signinEmailVO.toString());
				
		try {
			signinSessionDTO = session.selectOne(namespace + ".getLoginProfileByEmail", signinEmailVO);
		} catch(Exception e){
			e.printStackTrace();
		}
		
		//로그
		System.out.println("--DAOImpl After--");
		
		if (signinSessionDTO != null){
	    	System.out.println(signinSessionDTO.toString());
		}else{
			System.out.println("User [null]");
		}
		
		return signinSessionDTO;
		
	}
	
	//쓸 필드가 이메일 뿐이므로 네이버 로그인은 딱히 객체를 만들 필요가 없어.
	@Override
	public User signinNaver(String email) throws Exception {
		//DAO의 반환은 DTO
		User signinSessionDTO = null;
		
		//로그
		System.out.println("--DAOImpl Before--");
		System.out.println(email);
				
		try{
			signinSessionDTO = session.selectOne(namespace+".getLoginProfileByNaver", email);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//로그
		System.out.println("--DAOImpl After--");
		
		if (signinSessionDTO != null){
	    	System.out.println(signinSessionDTO.toString());
		}else{
			System.out.println("User [null]");
		}
		
		return signinSessionDTO;	
	}
	
	@Override
	public boolean signupEmail(User signinEmailVO) throws Exception {

		int affectedRows = 0;
		boolean signupSuccess = false;
		
		//로그
		System.out.println("--DAOImpl--");
		System.out.println(signinEmailVO.toString());
		signinEmailVO.setPassword(encryptPasswordSHA256(signinEmailVO.getPassword()));
		System.out.println(signinEmailVO.toString());
		
		try{
			affectedRows = session.insert(namespace + ".insertLoginProfileByEmail", signinEmailVO);
		}catch(Exception e){
			e.printStackTrace();
			affectedRows = 0;			
		}
		
		if (affectedRows > 0){
			signupSuccess = true;
		}else{
			signupSuccess = false;
		}
		
		return signupSuccess;
	}
	
	@Override
	public boolean signupNaver(User signupNaverVO) throws Exception {
		int affectedRows = 0;
		boolean signupSuccess = false;
		
		//로그
		System.out.println("--DAOImpl--");
		System.out.println(signupNaverVO.toString());
		
		try{
			affectedRows = session.insert(namespace + ".insertLoginProfileByNaver", signupNaverVO);
		}catch(Exception e){
			e.printStackTrace();
			affectedRows = 0;
		}
		
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
		
		//로그
		System.out.print("해쉬값 : ");
		
		for (int i = 0; i < hash.length; i++){
			System.out.print(hash[i]);
		}
		System.out.println();
		
		encryptedPassword = DatatypeConverter.printHexBinary(hash);
		
		//로그
		System.out.println(encryptedPassword);
		
		return encryptedPassword;
	}

	@Override
	public String checkEmailDuplication(String email) throws Exception {
		String email_state;
		//email_state = 0 : DB에 있는 이메일
		//email_state = 1 : DB에 없는 이메일
		//email_state = 2 : 기타

		User userEmail = null;
		
		try{
			userEmail = session.selectOne(namespace+".isEmailDuplicate", email);
			
			if (userEmail != null){
				email_state = "0";	//나오면 DB에 있다(0)
			}else{
				email_state = "1"; //안 나오면 DB에 없다(1)
			}
			
		}catch(Exception e){
			e.printStackTrace();
			email_state = "2";
		}
		
		return email_state;
	}

	@Override
	public String checkNicknameDuplication(String nickname) throws Exception {
		String nickname_state;
		//nickname_state = 0 : DB에 있는 이메일
		//nickname_state = 1 : DB에 없는 이메일
		//nickname_state = 2 : 기타
		System.out.println("nickname : " + nickname);
		
		User userNickname = null;
		
		try {
			userNickname = session.selectOne(namespace+".isNicknameDuplicate", nickname);
			if (userNickname != null){
				nickname_state = "0";	//나오면 DB에 있다(0)
			}else{
				nickname_state = "1"; //안 나오면 DB에 없다(1)
			}
		} catch (Exception e) {
			e.printStackTrace();
			nickname_state = "2";
		}
		return nickname_state;
	}

	@Override
	public boolean updateUserPassword(User userVO) throws Exception {
		int affectedRows = 0;
		boolean updateUserPasswordSuccess = false;
		
		//로그
		System.out.println("--DAOImpl--");
		System.out.println(userVO.toString());
		
		userVO.setPassword(encryptPasswordSHA256(userVO.getPassword()));

		try{
			affectedRows = session.insert(namespace + ".updateUserPassword", userVO);
		}catch(Exception e){
			e.printStackTrace();
			affectedRows = 0;
		}
		
		if (affectedRows > 0){
			updateUserPasswordSuccess = true;
		}else{
			updateUserPasswordSuccess = false;
		}
		
		return updateUserPasswordSuccess;
	}
		
}