package com.kosta136th.dealer;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/sub/btcInfoLand/*")
public class DealerController {

	@Inject
	DealerService service;
	
	// BTC 정보광장 Index Mapping
	@RequestMapping(value = "/btcInfoLand", method = RequestMethod.GET)
	public String btcInfoLand(HttpSession session, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{
		
		model.addAttribute("list", service.allListSearch(cri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		pageMaker.setTotalCount(service.listSearchCount(cri));
		
		model.addAttribute("pageMaker", pageMaker);
	
		return "sub/btcInfoLand/btcInfoLand";
		
	}
	
	//딜러페이지 저장뷰 불러오기
	@RequestMapping(value = "/dealerPageSave", method = RequestMethod.GET)
	public void dealerPageSaveLoad() throws Exception {

		
	}
	
	//딜러페이지 저장
	@RequestMapping(value = "/dealerPageSave", method = RequestMethod.POST)
	public String dealerPageSave(Dealer dealer, HttpSession session, RedirectAttributes rttr) throws Exception {

		
		boolean check = true;
		String dealer_join_id = (String) (( (Map<String,Object>)( session.getAttribute("login"))).get("USER_EMAIL"));

		List<Dealer> dealerList = service.userTypeCheck();

		for (int i = 0 ; i <dealerList.size(); i++) {
			
			if (dealer_join_id.equals(dealerList.get(i).getUser_email())) {
				
				dealer.setUser_num(dealerList.get(i).getUser_num());
				
			}
		}
		
		List<Dealer> dealerPageList = service.dealerPageDuplicationCheck();
		
		if (dealer.getUser_num() != 0) {
			
			for (int j = 0 ; j < dealerPageList.size(); j++){
				
				if (dealer.getUser_num() == dealerPageList.get(j).getUser_num()) {
					
					check = false;
					rttr.addFlashAttribute("result", "false");
					
				}
			}
			
			if (check == true) {

				service.regist(dealer);
				rttr.addFlashAttribute("result", "success");
				
			}
			
		} else {
			
			rttr.addFlashAttribute("result", "false");
			
		}
		
		return "redirect:/sub/btcInfoLand/btcInfoLand";
		
	}
	//딜러페이지 읽기
	@RequestMapping(value = "/btcInfoLand_board_list", method = RequestMethod.GET)
	public void dealerPageRead(HttpSession session, @RequestParam("dealer_page_num") int dealer_page_num, @ModelAttribute("cri") SearchCriteria cri,Model model) throws Exception {

		
		//내공
		Dealer dealer = new Dealer();
		String useremail = service.read(dealer_page_num).getUser_email();
		String nickName = service.read(dealer_page_num).getUser_nickName();
		String category = service.read(dealer_page_num).getCategory();
		int dealerNum = service.read(dealer_page_num).getDealer_page_num();
		
		dealer.setScore(service.score(dealer_page_num));
		dealer.setCategory(category);
		dealer.setUser_nickName(nickName);
		dealer.setDealer_page_num(dealerNum);
		dealer.setUser_email(useremail);
		//딜러정보
		model.addAttribute(dealer);
		

		
	}
	//딜러 페이지 삭제
	@RequestMapping(value = "/dealerPageRemove", method = RequestMethod.POST)
	public String dealerPageRemove(@RequestParam("dealerNum") int dealer_page_num, SearchCriteria cri, RedirectAttributes rttr) throws Exception {

		service.remove(dealer_page_num);
		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		rttr.addFlashAttribute("result", "success");
		
		return "redirect:/sub/btcInfoLand/btcInfoLand";
		
	}
	
	//딜러 정보 업데이트
	@RequestMapping(value = "/dealerPageUpdate", method = RequestMethod.GET)
	public void dealerPageUpdateLoad(@RequestParam("dealerNum") int dealer_page_num, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		
		model.addAttribute(service.read(dealer_page_num));
		
	}
	
	
	//딜러 정보 업데이트
	@RequestMapping(value = "/dealerPageUpdate", method = RequestMethod.POST)
	public String dealerPageUpdate(Dealer dealer, SearchCriteria cri, RedirectAttributes rttr) throws Exception {
		
		service.modify(dealer);
		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		rttr.addFlashAttribute("result", "success");
		
		return "redirect:/sub/btcInfoLand/btcInfoLand";
	}
	//추천 신고
	@RequestMapping(value = "dealerPageButtoncheck", method = RequestMethod.GET)
	@ResponseBody
	public String dealerPageButtonCheck(@RequestParam("login") String email, @RequestParam("likeCheck") String likeCheck, @RequestParam("disLikeCheck") String disLikeCheck,
			@RequestParam("dealerNum") int dealerNum, @ModelAttribute("cri") SearchCriteria cri, HttpServletResponse response) throws Exception {
		String status = "fale";
		int dealerUserNum = service.searchDealerUserNum(dealerNum);
		
		int userNum = service.userNum_read(email);
		
		List<Dealer> userCheck = service.checkUserNum(dealerUserNum, likeCheck, disLikeCheck);
		
		List<Dealer> dealerPageCheck = service.checkDealerPageNum(dealerNum, likeCheck, disLikeCheck);
		if (userCheck.size() != 0 && dealerPageCheck.size() != 0){
			for (int i = 0; i < userCheck.size(); i++) {
				for (int j = 0; j < dealerPageCheck.size(); j++) {
					
				
				if (userCheck.get(i).getUser_num() == userNum && dealerPageCheck.get(j).getDealer_page_num() == dealerNum) {
					
					return status;
					
					}
				}
			}
		}

			service.likeEvent(likeCheck, disLikeCheck, dealerNum, dealerUserNum);
			status = "good";
			return status;
	}
	
	@RequestMapping(value = "dealerMyPage", method = RequestMethod.GET)
	@ResponseBody
	public int dealerMyPage(@RequestParam("login") String login, HttpServletResponse response) throws Exception {
		
		 int dealer_page_num = service.dealerMypage(login);

		return dealer_page_num;
	}

}
