package com.kosta136th.marketPrice;

import java.util.List;

public interface MarketPriceService {

<<<<<<< HEAD
	public void rateSave(MarketPrice marketPrice) throws Exception;
	
	
=======
	public void rateSave(MarketPriceSave marketPrice) throws Exception;
	
	public List<MarketPriceChart> chart(String money_type) throws Exception;

	public List<MarketPrice> coinRateList() throws Exception;
>>>>>>> 68931bff15b818f1830116c0a776d19068dfc30a

	public List<MarketPriceChart> oneChart(String money_type) throws Exception;

}
