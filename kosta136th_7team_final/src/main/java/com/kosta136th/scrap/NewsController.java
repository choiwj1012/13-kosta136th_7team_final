package com.kosta136th.scrap;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
@Controller
public class NewsController {
	
	@Inject
    private DemesticScrapService demService; 
	@Inject
	private AbroadScrapService abrService;
	@Inject
	private AddEmailService emailService;
	
	@RequestMapping(value = "/news", method = RequestMethod.GET)
	public String news(SearchInfo vo, Criteria cri, Model model) throws Exception{
		int page = 1;
		int pageStart = cri.getPageStart();
		int perPageNum = cri.getPerPageNum();
		int searchTF = 0;
		String searchKeyword = vo.getSearchKeyword();
		String tab = "news/tab1";
		List<DemesticScrap> searchlist = new ArrayList<DemesticScrap>();
		List<DemesticPopular> demPopularNews = demService.popularNews();
		
		model.addAttribute("page", page);
		model.addAttribute("tab", tab);
		model.addAttribute("demPopularNews", demPopularNews);
		
		if(searchKeyword == null)
		{
			String keyword = "비트코인";
	    	List<DemesticScrap> list = demService.newsList(keyword, perPageNum,pageStart);
	        model.addAttribute("newsList", list);
	        PageMaker pageMaker = new PageMaker();
	        pageMaker.setCri(cri);
	        pageMaker.setTotalCount(100);
	        model.addAttribute("pageMaker", pageMaker);
			model.addAttribute("searchTF", searchTF);
			model.addAttribute("searchKeyword", searchKeyword);
			return "sub/news/news";
			
		}
		else
		{
			String keyword = "비트코인 " + searchKeyword;
	    	List<DemesticScrap> list = demService.newsList(keyword, 100, 1);
	    	int startIndex = ((page-1)*(cri.getPerPageNum()-1))+page-1;
	    	int endIndex = startIndex+cri.getPerPageNum()-1;
	    	for(int i = startIndex ; i < endIndex; i++)
	    	{
	    		if(i >= list.size())
	    		{
	    			break;
	    		}
	    		searchlist.add(list.get(i));
	    	}
	        model.addAttribute("newsList", searchlist);
	        PageMaker pageMaker = new PageMaker();
	        pageMaker.setCri(cri);
	        pageMaker.setTotalCount(list.size());
	        model.addAttribute("pageMaker", pageMaker);
	        searchTF = 1;
			model.addAttribute("searchTF", searchTF);
			return "sub/news/news";
		}
	}
	
	
	@RequestMapping(value = "/news/tab1", method = RequestMethod.GET)
	public String newsTab1(@RequestParam(value = "page", required=false, defaultValue="1") int page, SearchInfo vo, Criteria cri, Model model) throws Exception{
		model.addAttribute("page", page);
    	List<DemesticScrap> searchlist = new ArrayList<DemesticScrap>();
		String tab = "tab1";
		List<DemesticPopular> demPopularNews = demService.popularNews();
		String searchKeyword = vo.getSearchKeyword();
		int searchTF = 0;
		model.addAttribute("searchTF", searchTF);
		model.addAttribute("searchKeyword", searchKeyword);
		model.addAttribute("tab", tab);
		model.addAttribute("demPopularNews", demPopularNews);
		
		if(searchKeyword == null)
		{
			int pageStart = cri.getPageStart();
			int perPageNum = cri.getPerPageNum();
	    	String keyword = "비트코인";
	    	List<DemesticScrap> list = demService.newsList(keyword,perPageNum, pageStart);
	        model.addAttribute("newsList", list);
	        PageMaker pageMaker = new PageMaker();
	        pageMaker.setCri(cri);
	        pageMaker.setTotalCount(100);
	        model.addAttribute("pageMaker", pageMaker);
			return "sub/news/news";
		}
		
		else
		{
	    	String keyword = "비트코인 " + searchKeyword;
	    	List<DemesticScrap> list = demService.newsList(keyword, 100, 1);
	    	int startIndex = ((page-1)*(cri.getPerPageNum()-1))+page-1;
	    	int endIndex = startIndex+cri.getPerPageNum()-1;
	    	for(int i = startIndex ; i < endIndex; i++)
	    	{
	    		if(i >= list.size())
	    		{
	    			break;
	    		}
	    		searchlist.add(list.get(i));
	    	}
	        model.addAttribute("newsList", searchlist);
	        PageMaker pageMaker = new PageMaker();
	        pageMaker.setCri(cri);
	        pageMaker.setTotalCount(list.size());
	        model.addAttribute("pageMaker", pageMaker);
	        searchTF = 1;
			model.addAttribute("searchTF", searchTF);
			return "sub/news/news";
		}
	}
	
