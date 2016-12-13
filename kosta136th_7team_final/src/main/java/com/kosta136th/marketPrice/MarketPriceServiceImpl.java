package com.kosta136th.marketPrice;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class MarketPriceServiceImpl implements MarketPriceService{

	@Inject
	MarketPriceDAO dao;
	
	@Override
	public void rateSave(MarketPriceSave marketPrice) throws Exception {

		dao.rateSave(marketPrice);
		
	}

	@Override
	public List<MarketPriceChart> chart(String money_type) throws Exception {
		
		return dao.chart(money_type);
		
	}
	
	@Override
	public List<MarketPrice> coinRateList() throws Exception {
		
		return dao.coinRateList();

	}

	@Override
	public List<MarketPriceChart> oneChart(String money_type) throws Exception {
		
		return dao.oneChart(money_type);
		
	}

}
