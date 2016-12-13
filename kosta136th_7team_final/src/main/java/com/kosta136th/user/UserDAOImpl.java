package com.kosta136th.user;

import java.security.MessageDigest;
import java.util.HashMap;
import java.util.Map;

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
			//이메일에 해당하는 회원 정보를 찾아
			signinSessionDTO = session.selectOne(namespace + ".getLoginProfileByEmail", signinEmailVO);
			//회원정보를 로그인 시간에 넣는다
			session.insert(namespace + ".insertUserLoginRecord", signinSessionDTO);
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
	public User signinNaver(String NaverEmail) throws Exception {
		//DAO의 반환은 DTO
		User signinSessionDTO = null;
		
		//로그
		System.out.println("--DAOImpl Before--");
		System.out.println(NaverEmail);
				
		try{
			signinSessionDTO = session.selectOne(namespace+".getLoginProfileByNaver", NaverEmail);
			session.insert(namespace + ".insertUserLoginRecord", signinSessionDTO);
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
	public boolean signupEmail(User signupEmailVO, String register_type_code) throws Exception {

		int affectedRows = 0;
		boolean signupSuccess = false;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("signupVO", signupEmailVO);
		map.put("register_type_code", register_type_code);
		
		//로그
		System.out.println("--DAOImpl--");
		System.out.println(signupEmailVO.toString());
		signupEmailVO.setPassword(encryptPasswordSHA256(signupEmailVO.getPassword()));
		System.out.println(signupEmailVO.toString());
		
		try{
			affectedRows = session.insert(namespace + ".insertLoginProfileByEmail", signupEmailVO);
			//가입과 동시에 로그인
			session.insert(namespace + ".insertUserLoginRecord", signupEmailVO);
			session.insert(namespace + ".insertRegisterType", map);
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
			//가입과 동시에 로그인
			session.insert(namespace + ".insertUserLoginRecord", signupNaverVO);	
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
				nickname_state = "0"; //나오면 DB에 있다(0)
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

	@Override
	public boolean signout(User signoutVO) throws Exception {
		int affectedRows = 0;
		boolean updateUserSignoutSuccess = false;
		
		try{
			System.out.println("signoutVO : " + signoutVO);
			String login_num = session.selectOne(namespace + ".selectUserLogoutRecord", signoutVO);
			System.out.println("수정될 login_num : " + login_num);
			affectedRows = session.update(namespace + ".updateUserLogoutRecord", login_num);
			System.out.println("수정된 로그 기록 행의 수 : " + affectedRows);
		}catch(Exception e){
			e.printStackTrace();
			affectedRows = 0;
		}
		
		if (affectedRows > 0){
			updateUserSignoutSuccess = true;
		}else{
			updateUserSignoutSuccess = false;
		}
		return updateUserSignoutSuccess;
	}
		
}
