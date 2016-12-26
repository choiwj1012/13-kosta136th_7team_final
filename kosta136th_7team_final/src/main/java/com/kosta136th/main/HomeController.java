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
	
}
