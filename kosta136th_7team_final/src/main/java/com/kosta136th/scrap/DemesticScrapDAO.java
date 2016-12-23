package com.kosta136th.scrap;

import java.util.List;

public interface DemesticScrapDAO {

	List<DemesticPopular> popularNews() throws Exception;

	void addDemesticScrap(DemesticScrap vo) throws Exception;

	int getUserNumber(String email) throws Exception;

	String demScrapCheck(DemesticScrap vo) throws Exception;

	void removeDemesticScrap(DemesticScrap vo) throws Exception;

	List<GETDemesticScrap> demScrapList(String email) throws Exception;

}
