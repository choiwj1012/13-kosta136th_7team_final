package com.kosta136th.myPage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;



@Controller
public class MyPageController {
	
	
	// 마이페이지 수정 경로
	@RequestMapping(value = "/myPage", method = RequestMethod.GET)
	public String myPage(){
		
		return "sub/myPage/myPage";
		
	}
	
	// 마이페이지 유저 스크랩 리스트 경로
	@RequestMapping(value = "/manageMyBoard", method = RequestMethod.GET)
	public String manageMyBoard(LoginInfo loginInfo){
		System.out.println("manageMyBoard.email : " + loginInfo.getUSER_EMAIL());
		return "sub/myPage/manageMyBoard";
		
	}
	
	// 마이페이지 유저 정보 수정 경로
	@RequestMapping(value = "/manageMyInfo", method = RequestMethod.GET)
	public String manageMyInfo(){
		return "sub/myPage/manageMyInfo";
		
	}
	
}
