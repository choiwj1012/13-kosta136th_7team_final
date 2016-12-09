package com.kosta136th.scrap;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
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
		System.out.println("/news실행");
		String tab = "news/tab1";
		model.addAttribute("tab", tab);
		int pageStart = cri.getPageStart();
		int perPageNum = cri.getPerPageNum();
    	String keyword = "비트코인";
    	List<DemesticScrap> list = demService.newsList(keyword, perPageNum,pageStart);
        model.addAttribute("newsList", list);
        PageMaker pageMaker = new PageMaker();
        pageMaker.setCri(cri);
        pageMaker.setTotalCount(100);
        model.addAttribute("pageMaker", pageMaker);
		return "sub/news";
		
	}
	
	
	@RequestMapping(value = "/news/tab1", method = RequestMethod.GET)
	public String newsTab1(Criteria cri, Model model) throws Exception{
		System.out.println("tab1실행");
		String tab = "tab1";
		model.addAttribute("tab", tab);
		int pageStart = cri.getPageStart();
		int perPageNum = cri.getPerPageNum();
    	String keyword = "비트코인";
    	List<DemesticScrap> list = demService.newsList(keyword,perPageNum, pageStart);
        model.addAttribute("newsList", list);
        PageMaker pageMaker = new PageMaker();
        pageMaker.setCri(cri);
        pageMaker.setTotalCount(100);
        model.addAttribute("pageMaker", pageMaker);
		return "sub/news";
		
	}
	
	@RequestMapping(value = "/news/tab2", method = RequestMethod.GET)
	public String newsTab2(Criteria cri, Model model) throws Exception{
		System.out.println("/tab2실행");
		String tab = "tab2";
		model.addAttribute("tab", tab);
		int pageStart = cri.getPageStart();
    	List<AbroadScrap> abrList = abrService.serachNews(pageStart);
        model.addAttribute("abrNewsList", abrList);
        PageMaker pageMaker = new PageMaker();
        pageMaker.setCri(cri);
        pageMaker.setTotalCount(100);
        model.addAttribute("pageMaker", pageMaker);
		return "sub/news";
		
	}
	
	@RequestMapping(value = "/addAbroadScrap", method = RequestMethod.POST)
	public String addAbroadScrap(@RequestBody AbroadScrap vo) throws Exception{
		vo.setUser_num(4);
		abrService.addAbroadScrap(vo);
		
		return "sub/news/tab2";
	}
	
	@RequestMapping(value = "/addDemesticScrap", method = RequestMethod.POST)
	public String addDemesticScrap(@RequestBody DemesticScrap vo) throws Exception{
		vo.setUser_num(4);
		demService.addDemesticScrap(vo);
		
		return "sub/news/tab1";
	}
	
	@RequestMapping(value = "/searchScrap", method = RequestMethod.POST)
	public String searchScrap(@RequestBody SearchInfo vo, Model model, Criteria cri) throws Exception{
		String tabInfo = vo.getTabInfo();
		if(tabInfo.equals("tab1"))
		{
			System.out.println("tab1검색실행");
			String tab = "tab1";
			model.addAttribute("tab", tab);
			int pageStart = cri.getPageStart();
			int perPageNum = cri.getPerPageNum();
	    	String keyword = "비트코인 가트너";
	    	List<DemesticScrap> list = demService.newsList(keyword,100, 1);
	        model.addAttribute("newsList", list);
	        System.out.println(list.size());
	        PageMaker pageMaker = new PageMaker();
	        pageMaker.setCri(cri);
	        pageMaker.setTotalCount(list.size());
	        model.addAttribute("pageMaker", pageMaker);
			return "sub/news";
		}
		else
		{
			return "sub/news";
		}
	}	
}
