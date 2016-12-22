package com.kosta136th.main;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kosta136th.dealer.PageMaker;
import com.kosta136th.dealer.SearchCriteria;

@Controller("homeController")
public class HomeController {
	
	// landing page (index.jsp)
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		return "index";
		
	}
	
	
	// 자유게시판 리스트 경로
	@RequestMapping(value = "/board_list", method = RequestMethod.GET)
	public String boardList(){
		
		return "sub/freeboard/board_list";
		
	}
	
	
	// 자유게시판 읽기 경로
	@RequestMapping(value = "/board_read", method = RequestMethod.GET)
	public String boardRead(){
		
		return "sub/freeboard/board_read";
		
	}
	
	
	// 자유게시판 쓰기 경로
	@RequestMapping(value = "/board_write", method = RequestMethod.GET)
	public String boardWrite(){
		
		return "sub/freeboard/board_write";
		
	}
	
	
	// 자유게시판 수정 경로
	@RequestMapping(value = "/board_update", method = RequestMethod.GET)
	public String boardUpdate(){
		
		return "sub/freeboard/board_update";
		
	}
	
<<<<<<< HEAD
	// 마이페이지 수정 경로
	@RequestMapping(value = "/myPage", method = RequestMethod.GET)
	public String myPage(){
		
		return "sub/myPage/myPage";
		
	}
	
	
	// 마이페이지 유저 스크랩 리스트 경로
	@RequestMapping(value = "/manageMyBoard", method = RequestMethod.GET)
	public String manageMyBoard(){
		
		return "sub/myPage/manageMyBoard";
		
	}
	
	
	// 마이페이지 유저 정보 수정 경로
	@RequestMapping(value = "/manageMyInfo", method = RequestMethod.GET)
	public String manageMyInfo(){
		
		return "sub/myPage/manageMyInfo";
		
	}
	
	
=======
>>>>>>> 4a16405995437ab60fa46c3e810c02106f3a3c07
	// 마이페이지 유저 비트코인 지갑 보기 경로 (준비중 페이지로 변경)
	@RequestMapping(value = "/manageDealer", method = RequestMethod.GET)
	public String manageDealer(){
		
		return "sub/myPage/manageDealer";
		
	}
	
	
	// 마이페이지 유저 비트코인 지갑 보기 경로 (준비중 페이지로 변경)
	@RequestMapping(value = "/userWithdraw", method = RequestMethod.GET)
	public void userWithdraw(){
		
		System.out.println("회원탈퇴요청");
		
	}
	
	// BTC 정보광장 딜러 전문소식 Mapping
	@RequestMapping(value = "/btcInfoLand_board_list", method = RequestMethod.GET)
	public String btcInfoLandBoardList(){
		
		return "sub/btcInfoLand/btcInfoLand_board_list";
		
	}

	
	// BTC 정보광장 딜러 전문소식 상세보기 Mapping
	@RequestMapping(value = "/btcInfoLand_board_read", method = RequestMethod.GET)
	public String btcInfoLandBoardRead(){
		
		System.out.println("TEST");
		
		return "sub/btcInfoLand/btcInfoLand_board_read";
		
	}
	
}
