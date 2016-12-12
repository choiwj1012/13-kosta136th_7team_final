package com.kosta136th.scrap;

public class SearchInfo {
	private String tabInfo;
	private String searchKeyword;
	
	public String getTabInfo() {
		return tabInfo;
	}
	public void setTabInfo(String tabInfo) {
		this.tabInfo = tabInfo;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	@Override
	public String toString() {
		return "SearchInfo [tabInfo=" + tabInfo + ", searchKeyword=" + searchKeyword + "]";
	}
	
	
	
}
