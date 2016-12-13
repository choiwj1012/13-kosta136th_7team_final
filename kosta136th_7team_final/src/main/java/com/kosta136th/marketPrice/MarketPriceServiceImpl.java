package com.kosta136th.marketPrice;

<<<<<<< HEAD
import javax.inject.Inject;

=======
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
>>>>>>> 68931bff15b818f1830116c0a776d19068dfc30a
public class MarketPriceServiceImpl implements MarketPriceService{

	@Inject
	MarketPriceDAO dao;
	
	@Override
<<<<<<< HEAD
	public void rateSave(MarketPrice marketPrice) throws Exception {
		
=======
	public void rateSave(MarketPriceSave marketPrice) throws Exception {

>>>>>>> 68931bff15b818f1830116c0a776d19068dfc30a
		dao.rateSave(marketPrice);
		
	}

<<<<<<< HEAD
=======
	@Override
	public List<MarketPriceChart> chart(String money_type) throws Exception {
		
		return dao.chart(money_type);
		
	}
	
	@Override
	public List<MarketPrice> coinRateList() throws Exception {
		
		return dao.coinRateList();

	}

<<<<<<< HEAD
	@Override
	public List<MarketPriceChart> oneChart(String money_type) throws Exception {
		
		return dao.oneChart(money_type);
		
	}

=======
>>>>>>> 68931bff15b818f1830116c0a776d19068dfc30a
>>>>>>> 1ca1d6b44d4835eff6b2fce4b90164208e285677
}
