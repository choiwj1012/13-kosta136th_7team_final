package com.kosta136th.marketPrice;

import java.util.List;

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

	@Override
<<<<<<< HEAD
	public List<MarketPriceChart> chart(String money_type) throws Exception {
		
		return dao.chart(money_type);
		
=======
	public List<MarketPrice> coinRateList() throws Exception {
		
		return dao.coinRateList();
>>>>>>> 5bf89bec30a4b3ab8ad217cbb72ee025027337d4
	}

}
