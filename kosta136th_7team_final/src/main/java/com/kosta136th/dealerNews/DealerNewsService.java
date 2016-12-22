package com.kosta136th.dealerNews;

import java.util.List;

import javax.servlet.http.HttpSession;

public interface DealerNewsService {

	List<DealerNews> getDealerNewsList(int startDealerNewsIndex, int howMuch);

	DealerNews getPageMaker(DealerNews dealerNews);

	void getPageMakerByDealerNewsNo(DealerNews pageMaker);

	void writeNews(DealerNews dealerNews, HttpSession httpSession);

	void deleteNews(DealerNews dealerNews);

	DealerNews getNews(DealerNews dealerNews);

	void modifyNews(DealerNews dealerNews);

	DealerNews getPreviousNews(DealerNews dealerNews);

	DealerNews getNextNews(DealerNews dealerNews);

	int getDealerNewsListSize();

}
