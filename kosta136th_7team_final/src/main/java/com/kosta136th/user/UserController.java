package com.kosta136th.user;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UserController {
	
	@Inject
	private UserService userService;
	
	@RequestMapping(value = "/requestSigninEmail", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<LoginSessionDTO> requestSigninEmail(@RequestBody LoginEmailDTO loginEmailDTO, HttpSession session){
		
		LoginSessionDTO loginSessionDTO = null;
		ResponseEntity <LoginSessionDTO> entity = null;
		System.out.println(loginEmailDTO.getEmail());
		System.out.println(loginEmailDTO.getPassword());
		System.out.println(loginEmailDTO.getNickname());
		try { 
			loginSessionDTO = userService.signinEmail(loginEmailDTO);
			entity = new ResponseEntity<>(loginSessionDTO, HttpStatus.OK);
			session.setAttribute("LoginSession", loginSessionDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<>(loginSessionDTO, HttpStatus.BAD_REQUEST);
			session.setAttribute("LoginSession", null);
		}
		
		return entity;
	}
	
	@RequestMapping(value = "/requestSignupEmail", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> requestSignupEmail(@RequestBody LoginEmailDTO loginEmailDTO){
		
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
}
