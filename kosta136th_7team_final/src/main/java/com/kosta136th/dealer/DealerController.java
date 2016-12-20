package com.kosta136th.dealer;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class DealerController {

	@Inject
	DealerService service;
	
	// BTC 정보광장 Index Mapping
	@RequestMapping(value = "/btcInfoLand", method = RequestMethod.GET)
	public String btcInfoLand(Model model) throws Exception{
		
		List<Dealer> dealerList = service.allList();
		
		model.addAttribute("list", dealerList);
		
		return "sub/btcInfoLand/btcInfoLand";
		
	}
	
	//딜러페이지 저장뷰 불러오기
	@RequestMapping(value = "/dealerPageSave", method = RequestMethod.GET)
	public void DealerPageSaveLoad() throws Exception {
		
	}
	
	
	
}
