package com.kosta136th.scrap;

import java.util.List;

public interface DemesticScrapService {
	
	public List<DomesticScrap> searchNews(String keyword, int display, int start) throws Exception;

}
