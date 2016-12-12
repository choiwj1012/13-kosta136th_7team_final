package com.kosta136th.marketPrice;

import java.util.List;

public interface MarketPriceDAO {

	public void rateSave(MarketPriceSave marketPrice) throws Exception;
	
	public List<MarketPriceChart> chart(String money_type) throws Exception;

	public List<MarketPrice> coinRateList() throws Exception;

}
