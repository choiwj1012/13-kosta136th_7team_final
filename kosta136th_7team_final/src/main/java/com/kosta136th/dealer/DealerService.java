package com.kosta136th.dealer;

import java.util.List;

public interface DealerService {

	public List<Dealer> check() throws Exception;

	public void regist(Dealer dealer) throws Exception;

	public List<Dealer> list() throws Exception;

	public Dealer read(int dealerNum) throws Exception;

	public void remove(int dealerNum) throws Exception;

	public int score(int dealerNum) throws Exception;

	public void modify(Dealer dealer) throws Exception;

	public void likeEvent(String likeCheck, String disLikeCheck, int dealerNum) throws Exception;

	public List<Dealer> allList() throws Exception;
	
	public List<Dealer> allListSearch(SearchDealer searchDealer) throws Exception;

	public List<Dealer> downList(int bnoToStart) throws Exception;

}
