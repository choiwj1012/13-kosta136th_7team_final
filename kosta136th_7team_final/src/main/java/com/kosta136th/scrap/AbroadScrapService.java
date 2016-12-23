package com.kosta136th.scrap;

import java.util.List;

public interface AbroadScrapService {

	List<AbroadScrap> serachAllNews() throws Exception;
	List<AbroadScrap> serachNews(int pageNum) throws Exception;
	void addAbroadScrap(AbroadScrap vo) throws Exception;
	List<AbroadPopular> popularNews() throws Exception;
	String abrScrapCheck(AbroadScrap vo) throws Exception;
	void removeAbroadScrap(AbroadScrap vo) throws Exception;
	List<GETAbroadScrap> abrScrapList(String email) throws Exception;

}
