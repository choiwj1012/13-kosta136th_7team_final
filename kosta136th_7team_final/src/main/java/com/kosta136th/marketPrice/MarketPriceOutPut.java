package com.kosta136th.marketPrice;

import java.math.BigDecimal;

public class MarketPriceOutPut {

	private String label;
	private String name;
	private BigDecimal price;
	private BigDecimal volume_24h;
	
	
	public String getLabel() {
		return label;
	}
	public void setLabel(String label) {
		this.label = label;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public BigDecimal getPrice() {
		return price;
	}
	public void setPrice(BigDecimal price_btc_out) {
		this.price = price_btc_out;
	}
	public BigDecimal getVolume_24h() {
		return volume_24h;
	}
	public void setVolume_24h(BigDecimal volume_24h) {
		this.volume_24h = volume_24h;
	}
	
}
