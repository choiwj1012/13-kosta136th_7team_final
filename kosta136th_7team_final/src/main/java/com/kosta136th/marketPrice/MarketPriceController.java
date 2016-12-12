package com.kosta136th.marketPrice;

<<<<<<< HEAD
=======
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.math.BigDecimal;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
>>>>>>> 5bf89bec30a4b3ab8ad217cbb72ee025027337d4
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

<<<<<<< HEAD
@Controller
public class MarketPriceController {
	
	// private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/*@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		return "index";
		
	}*/

	@RequestMapping(value = "/marketPrice", method = RequestMethod.GET)
    public String marketPrice(Model model) {
    	
    	//home.jsp VIEW를 호출한다.
        return "sub/marketPrice";	
        
    }
	
}




			/*//값 일방적 콘솔 출력.
			System.out.print(marketPriceList.get(i).getLabel());
			System.out.print("\t");
			System.out.print(marketPriceList.get(i).getPrice_btc());
			System.out.print("\t"); 
			System.out.print(marketPriceList.get(i).getPrice_usd());
			System.out.print("\t");
			System.out.print(marketPriceList.get(i).getPrice_cny());
			System.out.print("\t");
			System.out.print(marketPriceList.get(i).getPrice_eur());
			System.out.print("\t");
			System.out.print(marketPriceList.get(i).getPrice_gbp());
			System.out.print("\t");
			System.out.print(marketPriceList.get(i).getPrice_rur());
			System.out.print("\t");
			System.out.print(marketPriceList.get(i).getVolume_24h());
			System.out.print("\t");
			System.out.print(marketPriceList.get(i).getTime());
			System.out.print(unixTimeStamp);
			System.out.println("");
			//배열의 개수 출력
			sqlSession.selectList(namespace + ".list");*/
			
		

/*

@RequestMapping(value = "/", method = RequestMethod.GET)
public @ResponseBody MarketPrice home(Model model) {
	
	//mapper에서 바로 받아서 뿌려준다.
	//콘솔로 찍어보자.
	//ArrayList<MarketPrice> marketPriceList = new ArrayList<MarketPrice>();
	//MarketPrice marketPrice= new MarketPrice();
	List<MarketPrice> marketPriceList = sqlSession.selectList(namespace + ".list");	//<select id="list"
	
	
	
	
	
	String json; 
	
	json = "?([";
	
	for(int i = 0 ; i < marketPriceList.size() ; i++){
		
		long unixTimeStamp = (marketPriceList.get(i).getTime().getTime()) / 1000;
		
		json = json + "[" + unixTimeStamp + ", " + marketPriceList.get(i).getPrice_usd() + "]" ;
		
		if(i != marketPriceList.size()-1 ){
			
			json = json + ",\n";
			
		}
		
		//값 일방적 콘솔 출력.
		System.out.print(marketPriceList.get(i).getLabel());
		System.out.print("\t");
		System.out.print(marketPriceList.get(i).getPrice_btc());
		System.out.print("\t"); 
		System.out.print(marketPriceList.get(i).getPrice_usd());
		System.out.print("\t");
		System.out.print(marketPriceList.get(i).getPrice_cny());
		System.out.print("\t");
		System.out.print(marketPriceList.get(i).getPrice_eur());
		System.out.print("\t");
		System.out.print(marketPriceList.get(i).getPrice_gbp());
		System.out.print("\t");
		System.out.print(marketPriceList.get(i).getPrice_rur());
		System.out.print("\t");
		System.out.print(marketPriceList.get(i).getVolume_24h());
		System.out.print("\t");
//		System.out.print(marketPriceList.get(i).getTime());
		System.out.print(unixTimeStamp);
		System.out.println("");
		//배열의 개수 출력
		sqlSession.selectList(namespace + ".list");
		
	}
	
	
	json = json + "]);";
	
	System.out.println("json" + json);
	
	System.out.println(sqlSession.selectList(namespace + ".list").size());
	
	
	
	
	//model.addAttribute("list",  sqlSession.selectList(namespace + ".list"));
	model.addAttribute("list",  marketPriceList);
	
	
	 try {
			
			//command
			String command = "";
			String inputLine;
			StringBuffer res = new StringBuffer();
			
		    while ((inputLine = br.readLine()) != null) {
                res.append(inputLine);
            }
        	
//			while ((inputLine = rs.next()) != null) {
//				
//			}
//			//br.close();
//			command = res.toString();
//			model.addAttribute("command", command);
			
			if (rs.next()) {//ResultSet이 레코드를 가짐
				
				//배열을 생성한다.
				marketPriceList = new ArrayList<MarketPrice>();
				
				while(rs.next()) {
					
					MarketPrice marketPrice= new MarketPrice();
					marketPrice.setLabel(rs.getString("label")); 
					marketPrice.setPrice_btc(rs.getDouble("writer"));
					marketPrice.setPrice_usd(rs.getDouble("subject"));
					marketPrice.setPrice_cny(rs.getDouble("content"));
					marketPrice.setPrice_eur(rs.getDouble("passwd"));
					marketPrice.setPrice_gbp(rs.getDouble("reg_date"));
					marketPrice.setPrice_rur(rs.getDouble("readcount"));
					marketPrice.setVolume_24h(rs.getDouble("ref"));
					marketPrice.setTimestamp(rs.getDate("re_step"));

					res.append(rs);
					//List객체에 데이터저장빈인  시세객체를 저장
					marketPriceList.add(marketPrice);
					
				}
				
				System.out.println("rs : " + rs);
				System.out.println("res : " + res);
				System.out.println("command : " + res.toString());
				
				command = res.toString();
				model.addAttribute("command", command);	//jsp(view)단에서 command가 써있는 곳으로 데이터를 보낸다. 일종의 변수 설정
				
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		

	return "home";	//home.jsp
	
}

}
*/
=======

