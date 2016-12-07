package com.kosta136th.scrap;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class DemesticScrapController {
	
	@Inject
    private DemesticScrapService service; 
	
	
	@RequestMapping(value = "/news", method = RequestMethod.GET)
	public String news(Model model) throws Exception{
		
		System.out.println("/news 요청 접수됨.");
		
    	String keyword = "비트코인";
    	List<DomesticScrap> list = service.searchNews(keyword,100,1);
        model.addAttribute("newsList", list);
        
		return "sub/news";
		
	}
}
