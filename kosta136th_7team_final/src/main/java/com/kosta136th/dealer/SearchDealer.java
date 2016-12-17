package com.kosta136th.dealer;

public class SearchDealer {

	private String searchType;
	private String keyword;
	
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public SearchDealer(String searchType, String keyword) {
		
		this.searchType = searchType;
		this.keyword = keyword;
	}

}
