package com.kosta136th.dealer;

public class Dealer {

	private int dealer_page_num;
	private String dealerID;
	private String categoray;
	private String dealerPageTitle;
	
	public Dealer() {

	}

	public Dealer(String dealerID, String categoray, String dealerPageTitle) {
		
		this.dealerID = dealerID;
		this.categoray = categoray;
		this.dealerPageTitle = dealerPageTitle;
	}

	public int getDealer_page_num() {
		return dealer_page_num;
	}

	public void setDealer_page_num(int dealer_page_num) {
		this.dealer_page_num = dealer_page_num;
	}

	public String getDealerID() {
		return dealerID;
	}

	public void setDealerID(String dealerID) {
		this.dealerID = dealerID;
	}

	public String getCategoray() {
		return categoray;
	}

	public void setCategoray(String categoray) {
		this.categoray = categoray;
	}

	public String getDealerPageTitle() {
		return dealerPageTitle;
	}

	public void setDealerPageTitle(String dealerPageTitle) {
		this.dealerPageTitle = dealerPageTitle;
	}
	
}
