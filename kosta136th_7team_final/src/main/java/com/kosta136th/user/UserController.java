package com.kosta136th.user;

import java.math.BigInteger;
import java.net.URLEncoder;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Random;

import javax.inject.Inject;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UserController {

	@Inject
	private UserService userService;

	//이메일 중복 검사 버튼을 클릭하는 경우
	@RequestMapping(value = "/requestCheckEmailDuplication", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String requestCheckEmailDuplication(String email){
		return checkEmailDuplication(email);
	}

	//이메일 중복 검사 컨트롤러
	public String checkEmailDuplication(String email){
		//email_state = 0 : DB에 있는 이메일
		//email_state = 1 : DB에 없는 이메일
		//email_state = 2 : 기타(오류)

		String email_state;

		try {
			email_state = userService.checkEmailDuplication(email);
		} catch (Exception e) {
			e.printStackTrace();
			email_state = "2";
		}


		return email_state;
	}

	//인증번호 발송
	@RequestMapping(value = "/requestAuthentication", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String requestAuthentication(@ModelAttribute User user){
		try {
			String registerPassword = issueTemporaryPassword();					
			String recipient = user.getUSER_EMAIL();


			//메일을 보낸다
			String subject = "인증번호가 발송되었습니다";
			String body = "인증번호는 " + registerPassword + "입니다";
			sendEmail(recipient, subject, body);
			return registerPassword;
		}catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	//새로운 비밀번호를 생성하는 메서드
	//특수문자, 영문, 숫자를 꼭 1개씩 모두 갖고 있어야 한다.
	private String issueTemporaryPassword() {
		Random random = new Random();
		int password_length = 8 + random.nextInt(9);

		ArrayList<String> chars = new ArrayList<String>();

		ArrayList<String> password = new ArrayList<String>();

		String alphabets[] = "A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z".split(",");

		String specialChars[] = "!,@,#,$,%,^,&,*,?,(,),{,},[,],:,;,<,>,.,/,|".split(",");

		String nums[] = "0,1,2,3,4,5,6,7,8,9".split(",");

		String p = alphabets[random.nextInt(alphabets.length)];

		String q = specialChars[random.nextInt(specialChars.length)];

		String r = nums[random.nextInt(nums.length)];

		for (int i = 0; i < alphabets.length; i++){
			chars.add(alphabets[i]);
		}

		for (int i = 0; i < specialChars.length; i++){
			chars.add(specialChars[i]);
		}

		for (int i = 0; i < nums.length; i++){
			chars.add(nums[i]);
		}

		StringBuffer buffer = new StringBuffer();

		password.add(p);
		password.add(q);
		password.add(r);

		for (int i = 3; i < password_length; i++) {
			password.add(chars.get(random.nextInt(chars.size())));
		}

		for (int i = password_length - 1; i > 0; i--){

			int num = random.nextInt(i);

			String a = password.get(i);	
			String b = password.get(num); 
			String temp;

			temp = a;
			a = b;
			b = temp;

			password.set(i, a);
			password.set(num, b);
		}

		for (int i = 0; i < password.size(); i++){
			buffer.append(password.get(i));

		}

		return buffer.toString();
	}


	//메일을 보낸다
	//이메일을 발송하는 메서드
	// recipient : 우리 회사의 이메일.
	// subject : 보낼 이메일의 제목
	// body : 보낼 이메일의 본문.
	public void sendEmail(String recipient, String subject, String body) throws AddressException, MessagingException {

		String host = "smtp.naver.com";
		final String username = "bitriver";       //@naver.com을 뺀 발신자(회사)의 이메일 번호
		final String password = "Bitriver12";   //비밀번호를 여기에 입력하세요
		int port=465; //네이버에서 확인할 것
		Properties props = System.getProperties(); 

		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", port);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.trust", host);

		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			String un = username;
			String pw = password;
			protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
				return new javax.mail.PasswordAuthentication(un, pw);
			}
		});
		session.setDebug(true); //for debug

		Message mimeMessage = new MimeMessage(session); 
		mimeMessage.setFrom(new InternetAddress("bitriver@naver.com")); //발송자(회사)의 풀 이메일로 입력
		mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient)); 
		mimeMessage.setSubject(subject);  
		mimeMessage.setText(body);        
		Transport.send(mimeMessage);

	}

	@RequestMapping(value = "/requestSignupEmail", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String requestSignupEmail(@RequestBody Map<String, List<String>> registerMap){
		//반환값
		String signupSuccess = "false";

		System.out.println(registerMap.toString());
		//개인정보 객체의 필드들
		String email = registerMap.get("user").get(0);
		String password = registerMap.get("user").get(1);
		String nickname = registerMap.get("user").get(2);
		String register_type_code = registerMap.get("user").get(3);

		//개인정보 객체
		User userInfo = new User(email, password, nickname);

		try {
			signupSuccess = userService.signupEmail(userInfo, register_type_code);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return signupSuccess;		
	}

	@RequestMapping(value = "/requestSigninEmail", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String requestSigninEmail(@ModelAttribute User user, HttpSession session, HttpServletRequest request) throws Exception
	{
		Map<String, Object> map = new HashMap<String, Object>();

		String result = "false";
		LoginInfo loginInfo = null;
		loginInfo = userService.signinEmail(user);
		System.out.println(loginInfo.toString());
		if(loginInfo.getUSER_EMAIL() == null)
		{
			System.out.println("1");
			result = "false";
		}
		else
		{
			System.out.println("2");
			map.put("USER_EMAIL", loginInfo.getUSER_EMAIL());
			map.put("REGISTER_TYPE_CODE", loginInfo.getREGISTER_TYPE_CODE());
			map.put("USER_NICKNAME", loginInfo.getUSER_NICKNAME());
			request.getSession().setAttribute("userVO", map);
			result = "true";
		}
		return result;
	}

	@RequestMapping(value = "/requestSignout", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String requestSignout(HttpSession session, HttpServletRequest request, @ModelAttribute User user){
		//로그기록을 처리하기 위해 세션의 객체를 옮긴다
		String result = "false";
		boolean updateUserSignoutSuccess = false;
		if(user.getUSER_EMAIL() != null)
		{
			try {
				updateUserSignoutSuccess = userService.signout(user);
				if(updateUserSignoutSuccess)
				{
					result = "true";
				}
				else
				{
					result = "false";
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else
		{
			result = "false";
		}

		return result;
	}

	//임시 비밀번호 발송
	@RequestMapping(value = "/requestIssuePassword", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String requestIssuePassword(@ModelAttribute User user){
		try {
			String registerPassword = issueTemporaryPassword();					
			String recipient = user.getUSER_EMAIL();

			//db에 수정된 password를 입력한다
			user.setUSER_PASSWORD(registerPassword);
			boolean result = userService.updateUserPassword(user);
			System.out.println(result);
			if(result)
			{
				//메일을 보낸다
				String subject = "인증번호가 발송되었습니다";
				String body = "인증번호는 " + registerPassword + "입니다";
				sendEmail(recipient, subject, body);

				return "메일이 발송되었습니다";
			}
			else
			{
				return "메일 발송실패.";
			}

		}
		catch (Exception e) 
		{
			e.printStackTrace();
			return "오류가 발생했습니다.";
		}
	}
}
