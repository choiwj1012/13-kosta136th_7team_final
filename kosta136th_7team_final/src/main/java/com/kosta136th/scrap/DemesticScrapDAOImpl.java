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

	@Override
	public int getUserNumber(String email) throws Exception {
		return session.selectOne(namespace + ".getUserNum", email);
	}

	@Override
	public String demScrapCheck(DemesticScrap vo) throws Exception {
		
		return session.selectOne(namespace + ".demScrapCheck", vo);
	}

	@Override
	public void removeDemesticScrap(DemesticScrap vo) throws Exception {
		session.delete(namespace + ".removeDemesticScrap", vo);
		
	}

	@Override
	public List<GETDemesticScrap> demScrapList(String email) throws Exception {
		int userNum = session.selectOne(namespace + ".getUserNum", email);
		
		return session.selectList(namespace + ".getDemScrapList", userNum);
	}


}
