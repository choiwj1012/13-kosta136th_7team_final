package com.kosta136th.main;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	
	// private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		return "index";
		
	}
	
//	@RequestMapping(value = "/news", method = RequestMethod.GET)
//	public String news(){
//		
//		return "sub/news";
//		
//	}
	
	@RequestMapping(value = "/graph", method = RequestMethod.GET)
	public String price(){
		
		return "sub/graph";
		
	}
	
	@RequestMapping(value = "/recommand", method = RequestMethod.GET)
	public String recommand(){
		
		return "sub/recommand";
		
	}
	
	@RequestMapping(value = "/board", method = RequestMethod.GET)
	public String board(){
		
		return "sub/board";
		
	}
	
	@RequestMapping(value = "/myPage", method = RequestMethod.GET)
	public String myPage(){
		
		return "sub/myPage";
		
	}
	
	@RequestMapping(value = "/manageMyBoard", method = RequestMethod.GET)
	public String manageMyBoard(){
		
		return "sub/manageMyBoard";
		
	}
	
	@RequestMapping(value = "/manageMyInfo", method = RequestMethod.GET)
	public String manageMyInfo(){
		
		return "sub/manageMyInfo";
		
	}
	
	@RequestMapping(value = "/manageMyBitcoin", method = RequestMethod.GET)
	public String manageMyBitcoin(){
		
		return "sub/manageMyBitcoin";
		
	}
	
	// BTC 정보광장 Index Mapping
	@RequestMapping(value = "/btcInfoLand", method = RequestMethod.GET)
	public String btcInfoLand(){
		
		return "sub/btcInfoLand";
		
	}

	// BTC 정보광장 딜러 전문소식 Mapping
	@RequestMapping(value = "/btcInfoLand_board_list", method = RequestMethod.GET)
	public String btcInfoLandBoardList(){
		
		return "sub/btcInfoLand_board_list";
		
	}

	// BTC 정보광장 딜러 전문소식 상세보기 Mapping
	@RequestMapping(value = "/btcInfoLand_board_read", method = RequestMethod.GET)
	public String btcInfoLandBoardRead(){
		
		return "sub/btcInfoLand_board_read";
		
	}
	
}
