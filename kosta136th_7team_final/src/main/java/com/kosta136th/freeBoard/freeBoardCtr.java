package com.kosta136th.freeBoard;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("freeboardCtr")
public class freeBoardCtr {
	
	
	@RequestMapping("/sgkim")
	public String freeBoardTest() {
		System.out.println("좀되라 시발");
		return "sub/freeboard/board_list";
	}

}
