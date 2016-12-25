package com.kosta136th.dealer;

import java.util.List;

public interface DealerDAO {

	//딜러, 일반회원 체크
	public List<Dealer> userTypeCheck() throws Exception;

	// 딜러 페이지 저장
	public void create(Dealer dealer) throws Exception;

	// 딜러 페이지 생성시 중복체크 
	public List<Dealer> dealerPageDuplicationCheck() throws Exception;

	//딜러페이지 읽기
	public Dealer read(int dealer_page_num) throws Exception;

	//딜러페이지 삭제
	public void remove(int dealer_page_num) throws Exception;
	
	//딜러페이지 내공점수
	public int score(int dealer_page_num) throws Exception;

	//딜러 페이지 수정
	public void update(Dealer dealer) throws Exception;

	//딜러 추천 / 딜러  신고 이벤트
	public void likeEvent(String likeCheck, String disLikeCheck, int dealerNum, int dealerUserNum) throws Exception;

	// 전체리스트
	public List<Dealer> allListSearch(SearchCriteria cri) throws Exception;

	public int listSearchCount(SearchCriteria cri) throws Exception;

	public int dealerMyPage(String login) throws Exception;

	public int userNum_read(String email) throws Exception;

	public int searchDealerUserNum(int dealerNum) throws Exception;

	public List<Dealer> checkUserNum(int dealerUserNum, String likeCheck, String disLikeCheck) throws Exception;

	public List<Dealer> checkDealerPageNum(int dealerNum, String likeCheck, String disLikeCheck) throws Exception;
	
	
}
