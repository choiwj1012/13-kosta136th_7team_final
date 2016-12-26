package com.kosta136th.dealerNews;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class DealerNewsFileDAOImpl implements DealerNewsFileDAO{
	
	@Inject
	private SqlSession sqlSession;
	
	private static String namespace = "com.kosta136th.mapper.dealerNewsMapper";
	
	@Override
	public int getAutoIncrementOfDealerNews() {
		int auto_increment = 0;
		try{
		auto_increment = sqlSession.selectOne(namespace + ".getAutoIncrementOfDealerNews");
		System.out.println(auto_increment);
		}catch(Exception e){
			e.printStackTrace();
		}
		return auto_increment;
	}

}
