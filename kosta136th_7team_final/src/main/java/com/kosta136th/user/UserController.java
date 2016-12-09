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

import org.springframework.http.HttpHeaders;
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
	public ResponseEntity<User> requestSigninEmail(@RequestBody User signinEmailDTO, HttpSession session){
		
		User signinSessionDTO = null;
		
		//한글 인코딩을 위해, Restful 방식에서 어쩔 수 없이 쓴다.
		//이 반복을 줄일 방법이 없을까?
		HttpHeaders responseHeaders = new HttpHeaders();
	    responseHeaders.add("Content-Type", "text/html; charset=UTF-8");
		ResponseEntity <User> entity = null;
		
		System.out.println(signinEmailDTO.getEmail());
		System.out.println(signinEmailDTO.getPassword());
		System.out.println(signinEmailDTO.getNickname());
		try { 
			signinSessionDTO = userService.signinEmail(signinEmailDTO);
			entity = new ResponseEntity<>(signinSessionDTO, HttpStatus.OK);
			//로그
			System.out.println(signinSessionDTO.toString());
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(signinSessionDTO, HttpStatus.BAD_REQUEST);
		}
		
		setSigninSessionAttribute(session, signinSessionDTO);
		
		return entity;
	}
	
	@RequestMapping(value = "/requestSignupEmail", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public ResponseEntity<String> requestSignupEmail(@RequestBody User signinEmailDTO) throws Exception{
		
		boolean signupSuccess = false;
		
		//한글 인코딩을 위해, Restful 방식에서 어쩔 수 없이 쓴다.
		//이 반복을 줄일 방법이 없을까?
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=UTF-8");
		ResponseEntity <String> entity = null;
		
		signupSuccess = userService.signupEmail(signinEmailDTO);
			
		if (signupSuccess == true){
			entity = new ResponseEntity<>("성공했습니다", HttpStatus.OK);
		} else{
			entity = new ResponseEntity<>("실패했습니다", HttpStatus.BAD_REQUEST);
		}
		
		return entity;		
	}
	
	//가입 페이지에서 녹색 '네이버로 가입' 버튼 클릭
	@RequestMapping(value = "/requestSignupNaver", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String requestSignupNaver(){
		
		String apiURL;
		
		apiURL = generateNaverLoginAPI("/doSignupNaver");
		
		return apiURL;		
	}

	//가입 페이지에서 녹색 '네이버로 로그인' 버튼 클릭
	@RequestMapping(value = "/requestSigninNaver", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String requestSigninNaver(){
		
		String apiURL;
		
		apiURL = generateNaverLoginAPI("/doSigninNaver");
		
		return apiURL;		
	}
	
	//콜백 주소(목적지 : destination)를 입력받아
	//apiURL을 생성하는 메소드
	public String generateNaverLoginAPI(String destination){
		
		String apiURL;
		apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
		
		String clientId; 
	    String redirectURI;//YOUR_CALLBACK_URL
	    String state;
	    	    
		try {
			clientId = "pF0PyCKhhv5zfVs24Tzl";//애플리케이션 클라이언트 아이디값
			
			//destination 형식의 예 : /requestSignupNaver
			redirectURI = URLEncoder.encode("http://127.0.0.1:8080" + destination, "UTF-8");
			
			SecureRandom random = new SecureRandom();
			state = new BigInteger(130, random).toString();
			
			apiURL += "&client_id=" + clientId;
			apiURL += "&redirect_uri=" + redirectURI;
			apiURL += "&state=" + state;
			
			System.out.println("네이버로 요청할 apiURL : "+apiURL);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return apiURL;
	}
	
	//가입 콜백으로 값이 왔다.
	@RequestMapping(value = "/doSignupNaver")
	@ResponseBody
	public ResponseEntity<String> doSignupNaver(@RequestParam("code") String code, @RequestParam("state") String state 
			, HttpSession httpSession){
		
		System.out.println("가입 로직으로 올바르게 찾아왔습니다");
		
		//한글 인코딩을 위해, Restful 방식에서 어쩔 수 없이 쓴다.
		//이 반복을 줄일 방법이 없을까?
		HttpHeaders responseHeaders = new HttpHeaders();
        responseHeaders.add("Content-Type", "text/html; charset=UTF-8");
        
		ResponseEntity<String> entity = null;
		
		User signinSessionDTO;
		User signupNaverVO = null; 
		
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
			redirectURI = URLEncoder.encode("http://127.0.0.1:8080/doSignupNaver", "UTF-8");

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
			
			//여기까지가 접근 토큰 얻어오는 코드
			//여기 이후 개인정보를 얻어오는 코드

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
			
			System.out.println("Naver user E-mail: " + naverUser.getEmail());
			
			//개인정보를 얻어오는 것이 끝났다
			
			//네이버에 이 이메일이 존재하지 않는다.
			String email = naverUser.getEmail();
			//그런 경우는
			//DAO에 비접근. 검사 로직 하나로 충분
			if (email == null){
				System.out.println("네이버에 없는 이메일");
				entity = new ResponseEntity<String>("네이버에 없는 이메일입니다.", responseHeaders, HttpStatus.BAD_REQUEST);
				//리턴 문자열 : "잘못된 이메일입니다."
				return entity;
			}
			
			//DAO에 접근. 검사 로직.
			//네이버 아이디와 일치하는 행을 불러오는 것
			String email_state;
			email_state = checkEmailDuplication(email);
			
			//email_state = 0 : DB에 있는 이메일
			//email_state = 1 : DB에 없는 이메일
			//email_state = 2 : 기타(오류)
			
			switch (email_state){
				
				case "0":
					entity = new ResponseEntity<String>("이미 가입한 이메일입니다", responseHeaders, HttpStatus.BAD_REQUEST);
					break;
				case "2":
					entity = new ResponseEntity<String>("에러가 발생했습니다", responseHeaders, HttpStatus.BAD_REQUEST);
					break;
				case "1":
					//DAO에 접근. 비즈니스 로직
					//네이버 회원 가입
					//로그인에 실패했습니다는 불가능
					//오류가 발생했습니다는 가능
					String message = "회원 가입에 실패했습니다";
					try{
						signupNaverVO = new User(naverUser.getEmail(),"",naverUser.getNickname());
						System.out.println(signupNaverVO.toString());
						boolean signupSuccess = false;
						signupSuccess = userService.signupNaver(signupNaverVO);
						if (signupSuccess){
							message = "회원 가입에 성공했습니다.";
						}
					} catch(Exception e) {
						message = "오류가 발생했습니다.";							
					}
					//리턴 문자열 : "성공" 또는 "실패"
					entity = new ResponseEntity<String>(message, responseHeaders, HttpStatus.BAD_REQUEST);
					break;
				default :
					entity = new ResponseEntity<String>("에러가 발생했습니다", responseHeaders, HttpStatus.BAD_REQUEST);
					break;
					
			}					
			
		} catch (JsonParseException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			System.out.println(e);
		}
		
		signinSessionDTO = signupNaverVO;
		setSigninSessionAttribute(httpSession, signinSessionDTO);
		
		return entity;
	}
	
	//로그인 콜백으로 값이 왔다.
		@RequestMapping(value = "/doSigninNaver")
		@ResponseBody
		public ResponseEntity<String> doSigninNaver(@RequestParam("code") String code, @RequestParam("state") String state 
				, HttpSession httpSession){
			System.out.println("로그인 로직으로 올바르게 찾아왔습니다");
			
			//한글 인코딩을 위해, Restful 방식에서 어쩔 수 없이 쓴다.
			//이 반복을 줄일 방법이 없을까?
			HttpHeaders responseHeaders = new HttpHeaders();
	        responseHeaders.add("Content-Type", "text/html; charset=UTF-8");
	        
			ResponseEntity<String> entity = null;
			
			User signinSessionDTO = null;

			//별도의 메서드로 분리하라
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
				redirectURI = URLEncoder.encode("http://127.0.0.1:8080/doSigninNaver", "UTF-8");

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
				
				//여기까지가 접근 토큰 얻어오는 코드
				//여기 이후 개인정보를 얻어오는 코드

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
				System.out.println("이 Naver user의 E-mail: " + naverUser.getEmail());
				
				//개인정보를 얻어오는 것이 끝났다
				
				//네이버에 이 이메일이 존재하지 않는다.
				String email = naverUser.getEmail();
				//그런 경우는
				//DAO에 비접근. 검사 로직 하나로 충분
				if (email == null){
					System.out.println("네이버에 없는 이메일");
					entity = new ResponseEntity<String>("네이버에 없는 이메일입니다.", responseHeaders, HttpStatus.BAD_REQUEST);
					//리턴 문자열 : "잘못된 이메일입니다."
					return entity;
				}
				
				//DAO에 접근. 검사 로직.
				//네이버 아이디와 일치하는 행을 불러오는 것
				String email_state;
				email_state = checkEmailDuplication(email);
				
				//email_state = 0 : DB에 있는 이메일
				//email_state = 1 : DB에 없는 이메일
				//email_state = 2 : 기타(오류)
				
				switch (email_state){
					
					case "1":
						entity = new ResponseEntity<String>("가입하지 않은 이메일입니다", responseHeaders, HttpStatus.BAD_REQUEST);
						break;
					case "2":
						entity = new ResponseEntity<String>("에러가 발생했습니다", responseHeaders, HttpStatus.BAD_REQUEST);
						break;
					case "0":
						//DAO에 접근. 비즈니스 로직
						//네이버 아이디와 일치하는 행을 불러오는 것
						//로그인에 실패했습니다는 불가능
						//오류가 발생했습니다는 가능
						User signinEmailVO = null;
						String message = "로그인에 실패했습니다";
						try{
							signinEmailVO = userService.signinNaver(email);
							signinSessionDTO = signinEmailVO;
							if (signinEmailVO != null){
								message = "로그인에 성공했습니다.";
							}
						} catch(Exception e) {
							message = "오류가 발생했습니다.";							
						}
						//리턴 문자열 : "성공" 또는 "실패"
						entity = new ResponseEntity<String>(message, responseHeaders, HttpStatus.BAD_REQUEST);
						break;
					default :
						entity = new ResponseEntity<String>("에러가 발생했습니다", responseHeaders, HttpStatus.BAD_REQUEST);
						break;
						
				}					
				
			} catch (JsonParseException e) {
				e.printStackTrace();
			} catch (JsonMappingException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} catch (Exception e) {
				System.out.println(e);
			}
			
			setSigninSessionAttribute(httpSession, signinSessionDTO);
			return entity;
			
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
		
		//로그
		System.out.println("Email state : " + email_state);
	
		return email_state;
	}
	
	//별명 중복 검사 컨트롤러
	public String checkNicknameDuplication(String nickname) {
		//nickname_state = 0 : DB에 있는 이메일
		//nickname_state = 1 : DB에 없는 이메일
		//nickname_state = 2 : 기타(오류)

		String nickname_state;

		try {
			nickname_state = userService.checkNicknameDuplication(nickname);
		} catch (Exception e) {
			e.printStackTrace();
			nickname_state = "2";
		}
		
		//로그
		System.out.println("Nickname state : " + nickname_state);

		return nickname_state;
	}
	
	//이메일 중복 검사 버튼을 클릭하는 경우
	@RequestMapping(value = "/requestCheckEmailDuplication", method = RequestMethod.POST)
	@ResponseBody
	public String requestCheckEmailDuplication(String email){
		return checkEmailDuplication(email);
	}
	
	//별명 중복 검사 버튼을 클릭하는 경우
	@RequestMapping(value = "/requestCheckNicknameDuplication", method = RequestMethod.POST)
	@ResponseBody
	public String requestCheckNicknameDuplication(String nickname){
		return checkNicknameDuplication(nickname);
	}
	
	//세션 속성을 바꾼다
	public void setSigninSessionAttribute(HttpSession session, User signinSessionDTO){
		session.setAttribute("signinSessionDTO", signinSessionDTO);
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
