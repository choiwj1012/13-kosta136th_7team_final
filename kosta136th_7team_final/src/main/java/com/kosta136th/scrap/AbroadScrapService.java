package com.kosta136th.scrap;

import java.io.IOException;
import java.util.List;

public interface AbroadScrapService {

	List<AbroadScrap> serachAllNews() throws IOException;
	List<AbroadScrap> serachNews(int pageNum) throws IOException;

}
