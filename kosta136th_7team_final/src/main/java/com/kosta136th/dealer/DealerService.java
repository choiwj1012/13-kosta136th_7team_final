package com.kosta136th.dealer;

import java.util.List;

public interface DealerService {
	
	public void regist(Dealer dealer) throws Exception;
	
	public Dealer read(int dealer_page_num) throws Exception;
	
	public void modify(Dealer dealer) throws Exception;
	
	public void remove(int dealer_page_num) throws Exception;

	public List<Dealer> userTypeCheck() throws Exception;

	public List<Dealer> dealerPageDuplicationCheck() throws Exception;

	public int score(int dealer_page_num) throws Exception;

	public void likeEvent(String likeCheck, String disLikeCheck, int dealerNum, int dealerUserNum) throws Exception;
	
	public List<Dealer> allListSearch(SearchCriteria cri) throws Exception;
	
	public int listSearchCount(SearchCriteria cri) throws Exception;

	public int dealerMypage(String login) throws Exception;

	public int userNum_read(String email) throws Exception;

	public int searchDealerUserNum(int dealerNum) throws Exception;

	public List<Dealer> checkUserNum(int dealerUserNum, String likeCheck, String disLikeCheck) throws Exception;

	public List<Dealer> checkDealerPageNum(int dealerNum, String likeCheck, String disLikeCheck) throws Exception;
	

}
