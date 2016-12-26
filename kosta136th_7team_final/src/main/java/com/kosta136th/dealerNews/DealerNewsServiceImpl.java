package com.kosta136th.dealerNews;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

@Service
public class DealerNewsServiceImpl implements DealerNewsService{

	@Inject
	private DealerNewsDAO dealerNewsDAO;
	
	@Override
	public List<DealerNews> getDealerNewsList(int startDealerNewsIndex, int howMuch, String dealerName) {
		List<DealerNews> dealerNewsList = dealerNewsDAO.getDealerNewsList(startDealerNewsIndex, howMuch, dealerName);
		return dealerNewsList;
	}

	@Override
	public DealerNews getPageMaker(DealerNews pageMaker, String dealerName) {
		pageMaker = dealerNewsDAO.getPageMaker(pageMaker, dealerName);
		return pageMaker;
	}

	@Override
	public void getPageMakerByDealerNewsNo(DealerNews pageMaker, String dealerName) {
		dealerNewsDAO.getPageMakerByDealerNewsNo(pageMaker, dealerName);
	}

	@Override
	public void writeNews(DealerNews dealerNews, String dealerName) {
		try{
		dealerNewsDAO.writeNews(dealerNews, dealerName);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	@Override
	public void deleteNews(DealerNews dealerNews, String dealerName) {
		dealerNewsDAO.deleteNews(dealerNews, dealerName);
	}

	@Override
	public DealerNews getNews(DealerNews dealerNews, String dealerName) {
		return dealerNewsDAO.getNews(dealerNews, dealerName);
	}
	
	@Override
	public void modifyNews(DealerNews dealerNews, String dealerName) {
		dealerNewsDAO.modifyNews(dealerNews, dealerName);
	}

	@Override
	public DealerNews getPreviousNews(DealerNews dealerNews, String dealerName) {
		return dealerNewsDAO.getPreviousNews(dealerNews, dealerName);
	}

	@Override
	public DealerNews getNextNews(DealerNews dealerNews, String dealerName) {
		return dealerNewsDAO.getNextNews(dealerNews, dealerName);
	}

	@Override
	public int getDealerNewsListSize(String dealerName) {
		return dealerNewsDAO.getDealerNewsListSize(dealerName);
	}
	
}
