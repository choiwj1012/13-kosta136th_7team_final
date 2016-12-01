package com.kosta136th.controller;

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
	
	@RequestMapping(value = "/news", method = RequestMethod.GET)
	public String news(){
		
		return "sub/news";
		
	}
	
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
	
}
