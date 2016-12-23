package com.kosta136th.dealer;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class DealerServiceImpl implements DealerService{

	@Inject
	DealerDAO dao;
	
	@Override
	public List<Dealer> userTypeCheck() throws Exception {
		
		return dao.userTypeCheck();
	}

	@Override
	public void regist(Dealer dealer) throws Exception {
		
		dao.create(dealer);
		
	}

	@Override
	public List<Dealer> dealerPageDuplicationCheck() throws Exception {
		
		return dao.dealerPageDuplicationCheck();
	}

	@Override
	public Dealer read(int dealer_page_num) throws Exception {
		
		return dao.read(dealer_page_num);
	}

	@Override
	public void remove(int dealer_page_num) throws Exception {
		
		dao.remove(dealer_page_num);
		
	}

	@Override
	public int score(int dealer_page_num) throws Exception {
		
		return dao.score(dealer_page_num);
	}

	@Override
	public void modify(Dealer dealer) throws Exception {
		
		dao.update(dealer);
		
	}

	@Override
	public void likeEvent(String likeCheck, String disLikeCheck, int dealerNum) throws Exception {
		
		dao.likeEvent(likeCheck, disLikeCheck, dealerNum);
		
	}


	@Override
	public List<Dealer> allListSearch(SearchCriteria cri) throws Exception {
		
		return dao.allListSearch(cri);
	}
	
	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		
		return dao.listSearchCount(cri);
	}

	@Override
	public int dealerMypage(String login) throws Exception {
		
		return dao.dealerMyPage(login);
		
	}

}
