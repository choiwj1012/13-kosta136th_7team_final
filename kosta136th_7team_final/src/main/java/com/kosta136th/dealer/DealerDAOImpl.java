package com.kosta136th.dealer;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public void likeEvent(String likeCheck, String disLikeCheck, int dealerNum, int dealerUserNum) throws Exception {

		Dealer dealer = new Dealer();
		
		dealer.setUser_num(dealerUserNum);
		dealer.setDealer_page_num(dealerNum);
		
		if(likeCheck.equals("checked")) {
			
			session.update(namespace + ".like", dealer);
			session.insert(namespace + ".likeUser", dealer);
			
		} else if(disLikeCheck.equals("checked")) {
			
			session.update(namespace + ".dislike", dealer);
			session.insert(namespace + ".dislikeUser", dealer);
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

	@Override
	public int dealerMyPage(String login) throws Exception {
	
		return session.selectOne(namespace + ".dealerMyPage", login);
		
	}

	@Override
	public int userNum_read(String email) throws Exception {
		
		return session.selectOne(namespace + ".userNum_read", email);
	}

	@Override
	public int searchDealerUserNum(int dealerNum) throws Exception {
		
		return session.selectOne(namespace + ".searchDealerUserNum", dealerNum);
	}

	@Override
	public List<Dealer> checkUserNum(int dealerUserNum, String likeCheck, String disLikeCheck) throws Exception {
		Dealer dealer = new Dealer();
		dealer.setUser_num(dealerUserNum);
		if(likeCheck.equals("checked")) {
			
			return session.selectList(namespace + ".likeCheckUserNum", dealer);
			
		}
		
		return session.selectList(namespace + ".disLikeCheckUserNum", dealer);
		
	}

	@Override
	public List<Dealer> checkDealerPageNum(int dealerNum, String likeCheck, String disLikeCheck) throws Exception {
		Dealer dealer = new Dealer();
		dealer.setDealer_page_num(dealerNum);
		if(disLikeCheck.equals("checked")) {
			
			return session.selectList(namespace + ".likeCheckDealerPageNum", dealer);
			
		}
		return session.selectList(namespace + ".disLikeCheckDealerPageNum", dealer);
	}

}
