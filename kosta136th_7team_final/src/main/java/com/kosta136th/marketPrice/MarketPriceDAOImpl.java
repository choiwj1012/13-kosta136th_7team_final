package com.kosta136th.marketPrice;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class MarketPriceDAOImpl implements MarketPriceDAO{

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.kosta136th.mapper.marketPriceMapper";
	
	
	@Override
	public void rateSave(MarketPriceSave marketPrice) throws Exception {
		
		sqlSession.insert(namespace + ".rateSave", marketPrice);
		
	}

	@Override
	public List<MarketPriceChart> chart(String money_type) throws Exception {
		
		return sqlSession.selectList(namespace + ".chartData", money_type);

	}	
	
	@Override
	public List<MarketPrice> coinRateList() throws Exception {
		
		return sqlSession.selectList(namespace + ".bitcoinList");

		
	}

	@Override
	public List<MarketPriceChart> oneChart(MarketPriceChartInput marketPriceChartInput) throws Exception {
		
		System.out.println("marketPriceChartInput.getBtnvalue(): " + marketPriceChartInput.getMoneyType() );
		System.out.println("marketPriceChartInput.getValue(): " + marketPriceChartInput.getCoinName() );
		
		List<MarketPriceChart> test = sqlSession.selectList(namespace + ".oneChart", marketPriceChartInput);
		
		System.out.println("test.get(0).getPrice_usd() : "+ test.get(0).getPrice_usd());
		System.out.println("test.get(0).getPrice_btc() : "+ test.get(0).getPrice_btc());
		System.out.println("test.get(0).getPrice_btc() : "+ test.get(0).getTimestamp());
		System.out.println("test.get(1).getPrice_btc() : "+ test.get(1).getTimestamp());
		System.out.println("test.get(2).getPrice_btc() : "+ test.get(2).getTimestamp());
		System.out.println("test.get(3).getPrice_btc() : "+ test.get(3).getTimestamp());
		System.out.println("test.get(4).getPrice_btc() : "+ test.get(4).getTimestamp());
		System.out.println("test.get(5).getPrice_btc() : "+ test.get(5).getTimestamp());
		
		return test;
		//return sqlSession.selectList(namespace + ".oneChart", marketPriceChartInput);
		
	}

}
