package com.kosta136th.marketPrice;

//chart 출력을 위한 도메인
//DB에서 timestamp와 perPrice 컬럼 데이터를 담는다.
//x축 : timestamp
//y축 : perPrice
public class MarketPriceChart {
	
	//mapper에 쿼리 조건을 보내기 위해 사용
	//db로 부터 받은 데이터를 담기 위해 사용
	private String timestamp;	  //varchar타입으로 저장되어있기 때문에 일단 String으로 받음.
	private String price_btc;	//double타입으로 저장되어있으므로 double로 받음.
	private String price_usd;	//double타입으로 저장되어있으므로 double로 받음.
	private String price_cny;	//double타입으로 저장되어있으므로 double로 받음.
	private String price_eur;	//double타입으로 저장되어있으므로 double로 받음.
	private String price_gbp;	//double타입으로 저장되어있으므로 double로 받음.
	private String price_rur;	//double타입으로 저장되어있으므로 double로 받음.
	
	
	/*public String getMoney_type() {
		return money_type;
	}
	public void setMoney_type(String money_type) {
		this.money_type = money_type;
	}*/
	/*	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}*/
	public String getTimestamp() {
		return timestamp;
	}
	public void setTimestamp(String timestamp) {
		this.timestamp = timestamp;
	}
	public String getPrice_usd() {
		return price_usd;
	}
	public void setPrice_usd(String perPrice) {
		this.price_usd = perPrice;
	}
	public String getPrice_btc() {
		return price_btc;
	}
	public void setPrice_btc(String price_btc) {
		this.price_btc = price_btc;
	}
	public String getPrice_cny() {
		return price_cny;
	}
	public void setPrice_cny(String price_cny) {
		this.price_cny = price_cny;
	}
	public String getPrice_eur() {
		return price_eur;
	}
	public void setPrice_eur(String price_eur) {
		this.price_eur = price_eur;
	}
	public String getPrice_gbp() {
		return price_gbp;
	}
	public void setPrice_gbp(String price_gbp) {
		this.price_gbp = price_gbp;
	}
	public String getPrice_rur() {
		return price_rur;
	}
	public void setPrice_rur(String price_rur) {
		this.price_rur = price_rur;
	}
	
	
	
	
}

/*
public class MarketPriceChart {

	private String timestamp;	//varchar타입으로 저장되어있기 때문에 일단 String으로 받음.
	private double perPrice;	//double타입으로 저장되어있으므로 double로 받음.
	
	public String getTimestamp() {
		return timestamp;
	}
	public void setTimestamp(String timestamp) {
		this.timestamp = timestamp;
	}
	public double getPerPrice() {
		return perPrice;
	}
	public void setPerPrice(double perPrice) {
		this.perPrice = perPrice;
	}
	
}*/