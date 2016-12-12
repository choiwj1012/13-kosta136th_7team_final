package com.kosta136th.scrap;

import java.util.List;

public interface AbroadScrapDAO {

	public void addAbroadScrap(AbroadScrap vo) throws Exception;

	public List<AbroadPopular> popularNews() throws Exception;

}
