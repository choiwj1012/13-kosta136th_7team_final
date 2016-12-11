//package com.kosta136th.marketPrice;
//
//import java.io.BufferedReader;
//import java.io.InputStreamReader;
//import java.math.BigDecimal;
//import java.net.HttpURLConnection;
//import java.net.URL;
//import java.util.ArrayList;
//
//import javax.inject.Inject;
//
//import org.json.simple.JSONArray;
//import org.json.simple.JSONObject;
//import org.json.simple.parser.JSONParser;
//import org.json.simple.parser.ParseException;
//import org.springframework.scheduling.annotation.Scheduled;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RestController;
//
//@RestController
//public class MarketPriceDataController {
//	
//	@Inject
//	MarketPriceService marketPriceservice;
//
//	@Scheduled(fixedDelay=3600000)
//	@RequestMapping(value = "/rateSave", method = RequestMethod.GET)
//	public void rateSave() {
//		
//		System.out.println("저장하러왔습니다.");
//		
//		try {
//			
//			String apiURL;	
//			
//			String command = "";
//			
//			apiURL = "https://www.worldcoinindex.com/apiservice/json?key=9s5GeQzzoxzwM1WiHYdXnNDqZ";
//
//			URL url = new URL(apiURL);
//			HttpURLConnection con = (HttpURLConnection)url.openConnection();
//			con.setRequestMethod("GET");
//			int responseCode = con.getResponseCode();
//			BufferedReader br;
//
//			if(responseCode==200) { 
//				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
//			} else {
//				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
//			}
//			String inputLine;
//			StringBuffer res = new StringBuffer();
//			while ((inputLine = br.readLine()) != null) {
//				res.append(inputLine);
//			}
//			br.close();
//			if(responseCode==200) {
//				command = res.toString();
//			}
//			
//			String jsonInfo = command;
//			try {
//
//				JSONParser jsonParser = new JSONParser();
//
//				JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonInfo);
//
//				JSONArray marketsInfoArray = (JSONArray) jsonObject.get("Markets");
//
//				ArrayList<MarketPrice> marketPriceList = new ArrayList<MarketPrice>();
//
//				for(int i=0; i<marketsInfoArray.size(); i++){
//
//					JSONObject marketsObject = (JSONObject) marketsInfoArray.get(i);
//
//					BigDecimal price_btc = new BigDecimal((Double) marketsObject.get("Price_btc"));
//					BigDecimal price_usd = new BigDecimal((Double) marketsObject.get("Price_usd"));
//					BigDecimal price_cny = new BigDecimal((Double) marketsObject.get("Price_cny"));
//					BigDecimal price_eur = new BigDecimal((Double) marketsObject.get("Price_eur"));
//					BigDecimal price_gbp = new BigDecimal((Double) marketsObject.get("Price_gbp"));
//					BigDecimal price_rur = new BigDecimal((Double) marketsObject.get("Price_rur"));
//					BigDecimal volume_24h = new BigDecimal((Double) marketsObject.get("Volume_24h"));
//
//					BigDecimal ex = new BigDecimal(1);
//
//					BigDecimal price_btc_out = price_btc.divide(ex, 6, BigDecimal.ROUND_DOWN);
//					BigDecimal price_usd_out = price_usd.divide(ex, 7, BigDecimal.ROUND_DOWN);
//					BigDecimal price_cny_out = price_cny.divide(ex, 7, BigDecimal.ROUND_DOWN);
//					BigDecimal price_eur_out = price_eur.divide(ex, 7, BigDecimal.ROUND_DOWN);
//					BigDecimal price_gbp_out = price_gbp.divide(ex, 7, BigDecimal.ROUND_DOWN);
//					BigDecimal price_rur_out = price_rur.divide(ex, 7, BigDecimal.ROUND_DOWN);
//					BigDecimal volume_24h_out = volume_24h.divide(ex, 6, BigDecimal.ROUND_DOWN);
//					MarketPrice marketPrice = new MarketPrice();
//
//					marketPrice.setLabel((String) marketsObject.get("Label"));
//					marketPrice.setName((String) marketsObject.get("Name"));;
//					marketPrice.setPrice_btc_result(price_btc_out);
//					marketPrice.setPrice_usd_result(price_usd_out);
//					marketPrice.setPrice_cny_result(price_cny_out);
//					marketPrice.setPrice_eur_result(price_eur_out);
//					marketPrice.setPrice_gbp_result(price_gbp_out);
//					marketPrice.setPrice_rur_result(price_rur_out);
//					marketPrice.setVolume_24h_result(volume_24h_out);
//					marketPrice.setTimestamp((Long) marketsObject.get("Timestamp"));;
//					
//					marketPriceservice.rateSave(marketPrice);
//
//				}
//
//				
//			} catch (ParseException e) {
//
//				e.printStackTrace();
//			}
//			
//		} catch (Exception e) {
//			System.out.println(e);
//		}
//		
//	}	
//	
//}
