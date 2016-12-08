package com.kosta136th.user;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.math.BigInteger;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.security.SecureRandom;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class UserController {
	
	@Inject
	private UserService userService;
	
	@RequestMapping(value = "/requestSigninEmail", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<User> requestSigninEmail(@RequestBody User loginEmailDTO, HttpSession session){
		
		User loginSessionDTO = null;
		ResponseEntity <User> entity = null;
		System.out.println(loginEmailDTO.getEmail());
		System.out.println(loginEmailDTO.getPassword());
		System.out.println(loginEmailDTO.getNickname());
		try { 
			loginSessionDTO = userService.signinEmail(loginEmailDTO);
			entity = new ResponseEntity<>(loginSessionDTO, HttpStatus.OK);
			System.out.println(loginSessionDTO.toString());
			session.setAttribute("LoginSession", loginSessionDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<>(loginSessionDTO, HttpStatus.BAD_REQUEST);
			session.setAttribute("LoginSession", null);
		}
		
		return entity;
	}
	
	@RequestMapping(value = "/requestSignupEmail", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public ResponseEntity<String> requestSignupEmail(@RequestBody User loginEmailDTO){
		
		boolean signupSuccess = false;
		
		ResponseEntity <String> entity = null;
		
		try {
			
			signupSuccess = userService.signupEmail(loginEmailDTO);
			
			if (signupSuccess == true){
				entity = new ResponseEntity<>("성공했습니다", HttpStatus.OK);
			} else{
				entity = new ResponseEntity<>("실패했습니다", HttpStatus.BAD_REQUEST);
			}

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>("실패했습니다", HttpStatus.BAD_REQUEST);
		}
		
		return entity;		
	}
 
	@RequestMapping(value = "/requestNaverIDLoginAPI", method = RequestMethod.POST)
	@ResponseBody
	public String requestSigninNaver(){
		System.out.println("POST 요청이 왔습니다.");
		
		String apiURL = "";
		
		String clientId; 
	    String redirectURI;//YOUR_CALLBACK_URL
	    String state;
	    	    
		try {
			clientId = "pF0PyCKhhv5zfVs24Tzl";//애플리케이션 클라이언트 아이디값
			
			redirectURI = URLEncoder.encode("http://127.0.0.1:8080/requestSignupNaver", "UTF-8");
			
			SecureRandom random = new SecureRandom();
			state = new BigInteger(130, random).toString();
			
			apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
			apiURL += "&client_id=" + clientId;
			apiURL += "&redirect_uri=" + redirectURI;
			apiURL += "&state=" + state;
			
			System.out.println("네이버로 요청할 apiURL : "+apiURL);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return apiURL;
	}
	
	@RequestMapping(value = "/requestSignupNaver")
	@ResponseBody
	public void requestSigninNaver(@RequestParam("code") String code, @RequestParam("state") String state 
			, HttpSession httpSession){

		//유저 테이블에서 @naver.com에 해당하는 이메일을 가진 칼럼들을
		//새로운 테이블(A)로
		//그 테이블의 칼럼 USER_NUM
		//가입 유형(REGISTER_TYPE)의 REGISTER_TYPE_CODE가 네이버인 
		//테이블을 선택
		//그 테이블의 칼럼 USER_NUM,
		//네이버로 그런 아이디가 등록되어 있나 검사.
		//등록되어 있지 않으면 
		
		String clientId;//애플리케이션 클라이언트 아이디값(네이버 발급 개발자용 아이디)
		clientId = "pF0PyCKhhv5zfVs24Tzl";
		String clientSecret;//애플리케이션 클라이언트 시크릿값(네이버 발급 개발자의 비밀번호)
		clientSecret = "brbke7Inh2";
		//YOUR_CALLBACK_URL
		String redirectURI ;
		String apiURL;

		URL url;
		HttpURLConnection con;
		int responseCode;

		BufferedReader br;
		String json = ""; //전달 받은 JSON 문자열을 보관하는 스트링
		String access_token; //전달 받은 JSON으로부터 access token을 잘라서 보관하는 스트링

		try{
			redirectURI = URLEncoder.encode("http://127.0.0.1:8080/requestSignupNaver", "UTF-8");

			apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
			apiURL += "client_id=" + clientId;
			apiURL += "&client_secret=" + clientSecret;
			apiURL += "&redirect_uri=" + redirectURI;
			apiURL += "&code=" + code;
			apiURL += "&state=" + state;

			System.out.println("네이버로 요청할 apiURL : "+apiURL);

			url = new URL(apiURL);
			con = (HttpURLConnection)url.openConnection();
			con.setRequestMethod("GET");
			responseCode = con.getResponseCode();
			System.out.println("responseCode : "+responseCode);

			if(responseCode==200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else {  // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}

			String inputLine;
			StringBuffer response = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			br.close();

			if(responseCode==200) {
				json = response.toString();
				System.out.println("response : " + response);
			}

			ObjectMapper mapper = new ObjectMapper();
			Map<String, Object> map = new HashMap<String, Object>();
			map = mapper.readValue(json, new TypeReference<Map<String, Object>>(){});
			//access token을 저장한다
			access_token = (String)map.get("access_token");
			//이후 개인정보를 얻어오는 코드

			String header = "Bearer " + access_token; // Bearer 다음에 공백 추가
			//전달 받은 인적 사항의 JSON을 보관하는 스트링
			json = "";
			System.out.println("token : " + access_token);

			apiURL = "https://openapi.naver.com/v1/nid/me";
			url = new URL(apiURL);
			con = (HttpURLConnection)url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("Authorization", header);
			responseCode = con.getResponseCode();
			if(responseCode==200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else {  // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			response = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			br.close();
			json = response.toString();
			System.out.println("response json : " + json);

			mapper = new ObjectMapper();
			
			NaverUser naverUser = null;
			naverUser = mapper.readValue(json, NaverUser.class);
			User user = null;
			user = new User(naverUser.getEmail(),"",naverUser.getNickname());
			System.out.println("Naver user E-mail: " + naverUser.getEmail());
			

		} catch (JsonParseException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
	//도메인을 새로 만들지 않기 위한 내부 클래스. 
	//잭슨라이브러리는 deserialize(?)를 해야 하는데, 내부 클래스는 static 클래스여야 할 수 있다함. 
	@JsonIgnoreProperties(ignoreUnknown = true)
	static class NaverUser {
		
		@JsonProperty("resultcode")
		private String resultcode;
		
		@JsonProperty("message")
		private String message;
		
		private String email;
		private String nickname;
		
		public NaverUser(){
			
		}

		public NaverUser(String resultcode, String message) {
			this.resultcode = resultcode;
			this.message = message;
		}
		
		public String getResultcode() {
			return resultcode;
		}
		
		public void setResultcode(String resultcode) {
			this.resultcode = resultcode;
		}
		
		public String getMessage() {
			return message;
		}
		
		public void setMessage(String message) {
			this.message = message;
		}

		@JsonProperty("response")
		public void setProperties(@JsonProperty("response") Map<String,String> response){
			this.email = response.get("email");
			this.nickname = response.get("nickname");
		}
		
		public String getEmail() {
			return email;
		}

		public void setEmail(String email) {
			this.email = email;
		}
		
		public String getNickname() {
			return nickname;
		}

		public void setNickname(String nickname) {
			this.nickname = nickname;
		}
		
	}
	
}
