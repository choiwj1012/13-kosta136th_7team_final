package com.kosta136th.dealerNews;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DealerNewsController {

	@Inject
	private DealerNewsService dealerNewsService;
	
	/*@ModelAttribute("typeMap")
	public Map<String, String> seachTypeMap(){
		Map<String, String> typeMap = new HashMap<String, String>();
		typeMap.put("제목", "TITLE");
		typeMap.put("내용", "CONTENT");
		return typeMap;
	}*/
	
	@RequestMapping("/btcInfoLand_board_list2")
	public String requestDealerNewsList(DealerNews pageMaker, Model model){
		try{
			System.out.println("★★★★★★★★★★★★★★★★★★★★");
			System.out.println("/btcInfoLand_board_list");
			System.out.println("★★★★★★★★★★★★★★★★★★★★");
			System.out.println("페이지 정보 : " + pageMaker.toString());

			//처음 로딩 되는 경우가 이렇다.
			if (pageMaker.getDealer_news_num() == 0){
				//자동으로
				//private String title = null;
				//private String content = null;
				//private int currentPage = 1;
				//private int perPageNum = 6;
				//private int perPagebarPage = 5;
				//firstPage = 0;
				//lastPage = 0;
			}
			
			//DealerNews의
			//limit(currentPage로부터 min(perPageNum, getDealerNewsListSize() - 1 )만큼 출력)한다.
			int startDealerNewsIndex = (pageMaker.getCurrentPage() - 1)
									* (pageMaker.getPerPageNum()); //0부터 시작이 아니다.
			int howMuch = Math.min(pageMaker.getPerPageNum(), 
					(getDealerNewsListSize() - 1) - startDealerNewsIndex + 1);
			
			//설명용 주석
			//int lastDealerNewsIndex = startDealerNewsIndex + howMuch - 1;
			//페이지 정보
			List<DealerNews> dealerNewsList = dealerNewsService.getDealerNewsList(startDealerNewsIndex, howMuch);

			model.addAttribute("pageMaker", dealerNewsService.getPageMaker(pageMaker));
			model.addAttribute("dealerNewsList", dealerNewsList);

		}catch(Exception e){
			e.printStackTrace();
		}

		return "sub/btcInfoLand/btcInfoLand_board_list";
	}
	
	private int getDealerNewsListSize() {
		return dealerNewsService.getDealerNewsListSize();
	}

	@RequestMapping("/btcInfoLand_board_read2")
	public String requestDealerNews(DealerNews pageMaker, Model model){
		
		System.out.println("★★★★★★★★★★★★★★★★★★★★");
		System.out.println("/btcInfoLand_board_read");
		System.out.println("★★★★★★★★★★★★★★★★★★★★");
		System.out.println("페이지 정보 : " + pageMaker.toString());
		
		//현재 글번호에 맞추어서 페이지를 재설정 : getPageMakerByDealerNewsNo
		dealerNewsService.getPageMakerByDealerNewsNo(pageMaker);
		
		/*
		아래 작업은 할 필요가 없다. 
		
		//첫 페이지와 끝 페이지를 재설정
		dealerNewsService.getPageMaker(pageMaker);
		
		*/
		
		//글번호에 해당하는 뉴스를 가져 온다.
		dealerNewsService.getNews(pageMaker);
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "sub/btcInfoLand/btcInfoLand_board_read";
	}
	
	@RequestMapping("/btcInfoLand_board_read_to_list")
	public String requestDealerNewsReadToList(DealerNews pageMaker, Model model){
		
		System.out.println("★★★★★★★★★★★★★★★★★★★★");
		System.out.println("/btcInfoLand_board_read_to_list");
		System.out.println("★★★★★★★★★★★★★★★★★★★★");
		System.out.println("페이지 정보 : " + pageMaker.toString());
		
		//글번호가 삭제되어 있는지 삭제가 안 되어 있는지를 판별하기 위한 리트머스 시험지
		DealerNews checkIfAny = dealerNewsService.getNews(pageMaker);
		//해당 글이 존재하지 않으면 첫 페이지로
		if (checkIfAny == null){
			System.out.println("해당 글은 이제 존재하지 않습니다");
			pageMaker.setCurrentPage(1);
		} else {
			//해당 글이 존재하면 글번호에 맞추어서 현재 페이지를 정하고 이동
			dealerNewsService.getPageMakerByDealerNewsNo(pageMaker);			
		}

//		model.addAttribute("pageMaker", pageMaker);
		
		return requestDealerNewsList(pageMaker, model);
	}
	
	@RequestMapping("/writeNews")
	public String requestWriteNews(DealerNews pageMaker, Model model, HttpSession httpSession){
		
		System.out.println("★★★★★★★★★★★★★★★★★★★★");
		System.out.println("새로 쓴 dealerNews : " + pageMaker.toString());
		System.out.println("★★★★★★★★★★★★★★★★★★★★");

		dealerNewsService.writeNews(pageMaker, httpSession);

		//글쓰기는 글쓰기 당시 글번호를 모르므로 목록 1페이지로 처리된다
		//삭제는 글번호를 아는 상태이므로 read_to_list를 통하여 목록 화면으로 간다
		//글번호가 존재하지 않으면 역시 목록 1페이지로 처리된다.
		//읽기, 수정은 페이지를 아는 상태이므로 하나 읽기 화면으로 간다
		//페이지가 존재하지 않으면 목록에는
		//맨 앞 페이지를 보여주도록 처리되었다.
		
		pageMaker.setCurrentPage(1);
		return requestDealerNewsList(pageMaker, model);	
	}
	
	@RequestMapping("/deleteNews")
	public String requestDeleteNews(DealerNews pageMaker, Model model){
		
		System.out.println("★★★★★★★★★★★★★★★★★★★★");
		System.out.println("삭제할 뉴스 : " + pageMaker.toString());
		System.out.println("★★★★★★★★★★★★★★★★★★★★");
		
		dealerNewsService.deleteNews(pageMaker);
				
		//글쓰기는 글쓰기 당시 글번호를 모르므로 목록 1페이지로 처리된다
		//삭제는 글번호를 아는 상태이므로 read_to_list를 통하여 목록 화면으로 간다
		//글번호가 존재하지 않으면 역시 목록 1페이지로 처리된다.
		//읽기, 수정은 페이지를 아는 상태이므로 하나 읽기 화면으로 간다
		//페이지가 존재하지 않으면 목록에는
		//맨 앞 페이지를 보여주도록 처리되었다.
		return requestDealerNewsReadToList(pageMaker, model);
		
	}
	
	@RequestMapping("/modifyNews")
	public String requestModifyNews(DealerNews pageMaker, Model model){
		
		System.out.println("★★★★★★★★★★★★★★★★★★★★");
		System.out.println("제출된 수정안 : " + pageMaker.toString());
		System.out.println("★★★★★★★★★★★★★★★★★★★★");
		
		dealerNewsService.modifyNews(pageMaker);
		
		//글쓰기, 삭제는 목록 화면으로 간다
		//읽기, 수정은 하나 읽기 화면으로 간다
		//페이지가 존재하지 않으면 목록에는
		//맨 앞 페이지를 보여주도록 처리되었다.		
		return requestDealerNews(pageMaker, model);	
	}
	
	//이전 뉴스 가져오기
	@RequestMapping("/getPreviousNews")
	public String requestGetPreviousNews(DealerNews pageMaker, Model model){
		System.out.println("★★★★★★★★★★★★★★★★★★★★");
		System.out.println("requestGetPreviousNews");
		System.out.println("★★★★★★★★★★★★★★★★★★★★");
		System.out.println("올 때 글 정보 : " + pageMaker.toString());
		
		DealerNews previousNews = dealerNewsService.getPreviousNews(pageMaker);

		pageMaker.setDealer_news_num(
				previousNews.getDealer_news_num());
		pageMaker.setTitle(
				previousNews.getTitle());
		pageMaker.setContent(
				previousNews.getContent());
		pageMaker.setRegi_date(
				previousNews.getRegi_date());	
		
		System.out.println("나갈 때 글 정보 : " + pageMaker.toString());
		
		return requestDealerNews(pageMaker, model);
		
	}
	
	//다음 뉴스 가져오기
	@RequestMapping("/getNextNews")
	public String requestGetNextNews(DealerNews pageMaker, Model model){
		System.out.println("★★★★★★★★★★★★★★★★★★★★");
		System.out.println("requestGetNextNews");
		System.out.println("★★★★★★★★★★★★★★★★★★★★");
		System.out.println("올 때 글 정보 : " + pageMaker.toString());

		DealerNews nextNews = dealerNewsService.getNextNews(pageMaker);

		pageMaker.setDealer_news_num(
				nextNews.getDealer_news_num());
		pageMaker.setTitle(
				nextNews.getTitle());
		pageMaker.setContent(
				nextNews.getContent());
		pageMaker.setRegi_date(
				nextNews.getRegi_date());		

		System.out.println("나갈 때 글 정보 : " + pageMaker.toString());

		return requestDealerNews(pageMaker, model);
		
	}
	
}
