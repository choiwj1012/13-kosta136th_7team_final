package com.kosta136th.dealerNews;

import java.util.List;

import javax.servlet.http.HttpSession;

public interface DealerNewsDAO {

	List<DealerNews> getDealerNewsList(int startDealerNewsIndex, int howMuch);

	int getDealerNewsListSize();

	DealerNews getPageMaker(DealerNews dealerNews);

	DealerNews getPageMakerByDealerNewsNo(DealerNews pageMaker);

	void writeNews(DealerNews dealerNews, HttpSession httpSession);

	void deleteNews(DealerNews dealerNews);

	DealerNews getNews(DealerNews dealerNews);

	void modifyNews(DealerNews dealerNews);

	DealerNews getPreviousNews(DealerNews dealerNews);

	DealerNews getNextNews(DealerNews dealerNews);

}
