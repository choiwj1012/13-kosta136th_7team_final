package user;

import java.sql.Connection;
import java.sql.DriverManager;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kosta136th.user.User;
import com.kosta136th.user.UserDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class MariaDBConnectionTest {

	// variable
	// variable
		private static final String DRIVER = "org.mariadb.jdbc.Driver";
		private static final String URL = "jdbc:mariadb://localhost:3300/bitcoin";
		private static final String USER = "root";
		private static final String PW = "1234";
	
	@Inject
	private UserDAO userDao;
	
	@Test
	public void testConnection() throws Exception {
		
		Class.forName(DRIVER);
		
		try(Connection con = DriverManager.getConnection(URL, USER, PW)){
			
			System.out.println(con);
			
		} catch(Exception e) {
			
			e.printStackTrace();
			
		}
		
	}
	
	@Test
	public void checkEmailDuplicationTest() throws Exception
	{
		String email = "pcj9027@naver.com";
		userDao.checkEmailDuplication(email);
	}
	
	@Test
	public void signupEmailTest() throws Exception
	{
		User userInfo = new User();
		String USER_EMAIL = "pcj902702@naver.com";
		String USER_PASSWORD = "@c1234567";
		String USER_NICKNAME = "박창준";
		userInfo.setUSER_EMAIL(USER_EMAIL);
		userInfo.setUSER_PASSWORD(USER_PASSWORD);
		userInfo.setUSER_NICKNAME(USER_NICKNAME);
		String register_type_code = "h";
		userDao.signupEmail(userInfo, register_type_code);
	}
	
	@Test
	public void encryptPasswordSHA256Test() throws Exception
	{
		String password = "@12345678";
		userDao.encryptPasswordSHA256(password);
	}
	
	@Test
	public void signinEmailTest() throws Exception
	{
		User user = new User();
		String USER_EMAIL = "pcj9027@naver.com";
		String USER_PASSWORD = "@c1234567";
		String USER_NICKNAME = "박창준";
		user.setUSER_EMAIL(USER_EMAIL);
		user.setUSER_PASSWORD(USER_PASSWORD);
		user.setUSER_NICKNAME(USER_NICKNAME);
		
		userDao.signinEmail(user);
	}
	
	@Test
	public void signoutTest() throws Exception
	{
		User user = new User();
		String USER_EMAIL = "pcj9027@naver.com";
		String USER_PASSWORD = "@c1234567";
		String USER_NICKNAME = "박창준";
		user.setUSER_EMAIL(USER_EMAIL);
		user.setUSER_PASSWORD(USER_PASSWORD);
		user.setUSER_NICKNAME(USER_NICKNAME);
		
		userDao.signout(user);
	}
	
	@Test
	public void updateUserPasswordTest() throws Exception
	{
		User user = new User();
		String USER_EMAIL = "pcj9027@naver.com";
		String USER_PASSWORD = "@c1234567";
		String USER_NICKNAME = "박창준";
		user.setUSER_EMAIL(USER_EMAIL);
		user.setUSER_PASSWORD(USER_PASSWORD);
		user.setUSER_NICKNAME(USER_NICKNAME);
		
		userDao.updateUserPassword(user);
	}
	
	@Test
	public void getUserNicNameTest() throws Exception
	{
		String email = "pcj902702@naver.com";
		userDao.getUserNickName(email);
	}
	
	public void changeNickNameTest() throws Exception
	{
		User user = new User();
		String USER_EMAIL = "pcj902701@naver.com";
		String USER_PASSWORD = "@c1234567";
		String USER_NICKNAME = "박창준";
		user.setUSER_EMAIL(USER_EMAIL);
		user.setUSER_PASSWORD(USER_PASSWORD);
		user.setUSER_NICKNAME(USER_NICKNAME);
		
		userDao.changeNickName(user);
	}
	
}
