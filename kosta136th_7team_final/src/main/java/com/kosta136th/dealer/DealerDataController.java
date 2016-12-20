package com.kosta136th.dealer;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kosta136th.user.User;

@RestController
@RequestMapping("/dealer/*")
public class DealerDataController {

	@Inject
	DealerService service;

	//딜러페이지 저장
	@RequestMapping(value = "/dealerPageSave", method = RequestMethod.POST)
	public String DealerPageSave(HttpSession session, RedirectAttributes rttr) throws Exception {
		String id = ((User)(session.getAttribute("sadlfkjauhgoijhglkfa"))).getUSER_EMAIL();
		Dealer dealer = new Dealer();
		boolean check = true;
		String dealer_join_id = "DEALER1@GMAIL.COM";
		// 세션에서받아온 아이디를 스트링형 변수에저장된것을 괄호 안에 저장해줘야함
		List<Dealer> dealerList = service.check();
		
		for(int i = 0 ; i <dealerList.size(); i++) {
			
			if(dealer_join_id.equals(dealerList.get(i).getUser_email())) {
				
			 dealer.setUser_num(dealerList.get(i).getUser_num());
			}
		}
		List<Dealer> dealerPageList = service.list();
		
		if(dealer.getUser_num() != 0) {
			
			for(int j = 0 ; j < dealerPageList.size(); j++){
				
				if(dealer.getUser_num() == dealerPageList.get(j).getUser_num()) {
					System.out.println("딜러페이지가 존재합니다.");
					check = false;
				}
			}
			
			if(check == true) {
			dealer.setCategory("박성용멍청이");
			service.regist(dealer);
			}
			
		} else {
			System.out.println("딜러가 존재하지 않습니다.");
		}
		return "sub/btcInfoLand";
	}
	//딜러페이지 읽기
	@RequestMapping(value = "/dealerPageRead", method = RequestMethod.GET)
	public void dealerPageRead(Model model) throws Exception {
//		 @RequestParam("dealerNum") 
		//받아온 페이지 번호 
		
		int dealerNum = 3;
		int number = service.score(dealerNum);
//		Dealer name = service.read(dealerNum);
		Dealer name = service.read(dealerNum);
		System.out.println(number);
		System.out.println(name.getUser_nickName());
		System.out.println(name.getCategory());
		
//		model.addAttribute(service.read(dealerNum));
	}
	//딜러 페이지 삭제
	@RequestMapping(value = "dealerPageRemove", method = RequestMethod.POST)
	public String dealerPageRemove(Model model) throws Exception {
		
		int dealerNum = 1;
		
		service.remove(dealerNum);
		
		return "sub/btcInfoLand";
		
		
	}
	//딜러 정보 업데이트
//	@RequestMapping(value = "dealerPageUpdate", method = RequestMethod.GET)
//	public void dealerPageUpdateLoad(Model model) throws Exception {
//		int dealerNum;
//		model.addAttribute(service.read(dealerNum));
		
//	}
	//딜러 정보 업데이트
	@RequestMapping(value = "dealerPageUpdate", method = RequestMethod.POST)
	public String dealerPageUpdate(Model model) throws Exception {
		
		Dealer dealer = new Dealer();
		dealer.setCategory("바뀌었습니까");
		dealer.setDealer_page_num(2);
		service.modify(dealer);
		
		return "redirect:/sub/btcInfoLand";
		
	}
	//추천 신고
	@RequestMapping(value = "dealerPageButtoncheck", method = RequestMethod.GET)
	public void dealerPageButtonCheck(Model model) throws Exception {
		
		String likeCheck = "noCheck";
		String disLikeCheck = "checked";
		int dealerNum = 3;
		
		service.likeEvent(likeCheck, disLikeCheck, dealerNum);
		
	}
	
	@RequestMapping(value = "dealerPageList", method = RequestMethod.POST)
	public @ResponseBody List<Dealer> dealerPageList(@RequestBody Dealer dealer) throws Exception {
		
		System.out.println(dealer.getDealer_page_num());
		
		int bnoToStart = dealer.getDealer_page_num()-1;
		
		List<Dealer> dealerList = service.downList(bnoToStart);
		
		for (int i = 0; i < dealerList.size(); i++) {
		
//			System.out.println(dealerList.get(i).getUser_nickName());
//			System.out.println(dealerList.get(i).getCategory());
//			System.out.println(dealerList.get(i).getLike_count());
//			
		}
		
		return dealerList;
	}
	
	@RequestMapping(value = "/searchList", method = RequestMethod.GET)
	public List<Dealer> searchList(@RequestParam("page") int page, @RequestParam("search_type") 
	String search_type, HttpServletResponse response) throws Exception {
//		, "key" : key  @RequestParam("key") String key,
		SearchDealer searchDealer = new SearchDealer();
		
		searchDealer.setSearchType(search_type);
		
//		searchDealer.setKeyword(key);
		System.out.println(searchDealer.getSearchType());
		System.out.println(searchDealer.getKeyword());
		List<Dealer> dealerList = service.allListSearch(searchDealer);
		
		for (int i = 0; i < dealerList.size(); i++) {
			
			System.out.println(dealerList.get(i).getUser_nickName());
			
			System.out.println(dealerList.get(i).getCategory());
			System.out.println(dealerList.get(i).getLike_count());
			
		}
		
		return  dealerList;
		
	}
}
