package com.kosta136th.marketPrice;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.stereotype.Controller;

public class TomcatStart implements ServletContextListener{
	
	// variable
	private MarketPriceController marketPriceController;
	
	// constructor
	public TomcatStart() {
		
		marketPriceController = new MarketPriceController();
	 
	}
	
	public void contextInitialized(ServletContextEvent e){
		
//		ServletContext sc = null;
//      sc = e.getServletContext();
		System.out.println("저장하러갑니다.");
        marketPriceController.rateSave();
        
	}

	public void contextDestroyed(ServletContextEvent e){
		
		System.out.println("종료세션");
		
	}
	
}
