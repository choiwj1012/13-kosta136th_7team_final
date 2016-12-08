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
    private DemesticScrapService demService; 
	@Inject
	private AbroadScrapService abrService;
	
	@RequestMapping(value = "/news", method = RequestMethod.GET)
	public String news(Model model) throws Exception{
		
    	String keyword = "비트코인";
    	List<DomesticScrap> list = demService.searchNews(keyword,10,1);
    	List<AbroadScrap> abrList = abrService.serachNews();
        model.addAttribute("newsList", list);
        model.addAttribute("abrNewsList", abrList);
		return "sub/news";
		
	}
	
	@RequestMapping(value = "/news/{pageNum}", method = RequestMethod.GET)
	public String newsPage(Model model) throws Exception{
		
    	String keyword = "비트코인";
    	List<DomesticScrap> list = demService.searchNews(keyword,20,10);
    	//List<AbroadScrap> abrList = abrService.serachNews();
        model.addAttribute("newsList", list);
        //model.addAttribute("abrNewsList", abrList);
		return "sub/news";
		
	}
	
	
}
