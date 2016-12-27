package com.kosta136th.user;

import java.security.MessageDigest;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.xml.bind.DatatypeConverter;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kosta136th.myPage.ChangePassword;

@Repository
public class UserDAOImpl implements UserDAO{

	@Inject
	private SqlSession session;

	private static String namespace = "com.kosta136th.mapper.UserMapper";

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
	public String signupEmail(User userInfo, String register_type_code) throws Exception {
		int affectedRows = 0;
		String result = "false";
		userInfo.setUSER_PASSWORD(encryptPasswordSHA256(userInfo.getUSER_PASSWORD()));
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("signupVO", userInfo);
		map.put("register_type_code", register_type_code);
		affectedRows = session.insert(namespace + ".insertLoginProfileByEmail", userInfo);
		if(affectedRows > 0)
		{
			session.insert(namespace + ".insertRegisterType", map);
			result = "true";
		}

		return result;
	}

	public String encryptPasswordSHA256(String password) throws Exception {

		String encryptedPassword;

		MessageDigest digest = null;
		digest = MessageDigest.getInstance("SHA-256");
		byte[] hash = digest.digest(password.getBytes("UTF-8"));

		encryptedPassword = DatatypeConverter.printHexBinary(hash);
		
		return encryptedPassword;
	}

	@Override
	public LoginInfo signinEmail(User user) throws Exception {
		//DAO의 반환은 DTO
		User resultUser = null;
		LoginInfo loginInfo = new LoginInfo();
		try {
			//이메일에 해당하는 회원 정보를 찾아
			user.setUSER_PASSWORD(encryptPasswordSHA256(user.getUSER_PASSWORD()));
			resultUser = session.selectOne(namespace + ".getLoginProfileByEmail", user);
			
			//회원정보를 로그인 시간에 넣는다
			if (resultUser != null){
				session.insert(namespace + ".insertUserLoginRecord", resultUser);
				String REGISTER_TYPE_CODE = session.selectOne(namespace +".getRegisterTypeCode", resultUser);
				loginInfo.setUSER_EMAIL(resultUser.getUSER_EMAIL());
				loginInfo.setREGISTER_TYPE_CODE(REGISTER_TYPE_CODE);
				loginInfo.setUSER_NICKNAME(resultUser.getUSER_NICKNAME());
				System.out.println("별명 : " + loginInfo.getUSER_NICKNAME());
			}

		} catch(Exception e){
			e.printStackTrace();
		}
		return loginInfo;
	}

	@Override
	public boolean signout(User user) throws Exception {
		int affectedRows = 0;
		boolean updateUserSignoutSuccess = false;
		
		try{
			String login_num = session.selectOne(namespace + ".selectUserLogoutRecord", user);
			affectedRows = session.update(namespace + ".updateUserLogoutRecord", login_num);
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

	@Override
	public boolean updateUserPassword(User user) throws Exception {
		int affectedRows = 0;
		boolean updateUserPasswordSuccess = false;
		
		user.setUSER_PASSWORD(encryptPasswordSHA256(user.getUSER_PASSWORD()));

		try{
			affectedRows = session.insert(namespace + ".updateUserPassword", user);
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
	public String getUserNickName(String email) throws Exception {
		
		return session.selectOne(namespace + ".getUserNickName", email);
	}

	@Override
	public void changeNickName(User user) throws Exception {
		session.update(namespace + ".changeNickName", user);
		
	}

	@Override
	public String changePassword(ChangePassword userInfo) throws Exception {
		String result = "false";
		String password = session.selectOne(namespace + ".getPassword", userInfo);
		String inputPassword = encryptPasswordSHA256(userInfo.getNOW_USER_PASSWORD());
		System.out.println("userDAOImpl.getPassword : " + password);
		System.out.println("userDAOImpl.inputPassword : " + inputPassword);
		if(password.equals(inputPassword))
		{
			userInfo.setCHANGE_USER_PASSWORD(encryptPasswordSHA256(userInfo.getCHANGE_USER_PASSWORD()));
			session.insert(namespace + ".changePassword", userInfo);
			result = "true";
		}
		
		
		return result;
	}


}
