package com.kosta136th.marketPrice;

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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MarketPriceController {

	// 시세 뷰 경로
	@RequestMapping(value = "/marketPrice", method = RequestMethod.GET)
    public String marketPrice(Model model) {
    	
    	//home.jsp VIEW를 호출한다.
        return "sub/marketPrice/marketPrice";	
        
    }
	
	
	@Inject
	MarketPriceService marketPriceservice;
		
	
	// 비트코인 화폐 환율
	@RequestMapping(value = "/bitrate", method = RequestMethod.GET)
	public String callWorldCoinIndexDotCom(@RequestParam("val") String val, Model model) {
			
	try {
		
		System.out.println(val);
		
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
			
			if (val.equals("BTC")) {
				
				marketPrice.setPrice_btc_result(price_btc_out);
				
			} else if (val.equals("USD")) {
				
				marketPrice.setPrice_usd_result(price_usd_out);
				
			} else if (val.equals("CNY")) {
				
				marketPrice.setPrice_cny_result(price_cny_out);
				
			} else if (val.equals("EUR")) {
				
				marketPrice.setPrice_eur_result(price_eur_out);
				
			} else if(val.equals("GBP")) {
				
				marketPrice.setPrice_gbp_result(price_gbp_out);
				
			} else if(val.equals("RUR")) {
				
				marketPrice.setPrice_rur_result(price_rur_out);
				
			} else {
				
				System.out.println("입력한 값이 없습니다.");
				
			}

			
			marketPrice.setVolume_24h_result(volume_24h_out);
			
			marketPriceList.add(marketPrice);
			
			JSONArray marketsInfoArray = new JSONArray();
			
			marketsInfoArray.add(marketPriceList);
			
		}

		 model.addAttribute("marketPriceList", marketPriceList);
							
	} catch (Exception e) {
			
		System.out.println(e);
			
	}
       			
	ArrayList<Rate> rateList = new ArrayList<Rate>();
		
    try {
    	
        String apiURL = null;	
        String command = "";
        String[] names = {"USDKRW", "JPYKRW", "EURKRW", "CNYKRW", "RUBKRW", "GBPKRW", "BTCKRW"};
        
        for(int i = 0; i<names.length; i++){
        
        	apiURL = "http://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20yahoo.finance.xchange%20where%20pair%3D%22"+ names[i] +"%22&format=json&diagnostics=true&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys";
        
        	URL url = new URL(apiURL);
        	HttpURLConnection con = (HttpURLConnection)url.openConnection();
        	con.setRequestMethod("GET");
        
        	int responseCode = con.getResponseCode();
        	
        	BufferedReader br = null;
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
	        
	        if(responseCode == 200) {
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

	
/*//	 실제 화폐 환율
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
*/