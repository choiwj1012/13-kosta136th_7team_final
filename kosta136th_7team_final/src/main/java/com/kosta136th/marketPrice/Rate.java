package com.kosta136th.marketPrice;

import java.util.Date;

public class Rate {
	private String id;
	private String name;
	private String rate;
	private Date date;
	private Date time;
	private String ask;
	private String bid;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRate() {
		return rate;
	}
	public void setRate(String rate) {
		this.rate = rate;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public String getAsk() {
		return ask;
	}
	public void setAsk(String ask) {
		this.ask = ask;
	}
	public String getBid() {
		return bid;
	}
	public void setBid(String bid) {
		this.bid = bid;
	}
	
}
