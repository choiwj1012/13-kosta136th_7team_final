package com.kosta136th.scrap;

import java.util.List;

public interface DemesticScrapDAO {

	List<DemesticPopular> popularNews() throws Exception;

	void addDemesticScrap(DemesticScrap vo) throws Exception;

	int getUserNumber(String email) throws Exception;

}
