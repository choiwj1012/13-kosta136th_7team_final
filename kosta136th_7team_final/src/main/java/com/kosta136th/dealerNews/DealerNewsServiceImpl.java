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
	public List<DealerNews> getDealerNewsList(int startDealerNewsIndex, int howMuch) {
		List<DealerNews> dealerNewsList = dealerNewsDAO.getDealerNewsList(startDealerNewsIndex, howMuch);
		return dealerNewsList;
	}

	@Override
	public DealerNews getPageMaker(DealerNews pageMaker) {
		pageMaker = dealerNewsDAO.getPageMaker(pageMaker);
		return pageMaker;
	}

	@Override
	public void getPageMakerByDealerNewsNo(DealerNews pageMaker) {
		dealerNewsDAO.getPageMakerByDealerNewsNo(pageMaker);
	}

	@Override
	public void writeNews(DealerNews dealerNews, HttpSession httpSession) {
		try{
		dealerNewsDAO.writeNews(dealerNews, httpSession);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	@Override
	public void deleteNews(DealerNews dealerNews) {
		dealerNewsDAO.deleteNews(dealerNews);
	}

	@Override
	public DealerNews getNews(DealerNews dealerNews) {
		return dealerNewsDAO.getNews(dealerNews);
	}
	
	@Override
	public void modifyNews(DealerNews dealerNews) {
		dealerNewsDAO.modifyNews(dealerNews);
	}

	@Override
	public DealerNews getPreviousNews(DealerNews dealerNews) {
		return dealerNewsDAO.getPreviousNews(dealerNews);
	}

	@Override
	public DealerNews getNextNews(DealerNews dealerNews) {
		return dealerNewsDAO.getNextNews(dealerNews);
	}

	@Override
	public int getDealerNewsListSize() {
		return dealerNewsDAO.getDealerNewsListSize();
	}
	
}
