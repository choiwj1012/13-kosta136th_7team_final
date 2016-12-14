package com.kosta136th.scrap;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class DemesticScrapDAOImpl implements DemesticScrapDAO{

	@Inject
	private SqlSession session;
	
	private static String namespace = "com.kosta136th.mapper.NewsMapper";
	
	@Override
	public void addDemesticScrap(DemesticScrap vo) throws Exception{
		session.insert(namespace + ".insertDemesticNews", vo);
	}
	
	@Override
	public List<DemesticPopular> popularNews() throws Exception {
		
		return session.selectList(namespace + ".searchDemesticNews");
	}


}
