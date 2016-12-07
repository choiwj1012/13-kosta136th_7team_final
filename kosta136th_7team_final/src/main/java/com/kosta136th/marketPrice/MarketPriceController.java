package com.kosta136th.marketPrice;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.math.BigDecimal;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Locale;

<<<<<<< HEAD
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
=======
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
>>>>>>> refs/remotes/origin/master
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/rate/*")
public class MarketPriceController {

<<<<<<< HEAD
	@RequestMapping(value = "/bitrate", method = RequestMethod.GET)
	public String callWorldCoinIndexDotCom(Model model) {

		try {
			String apiURL;	
			//전달 받은 JSON 문자열을 보관하는 스트링
			String command = "";
			//https://www.worldcoinindex.com/apiservice/json?key=3GJ2UwUK92ikwWvZOZ0xtKXlA
			//https://www.worldcoinindex.com/apiservice/json?key=9s5GeQzzoxzwM1WiHYdXnNDqZ
			apiURL = "https://www.worldcoinindex.com/apiservice/json?key=3GJ2UwUK92ikwWvZOZ0xtKXlA";

			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection)url.openConnection();
			con.setRequestMethod("GET");
			int responseCode = con.getResponseCode();
			BufferedReader br;

			if(responseCode==200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else {  // 에러 발생
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
			try {

				JSONParser jsonParser = new JSONParser();

				//JSON데이터를 넣어 JSON Object 로 만들어 준다.
				JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonInfo);

				//books의 배열을 추출
				JSONArray marketsInfoArray = (JSONArray) jsonObject.get("Markets");


				ArrayList<MarketPrice> marketPriceList = new ArrayList<MarketPrice>();

				for(int i=0; i<marketsInfoArray.size(); i++){

					//배열 안에 있는것도 JSON형식 이기 때문에 JSON Object 로 추출
					JSONObject marketsObject = (JSONObject) marketsInfoArray.get(i);

					//지수를 없애기위해 각각의 변수를 새로 선언
					BigDecimal price_btc = new BigDecimal((Double) marketsObject.get("Price_btc"));
					BigDecimal price_usd = new BigDecimal((Double) marketsObject.get("Price_usd"));
					BigDecimal price_cny = new BigDecimal((Double) marketsObject.get("Price_cny"));
					BigDecimal price_eur = new BigDecimal((Double) marketsObject.get("Price_eur"));
					BigDecimal price_gbp = new BigDecimal((Double) marketsObject.get("Price_gbp"));
					BigDecimal price_rur = new BigDecimal((Double) marketsObject.get("Price_rur"));
					BigDecimal volume_24h = new BigDecimal((Double) marketsObject.get("Volume_24h"));

					//나누기할때의  분모이다.
					BigDecimal ex = new BigDecimal(1);

					//ex)price_rur/ex = ex는 1이기때문에 price_rur 본인의값이 나온다. 그리고 7자리수로 소수점을 제한하고 내림으로 소수를처리한다.
					BigDecimal price_btc_out = price_btc.divide(ex, 6, BigDecimal.ROUND_DOWN);
					BigDecimal price_usd_out = price_usd.divide(ex, 7, BigDecimal.ROUND_DOWN);
					BigDecimal price_cny_out = price_cny.divide(ex, 7, BigDecimal.ROUND_DOWN);
					BigDecimal price_eur_out = price_eur.divide(ex, 7, BigDecimal.ROUND_DOWN);
					BigDecimal price_gbp_out = price_gbp.divide(ex, 7, BigDecimal.ROUND_DOWN);
					BigDecimal price_rur_out = price_rur.divide(ex, 7, BigDecimal.ROUND_DOWN);
					BigDecimal volume_24h_out = volume_24h.divide(ex, 6, BigDecimal.ROUND_DOWN);
					MarketPrice marketPrice = new MarketPrice();

					marketPrice.setLabel((String) marketsObject.get("Label"));
					marketPrice.setName((String) marketsObject.get("Name"));;
					marketPrice.setPrice_btc_result(price_btc_out);
					marketPrice.setPrice_usd_result(price_usd_out);
					marketPrice.setPrice_cny_result(price_cny_out);
					marketPrice.setPrice_eur_result(price_eur_out);
					marketPrice.setPrice_gbp_result(price_gbp_out);
					marketPrice.setPrice_rur_result(price_rur_out);
					marketPrice.setVolume_24h_result(volume_24h_out);
					marketPrice.setTimestamp((Long) marketsObject.get("Timestamp"));;

					marketPriceList.add(marketPrice);


				}

				model.addAttribute("marketPriceList", marketPriceList);
				System.out.println(marketPriceList.size());


			} catch (ParseException e) {

				e.printStackTrace();
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		
	    	ArrayList<Rate> rateList = new ArrayList<Rate>();
	        try {
	            String apiURL;	
	            /*USDKRW - 미국
	            JPYKRW - 일본
	            EURKRW - 유럽
	            CNYKRW - 중국 등
	            RURKRW - 러시아
	            GBPKRW - 영국
	            BTCKRW - 다른 api 
	            */

	            String command = "";
	            String[] names = {"USDKRW", "JPYKRW", "EURKRW", "CNYKRW", "RUBKRW", "GBPKRW", "BTCKRW"};
	            for(int i = 0; i<names.length; i++){
	            apiURL = "http://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20yahoo.finance.xchange%20where%20pair%3D%22"+ names[i] +"%22&format=json&diagnostics=true&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys";
	            
	            URL url = new URL(apiURL);
	            HttpURLConnection con = (HttpURLConnection)url.openConnection();
	            con.setRequestMethod("GET");
	            int responseCode = con.getResponseCode();
	            BufferedReader br;
	           
	            if(responseCode==200) { // 정상 호출
	                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	            } else {  // 에러 발생
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
	                        
	                        System.out.println(rate.getId());
	                        System.out.println(rate.getName());
	                        System.out.println(rate.getRate());
	                        System.out.println(rate.getAsk());
	                        System.out.println(rate.getBid());
	                        
	                        rateList.add(rate);
	            }      
	                        model.addAttribute("rateList", rateList);
	            

	        } catch (Exception e) {
	            System.out.println(e);
	        }
		return "sub/graph";
	}
=======
>>>>>>> refs/remotes/origin/master
}
