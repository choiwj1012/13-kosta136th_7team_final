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
	public List<MarketPrice> coinRateList(String array, String money_type) throws Exception {
		
		return dao.coinRateList(array, money_type);

	}

	@Override
	public List<MarketPrice> oneChart(OneChart oneChart) throws Exception {
		
		return dao.oneChart(oneChart);
		
	}

}
