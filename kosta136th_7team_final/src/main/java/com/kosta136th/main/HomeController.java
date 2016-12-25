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
	
}
