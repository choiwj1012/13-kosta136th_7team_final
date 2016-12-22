package com.kosta136th.dealerNews;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class DealerNewsReplyController {
	@Inject
	private DealerNewsReplyService dealerNewsReplyService;
	
	@RequestMapping("/getDealerNewsReplyList")
	@ResponseBody
	public List<DealerNewsReply> getDealerNewsReplyList
	(String dealer_news_num, DealerNews dealerNews, Model model){
		
		System.out.println("★★★★★★★★★★★★★★★★★★★★");
		System.out.println("/getDealerNewsReplyList");
		System.out.println("★★★★★★★★★★★★★★★★★★★★");
		System.out.println("페이지 정보 : " + dealerNews.toString());
		
		//실행 코드는 이거 하나. 나머지는 다 디버깅 코드
		List<DealerNewsReply> DealerNewsReplyList = dealerNewsReplyService.getDealerNewsReplyList(dealerNews);
		
		System.out.println("해당 글에 대한 댓글 목록 : ");
		for (DealerNewsReply reply : DealerNewsReplyList){
			System.out.println(reply.toString());
		}
		
		return DealerNewsReplyList;
	}
	
	@RequestMapping("/writeReply")
	@ResponseBody
	public void writeReply(DealerNewsReply dealerNewsReply, HttpSession httpSession){

		System.out.println("★★★★★★★★★★★★★★★★★★★★");
		System.out.println("/writeReply");
		System.out.println("★★★★★★★★★★★★★★★★★★★★");
		System.out.println("다음의 내용을 댓글 등록 요청함:");
		System.out.println(dealerNewsReply.toString());

		dealerNewsReplyService.writeReply(dealerNewsReply, httpSession);
	}
	
	@RequestMapping("/deleteReply")
	@ResponseBody
	public void deleteReply(DealerNewsReply dealerNewsReply){
		
		System.out.println("★★★★★★★★★★★★★★★★★★★★");
		System.out.println("/deleteReply");
		System.out.println("★★★★★★★★★★★★★★★★★★★★");
		System.out.println("다음의 내용을 댓글 삭제 요청함:");
		System.out.println(dealerNewsReply.toString());
		
		dealerNewsReplyService.deleteReply(dealerNewsReply);
	}
	
}
