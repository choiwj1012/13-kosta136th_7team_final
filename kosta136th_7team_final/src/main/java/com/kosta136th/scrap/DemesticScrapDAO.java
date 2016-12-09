package com.kosta136th.scrap;

import java.util.List;

public interface DemesticScrapDAO {

	void addDemesticScrap(DemesticScrap vo) throws Exception;

	List<DemesticScrap> searchNews(String searchKeyword);

}
