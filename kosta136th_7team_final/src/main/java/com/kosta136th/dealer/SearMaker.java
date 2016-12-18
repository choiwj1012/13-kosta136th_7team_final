package com.kosta136th.dealer;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class SearMaker {

	private SearchDealer sd;
	
	public String makeQuery(int page) {
		
		UriComponents uriComponents = UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.build();
		
		return uriComponents.toUriString();
	}
	
	public String makeSearch(int page) {
		
		UriComponents uriComponents = UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.queryParam("searchType", ((SearchDealer)sd).getSearchType())
				.queryParam("keyword", ((SearchDealer)sd).getKeyword())
				.build();
		
		return uriComponents.toUriString();
	}
	
}
