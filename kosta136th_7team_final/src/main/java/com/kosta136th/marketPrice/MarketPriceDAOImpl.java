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

}
