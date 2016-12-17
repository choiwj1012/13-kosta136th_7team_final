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
	public List<MarketPrice> coinRateList(String sorting_type, String money_type) throws Exception {
		
		if(sorting_type.equals("Label")) {
			
			return sqlSession.selectList(namespace + ".bitcoinListLABEL");
			
		} else if(sorting_type.equals("Name")) {
			
			return sqlSession.selectList(namespace + ".bitcoinListNAME");
			
		} else if(sorting_type.equals("Price")) {
			
			if(money_type.equals("PRICE_BTC")) {
				
				return sqlSession.selectList(namespace + ".bitcoinListPRICE", money_type);
				
			} else if (money_type.equals("PRICE_USD")) {
				
				return sqlSession.selectList(namespace + ".bitcoinListPRICE", money_type);
				
			} else if (money_type.equals("PRICE_CNY")) {
				
				return sqlSession.selectList(namespace + ".bitcoinListPRICE", money_type);
				
			} else if (money_type.equals("PRICE_EUR")) {
				
				return sqlSession.selectList(namespace + ".bitcoinListPRICE", money_type);
				
			} else if (money_type.equals("PRICE_GBP")) {
				
				return sqlSession.selectList(namespace + ".bitcoinListPRICE", money_type);
				
			} else if (money_type.equals("PRICE_RUR")) {
				
				return sqlSession.selectList(namespace + ".bitcoinListPRICE", money_type);
				
			}
			
		}
		
		return sqlSession.selectList(namespace + ".bitcoinList");
		
	}

	@Override
	public List<MarketPrice> oneChart(OneChart oneChart) throws Exception {

		return sqlSession.selectList(namespace + ".oneChart", oneChart);
		
	}

}
