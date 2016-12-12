package com.kosta136th.marketPrice;

import java.util.List;

public interface MarketPriceDAO {

	public void rateSave(MarketPrice marketPrice) throws Exception;
	
<<<<<<< HEAD
	public List<MarketPriceChart> chart(String money_type) throws Exception;

=======
	public List<MarketPrice> coinRateList() throws Exception;
>>>>>>> 5bf89bec30a4b3ab8ad217cbb72ee025027337d4
}
