package com.kosta136th.marketPrice;

import javax.inject.Inject;

import org.apache.log4j.spi.LoggerFactory;
import org.slf4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/marketPrice")
public class MarketPriceController {

	private static final Logger logger = LoggerFactory.getLogger(MarketPriceController.class);
	
	@Inject
	private MarketPriceService marketPriceService;
	
	@RequestMapping(value = "/rate", method = RequestMethod.GET)
	public String callRateoutput(Model model) {
		
		marketPriceService.rate(marketPriceList, rateList);
		
		model.addAttribute("marketPriceList", marketPriceList);
		model.addAttribute("rateList", rateList);
		
		return "/sub/graph";
		
	}
	
}
