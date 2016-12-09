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
	public String searchScrap(@RequestBody SearchInfo vo) throws Exception{
		String tabInfo = vo.getTabInfo();
		String searchKeyword = vo.getSearchKeyword();
		System.out.println("서치실행");
		System.out.println("tabInfo : " + tabInfo);
		System.out.println("searchKeyword : " + searchKeyword);
		if(tabInfo.equals("tab1"))
		{
			List<DemesticScrap> list = demService.searchNews(searchKeyword);
			return "sub/news/tab1";
		}
		else
		{
			return "sub/news/tab2";
		}
	}	
}
