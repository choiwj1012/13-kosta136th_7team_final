package com.kosta136th.marketPrice;

import java.util.List;

public interface MarketPriceService {

	public void rateSave(MarketPriceSave marketPrice) throws Exception;
	
	public List<MarketPriceChart> chart(String money_type) throws Exception;

	public List<MarketPrice> coinRateList() throws Exception;

	public List<MarketPriceChart> oneChart(String money_type) throws Exception;

}
