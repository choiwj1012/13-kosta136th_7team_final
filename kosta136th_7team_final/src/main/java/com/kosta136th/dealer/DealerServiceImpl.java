package com.kosta136th.dealer;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class DealerServiceImpl implements DealerService{

	@Inject
	DealerDAO dao;
	
	@Override
	public List<Dealer> check() throws Exception {
		
		return dao.check();
	}

	@Override
	public void regist(Dealer dealer) throws Exception {
		
		dao.create(dealer);
		
	}

	@Override
	public List<Dealer> list() throws Exception {
		
		return dao.list();
	}

	@Override
	public Dealer read(int dealerNum) throws Exception {
		
		return dao.read(dealerNum);
	}

	@Override
	public void remove(int dealerNum) throws Exception {
		
		dao.remove(dealerNum);
		
	}

	@Override
	public int score(int dealerNum) throws Exception {
		
		return dao.score(dealerNum);
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
	public List<Dealer> allList() throws Exception {

		return dao.allList();
		
	}

	@Override
	public List<Dealer> allListSearch(SearchDealer searchDealer) throws Exception {
		
		return dao.allListSearch(searchDealer);
	}

}
