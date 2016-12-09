package com.kosta136th.marketPrice;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class MarketPriceServiceImpl implements MarketPriceService{

	@Inject
	MarketPriceDAO dao;
	
	@Override
	public void rateSave(MarketPrice marketPrice) throws Exception {

		dao.rateSave(marketPrice);
		
	}

}
