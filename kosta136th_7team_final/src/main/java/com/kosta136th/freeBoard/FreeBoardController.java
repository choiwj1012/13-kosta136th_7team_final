package com.kosta136th.freeBoard;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/sub/freeboard/*") 
public class FreeBoardController {
	private static final Logger logger = LoggerFactory.getLogger(FreeBoardController.class);
	
	@Inject
	private FreeBoardService freeBoardService;
	
	@RequestMapping(value = "/board_write", method = RequestMethod.GET)
	public void registerGET(FreeBoard board, Model model) throws Exception {
		
		logger.info("register GET...........");

	}

	@RequestMapping(value = "/board_write", method = RequestMethod.POST)
	public String registerPOST(FreeBoard board, Model model) throws Exception {
		
		logger.info("register POST...........");
		logger.info(board.toString());
		
		freeBoardService.regist(board);
		
		model.addAttribute("result", "success");
		
//		return "/sub/freeboard/board_list";
		return "redurect:/sub/freeboard/board_list";
	}
	
	@RequestMapping(value = "/board_list", method = RequestMethod.GET)
	public void listAll(Model model) throws Exception {
		logger.info("show all list..........");
		model.addAttribute("list", freeBoardService.listAll());
	}

	@RequestMapping(value = "/board_read", method = RequestMethod.GET)
	public void read(@RequestParam("freeBoard_Num") int freeBoard_Num, Model model) throws Exception {
		logger.info("show read calling..........");
		System.out.println("freeBoard_Num : " + freeBoard_Num);
		model.addAttribute("freeBoard", freeBoardService.read(freeBoard_Num));
		
		
	}
}