@Controller
@RequestMapping("/rate/*")
public class MarketPriceController {

	@Inject
	MarketPriceService marketPriceservice;
		
	// 비트코인 화폐 환율
	
	@RequestMapping(value = "/bitrate", method = RequestMethod.GET)
	public String callWorldCoinIndexDotCom(Model model) {
//		@ModelAttribute ArrayList<MarketPrice> marketPriceList
//		@RequestParam("val") String val, 
			try {
				
//				System.out.println(val);
				List<MarketPrice> bitCoinList = marketPriceservice.coinRateList();
				
				 ArrayList<MarketPrice> marketPriceList = new ArrayList<MarketPrice>();
				
				for(int i=0; i<bitCoinList.size(); i++){

					BigDecimal price_btc = new BigDecimal(bitCoinList.get(i).getPrice_btc());
					BigDecimal price_usd = new BigDecimal(bitCoinList.get(i).getPrice_usd());
					BigDecimal price_cny = new BigDecimal(bitCoinList.get(i).getPrice_cny());
					BigDecimal price_eur = new BigDecimal(bitCoinList.get(i).getPrice_eur());
					BigDecimal price_gbp = new BigDecimal(bitCoinList.get(i).getPrice_gbp());
					BigDecimal price_rur = new BigDecimal(bitCoinList.get(i).getPrice_rur());
					BigDecimal volume_24h = new BigDecimal(bitCoinList.get(i).getVolume_24h());
					
					BigDecimal ex = new BigDecimal(1);	
					
					BigDecimal price_btc_out = price_btc.divide(ex, 6, BigDecimal.ROUND_DOWN);
					BigDecimal price_usd_out = price_usd.divide(ex, 7, BigDecimal.ROUND_DOWN);
					BigDecimal price_cny_out = price_cny.divide(ex, 7, BigDecimal.ROUND_DOWN);
					BigDecimal price_eur_out = price_eur.divide(ex, 7, BigDecimal.ROUND_DOWN);
					BigDecimal price_gbp_out = price_gbp.divide(ex, 7, BigDecimal.ROUND_DOWN);
					BigDecimal price_rur_out = price_rur.divide(ex, 7, BigDecimal.ROUND_DOWN);
					BigDecimal volume_24h_out = volume_24h.divide(ex, 6, BigDecimal.ROUND_DOWN);

					MarketPrice marketPrice = new MarketPrice();
					marketPrice.setLabel((String) bitCoinList.get(i).getLabel());
					marketPrice.setName((String) bitCoinList.get(i).getName());;
					marketPrice.setPrice_btc_result(price_btc_out);
//					if (val.equals("BTC")) {
//						
//						marketPrice.setPrice_btc_result(price_btc_out);
//						
//					} else if (val.equals("USD")) {
//						
//						marketPrice.setPrice_usd_result(price_usd_out);
//						
//					} else if (val.equals("CNY")) {
//						
//						marketPrice.setPrice_cny_result(price_cny_out);
//						
//					} else if (val.equals("EUR")) {
//						
//						marketPrice.setPrice_eur_result(price_eur_out);
//						
//					} else if(val.equals("GBP")) {
//						
//						marketPrice.setPrice_gbp_result(price_gbp_out);
//						
//					} else if(val.equals("RUR")) {
//						
//						marketPrice.setPrice_rur_result(price_rur_out);
//						
//					} else {
//						
//						System.out.println("입력한 값이 없습니다.");
//						
//					}

					
					marketPrice.setVolume_24h_result(volume_24h_out);
					
					marketPriceList.add(marketPrice);
					
					JSONArray marketsInfoArray = new JSONArray();
					
					marketsInfoArray.add(marketPriceList);
					
				}

				 model.addAttribute("marketPriceList", marketPriceList);
							
		} catch (Exception e) {
			System.out.println(e);
		}
       
			
//			ArrayList<Rate> rateList = new ArrayList<Rate>();
//			
//	        try {
//	        	
//	            String apiURL;	
//	            String command = "";
//	            String[] names = {"USDKRW", "JPYKRW", "EURKRW", "CNYKRW", "RUBKRW", "GBPKRW", "BTCKRW"};
//	            for(int i = 0; i<names.length; i++){
//	            apiURL = "http://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20yahoo.finance.xchange%20where%20pair%3D%22"+ names[i] +"%22&format=json&diagnostics=true&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys";
//	            
//	            URL url = new URL(apiURL);
//	            HttpURLConnection con = (HttpURLConnection)url.openConnection();
//	            con.setRequestMethod("GET");
//	            int responseCode = con.getResponseCode();
//	            BufferedReader br;
//	           
//	            if(responseCode==200) { 
//	                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
//	            } else {  
//	                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
//	            }
//	            
//	            String inputLine;
//	            StringBuffer res = new StringBuffer();
//	            
//	            while ((inputLine = br.readLine()) != null) {
//	                res.append(inputLine);
//	            }
//	            
//	            br.close();
//	            if(responseCode==200) {
//	                command = res.toString();
//	            }
//
//	    			String jsonInfo = command;
//
//	            	JSONObject object = (JSONObject)JSONValue.parse(jsonInfo);
//	            	JSONObject test = (JSONObject) object.get("query");
//
//
//	            	String jsonInfo2 = test.get("results").toString();
//	            	JSONObject object2 = (JSONObject) JSONValue.parse(jsonInfo2);
//
//	            	String jsonInfo3 = object2.get("rate").toString();
//	            	JSONObject object3 = (JSONObject) JSONValue.parse(jsonInfo3);
//	            	
//	                Rate rate = new Rate();
//	                rate.setId(object3.get("id").toString());
//	                rate.setName(object3.get("Name").toString());
//	                rate.setRate(object3.get("Rate").toString());
//	                rate.setAsk(object3.get("Ask").toString());
//	                rate.setBid(object3.get("Bid").toString());
//	            
//	                rateList.add(rate);
//	                
//	            }     
//	            
//	            model.addAttribute("rateList", rateList);
//	            
//	        } catch (Exception e) {
//	            System.out.println(e);
//	        }	
		return "sub/marketPrice";
//			return "redirect:/rateList";
		
	}
	
	
//	 실제 화폐 환율
	@RequestMapping(value = "/rateList", method = RequestMethod.GET)
	public String rateList(Model model){
		
		ArrayList<Rate> rateList = new ArrayList<Rate>();
		
        try {
        	
            String apiURL;	
            String command = "";
            String[] names = {"USDKRW", "JPYKRW", "EURKRW", "CNYKRW", "RUBKRW", "GBPKRW", "BTCKRW"};
            for(int i = 0; i<names.length; i++){
            apiURL = "http://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20yahoo.finance.xchange%20where%20pair%3D%22"+ names[i] +"%22&format=json&diagnostics=true&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys";
            
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            int responseCode = con.getResponseCode();
            BufferedReader br;
           
            if(responseCode==200) { 
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            
            String inputLine;
            StringBuffer res = new StringBuffer();
            
            while ((inputLine = br.readLine()) != null) {
                res.append(inputLine);
            }
            
            br.close();
            if(responseCode==200) {
                command = res.toString();
            }

    			String jsonInfo = command;

            	JSONObject object = (JSONObject)JSONValue.parse(jsonInfo);
            	JSONObject test = (JSONObject) object.get("query");


            	String jsonInfo2 = test.get("results").toString();
            	JSONObject object2 = (JSONObject) JSONValue.parse(jsonInfo2);

            	String jsonInfo3 = object2.get("rate").toString();
            	JSONObject object3 = (JSONObject) JSONValue.parse(jsonInfo3);
            	
                Rate rate = new Rate();
                rate.setId(object3.get("id").toString());
                rate.setName(object3.get("Name").toString());
                rate.setRate(object3.get("Rate").toString());
                rate.setAsk(object3.get("Ask").toString());
                rate.setBid(object3.get("Bid").toString());
            
                rateList.add(rate);
                
            }     
            
            model.addAttribute("rateList", rateList);
            
        } catch (Exception e) {
            System.out.println(e);
        }
        
        return "sub/marketPrice";
		
	}
	
}
>>>>>>> 5bf89bec30a4b3ab8ad217cbb72ee025027337d4
