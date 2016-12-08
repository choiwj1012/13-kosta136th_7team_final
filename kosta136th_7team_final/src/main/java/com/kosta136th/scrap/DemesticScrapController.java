package com.kosta136th.scrap;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
@Controller
public class DemesticScrapController {
	
	@Inject
    private DemesticScrapService demService; 
	@Inject
	private AbroadScrapService abrService;
	
	@RequestMapping(value = "/news", method = RequestMethod.GET)
	public String news(Criteria cri, Model model) throws Exception{
		String tab = "tab1";
		int nowPageNum = 1;
		model.addAttribute("tab", tab);
		int pageStart = cri.getPageStart();
		int perPageNum = cri.getPerPageNum();
    	String keyword = "비트코인";
    	List<DomesticScrap> list = demService.searchNews(keyword, perPageNum,pageStart);
        model.addAttribute("newsList", list);
        PageMaker pageMaker = new PageMaker();
        pageMaker.setCri(cri);
        pageMaker.setTotalCount(100);
        model.addAttribute("pageMaker", pageMaker);
		return "sub/news";
		
	}
	
	
	@RequestMapping(value = "/news/tab1", method = RequestMethod.GET)
	public String newsTab1(Criteria cri, Model model) throws Exception{
		String tab = "tab1";
		model.addAttribute("tab", tab);
		int pageStart = cri.getPageStart();
		int perPageNum = cri.getPerPageNum();
    	String keyword = "비트코인";
    	List<DomesticScrap> list = demService.searchNews(keyword,perPageNum, pageStart);
        model.addAttribute("newsList", list);
        PageMaker pageMaker = new PageMaker();
        pageMaker.setCri(cri);
        pageMaker.setTotalCount(100);
        model.addAttribute("pageMaker", pageMaker);
		return "sub/news";
		
	}
	
	@RequestMapping(value = "/news/tab2", method = RequestMethod.GET)
	public String newsTab2(Criteria cri, Model model) throws Exception{
		String tab = "tab2";
		model.addAttribute("tab", tab);
		int pageStart = cri.getPageStart();
		int perPageNum = cri.getPerPageNum();
    	List<AbroadScrap> abrList = abrService.serachNews(1);
        model.addAttribute("abrNewsList", abrList);
        PageMaker pageMaker = new PageMaker();
        pageMaker.setCri(cri);
        pageMaker.setTotalCount(100);
        model.addAttribute("pageMaker", pageMaker);
		return "sub/news";
		
	}
	
	
//	@RequestMapping(value = "/news/tab1/{pageNum}", method = RequestMethod.GET)
//	public String newsPage1(Model model, @PathVariable("pageNum") Integer pageNum) throws Exception{
//		int perPageNews = 10;
//		int start = (perPageNews-1)*(pageNum-1)+pageNum;
//		int display = 10;
//		String tab = "tab1";
//		model.addAttribute("tab", tab);
//		
//    	String keyword = "비트코인";
//    	List<DomesticScrap> list = demService.searchNews(keyword,display,start);
//        model.addAttribute("newsList", list);
//		return "sub/news";
//		
//	}
//	
//	@RequestMapping(value = "/news/tab2/{pageNum}", method = RequestMethod.GET)
//	public String newsPage2(Model model, @PathVariable("pageNum") Integer pageNum) throws Exception{
//		String tab = "tab2";
//		model.addAttribute("tab", tab);
//    	List<AbroadScrap> abrList = abrService.serachNews(pageNum);
//        model.addAttribute("abrNewsList", abrList);
//		return "sub/news";
//		
//	}
	
	/*@RequestMapping(value = "/news/tab2/{pageNum}", method = RequestMethod.GET)
	public String newsPage(Model model, @PathVariable("pageNum") Integer pageNum) throws Exception{
		int perPageNews = 10;
		int start = (perPageNews-1)*(pageNum-1)+pageNum;
		int end = start + perPageNews+1;
    	String keyword = "비트코인";
    	List<DomesticScrap> list = demService.searchNews(keyword,end,start);
    	List<AbroadScrap> abrList = abrService.serachNews(pageNum);
        model.addAttribute("newsList", list);
        model.addAttribute("abrNewsList", abrList);
		return "sub/news";
		
	}*/
	
	
}
