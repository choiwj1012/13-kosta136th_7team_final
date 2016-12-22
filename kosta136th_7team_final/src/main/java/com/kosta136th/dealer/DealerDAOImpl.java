package com.kosta136th.dealer;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class DealerDAOImpl implements DealerDAO{

	@Inject
	private SqlSession session;
	
	private static String namespace = "com.kosta136th.mapper.dealerMapper";

	@Override
	public List<Dealer> userTypeCheck() throws Exception {
		
		return session.selectList(namespace + ".userTypeCheck");
	}

	@Override
	public void create(Dealer dealer) throws Exception {
	
		session.insert(namespace + ".insert", dealer);
		
	}

	@Override
	public List<Dealer> dealerPageDuplicationCheck() throws Exception {
		
		return session.selectList(namespace + ".dealerPageDuplicationCheck");
	}

	@Override
	public Dealer read(int dealer_page_num) throws Exception {
		
		return session.selectOne(namespace + ".read", dealer_page_num);
	}

	@Override
	public void remove(int dealer_page_num) throws Exception {
		
		session.delete(namespace + ".delete", dealer_page_num);
		
	}

	@Override
	public int score(int dealer_page_num) throws Exception {
		
		return session.selectOne(namespace + ".score", dealer_page_num);
		
	}

	@Override
	public void update(Dealer dealer) throws Exception {
		
		session.update(namespace + ".update", dealer);
		
	}

	@Override
	public void likeEvent(String likeCheck, String disLikeCheck, int dealerNum) throws Exception {
		
		if(likeCheck.equals("checked")) {
			
			session.update(namespace + ".like", dealerNum);
		} else if(disLikeCheck.equals("checked")) {
			
			session.update(namespace + ".dislike", dealerNum);
		}

	}

	@Override
	public List<Dealer> allListSearch(SearchCriteria cri) throws Exception {

		return session.selectList(namespace + ".searchList", cri);
	}
	
	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		
		return session.selectOne(namespace + ".listSearchCount", cri);
	}

}
