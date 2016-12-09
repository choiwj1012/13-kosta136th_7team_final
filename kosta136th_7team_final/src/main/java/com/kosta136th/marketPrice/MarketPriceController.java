package com.kosta136th.marketPrice;

import java.math.BigDecimal;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


//View를 처리하는 Controller
//성용 작업중!!
@Controller
public class MarketPriceController {

	
	private MarketPriceController() {}
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "com.kosta136th.mapper.marketPriceMapper";
	
	//db에서 받아온 데이터 중 원하는 속성만 추려서 JSON 객체화 한다.
	/*	@RequestMapping(value = "/chartData")
		public List<MarketPriceChart> home() {
			
			System.out.println("chartData파트입니다.");
			//mapper에서 바로 받아서 뿌려준다.
			//콘솔로 찍어보자.
			
			//객체 타입으로 데이터를 날리면 안된다. 배열을 보내야한다.
			//ArrayList<MarketPrice> marketPriceList = new ArrayList<MarketPrice>();
			//MarketPrice marketPrice= new MarketPrice();
			
			//mapper.xml로 부터  데이터를 뽑아 온다.
			List<MarketPrice> marketPriceList = sqlSession.selectList(namespace + ".list");	//<select id="list"
			
			//JsonArray 객체 생성
			JSONArray jsonArray = new JSONArray();
			
			String timestamp;
			double perPrice;
			
			//System.out.println("marketPriceList.size()" + (marketPriceList.size() - 20));
			
			//for(int i = 0 ; i < marketPriceList.size(); i++){
			for(int i = 0 ; i < (sqlSession.selectList(namespace + ".list").size()) ; i++){
				
//				MarketPriceJson marketPrice = new MarketPriceJson();	
//				marketPrice.setTimestamp(marketPriceList.get(i).getTimestamp());
//				marketPriceList.get(i).getTime().getTime() / 1000
				
				
				
				timestamp = marketPriceList.get(i).getTimestamp();
				perPrice = marketPriceList.get(i).getPrice_usd();
				
				
				
				BigDecimal bigTimestamp = new BigDecimal(timestamp);		//timestamp는 원래 String 타입이므로 바로 BigDecimal을 먹여준다.
				BigDecimal bigPerPrice = new BigDecimal(String.valueOf(perPrice)); 
				
				System.out.println("bigTimestamp [" + i + "] :" +  bigTimestamp);
				
				BigDecimal[] bigDecimalArray = {bigTimestamp, bigPerPrice};
				
				//Array 타입을 jsonArray에 추가한다.
				jsonArray.add(bigDecimalArray);
				//jsonArray.add(perPrice);
				
				
				//MarketPrice marketPriceUSD = new MarketPrice();
				
				//marketPriceUSD.setUnixTimestamp(unixTimestamp);
				//marketPriceUSD.setPrice_usd(marketPriceList.get(i).getPrice_usd());
				//marketPrice.setPerPrice(marketPriceList.get(i).getPrice_usd());
				
				//marketPriceListResult.add(marketPrice);
				
			}
			
			return jsonArray;	//home.jsp
			
		}
		
	}
	
	*/
	
}