	@RequestMapping(value = "/news/tab2", method = RequestMethod.GET)
	public String newsTab2(@RequestParam(value = "page", required=false, defaultValue="1") int page, SearchInfo vo, Criteria cri, Model model) throws Exception{
		int searchTF = 0;
		String searchKeyword = vo.getSearchKeyword();
		String tab = "tab2";
		List<AbroadPopular> demPopularNews = abrService.popularNews();
		
		model.addAttribute("tab", tab);
		model.addAttribute("searchTF", searchTF);
		model.addAttribute("searchKeyword", searchKeyword);
		model.addAttribute("page", page);
		model.addAttribute("demPopularNews", demPopularNews);
		
		if(searchKeyword == null)
		{
	    	List<AbroadScrap> abrList = abrService.serachNews(page);
	        model.addAttribute("abrNewsList", abrList);
	        PageMaker pageMaker = new PageMaker();
	        pageMaker.setCri(cri);
	        pageMaker.setTotalCount(100);
	        model.addAttribute("pageMaker", pageMaker);
	        return "sub/news/news";
		}
		else
		{
	    	List<AbroadScrap> abrList = abrService.serachAllNews();
	    	List<AbroadScrap> searchAbrlist = new ArrayList<AbroadScrap>();
	    	for(int i = 0; i < abrList.size(); i++)
	    	{
	    		if(abrList.get(i).getTitle().contains(searchKeyword))
	    		{
	    			searchAbrlist.add(abrList.get(i));
	    		}	    		
	    	}
	    	int startIndex = ((page-1)*(cri.getPerPageNum()-1))+page-1;
	    	int endIndex = startIndex+cri.getPerPageNum()-1;
	    	List<AbroadScrap> returnSearchAbrlist = new ArrayList<AbroadScrap>();
	    	for(int i = startIndex ; i < endIndex; i++)
	    	{
	    		if(i >= searchAbrlist.size())
	    		{
	    			break;
	    		}
	    		returnSearchAbrlist.add(searchAbrlist.get(i));
	    	}
	        model.addAttribute("abrNewsList", returnSearchAbrlist);
	        PageMaker pageMaker = new PageMaker();
	        pageMaker.setCri(cri);
	        pageMaker.setTotalCount(searchAbrlist.size());
	        model.addAttribute("pageMaker", pageMaker);
	        System.out.println(searchAbrlist.size());
	        searchTF = 1;
			model.addAttribute("searchTF", searchTF);
	        return "sub/news/news";
		}
		
	}
	
	//국내기사 스크랩
		@ResponseBody
		@RequestMapping(value = "/addDemesticScrap", method = RequestMethod.POST)
		public String addDemesticScrap(@RequestBody DemesticScrap vo) throws Exception{
			String result = "false";
			int userNum = demService.getUserNumber(vo.getEmail());
			vo.setUser_num(userNum);
			vo.setKeyword("비트코인");
			String scrapTF = demService.demScrapCheck(vo);
			System.out.println(scrapTF);
			if(scrapTF != null)
			{
				demService.removeDemesticScrap(vo);
				result = "false";
			}
			else
			{
				demService.addDemesticScrap(vo);
				result = "true";
			}
			
			
			
			return result;
		}
	
	//해외기사 스크랩
	@ResponseBody
	@RequestMapping(value = "/addAbroadScrap", method = RequestMethod.POST)
	public String addAbroadScrap(@RequestBody AbroadScrap vo) throws Exception{
		String result = "false";
		
		int userNum = demService.getUserNumber(vo.getEmail());
		vo.setUser_num(userNum);
		String scrapTF = abrService.abrScrapCheck(vo);
		
		if(scrapTF != null)
		{
			abrService.removeAbroadScrap(vo);
			result = "false";
		}
		else
		{
			abrService.addAbroadScrap(vo);
			result = "true";
		}
		
		return result;
	}
	
	
	
	//구독신청
	@ResponseBody
	@RequestMapping(value = "/getEmail", method = RequestMethod.POST)
	public String getEmail(@RequestBody String email) throws Exception{
		String email2 = email.replace("\"", "");
		emailService.addEmail(email2);
		return "true";
	}
}
