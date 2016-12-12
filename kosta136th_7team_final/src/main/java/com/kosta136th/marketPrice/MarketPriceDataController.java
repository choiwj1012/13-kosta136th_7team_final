
package com.kosta136th.marketPrice;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.math.BigDecimal;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/rate/*")
public class MarketPriceDataController {
    
    @Inject
    MarketPriceService marketPriceService;
    
    @Scheduled(fixedDelay = 12000000)
    @RequestMapping(value = "/rateSave", method = RequestMethod.GET)
    public void rateSave() {
        
        try {
            
            String apiURL;          
            String command = "";
            
            //apiURL = "https://www.worldcoinindex.com/apiservice/json?key=TSd9QUg1uE9PRE3JSFP88IWvJ";
            apiURL = "https://www.worldcoinindex.com/apiservice/json?key=gAGBbdOH2ulQUdnSrttj7DVyo ";
            
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
            
            try {
            	
                JSONParser jsonParser = new JSONParser();
                JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonInfo);
                JSONArray marketsInfoArray = (JSONArray) jsonObject.get("Markets");
   
                for(int i=0; i<marketsInfoArray.size(); i++){
                	
                    JSONObject marketsObject = (JSONObject) marketsInfoArray.get(i);
                    BigDecimal price_btc = new BigDecimal((Double) marketsObject.get("Price_btc"));
                    BigDecimal price_usd = new BigDecimal((Double) marketsObject.get("Price_usd"));
                    BigDecimal price_cny = new BigDecimal((Double) marketsObject.get("Price_cny"));
                    BigDecimal price_eur = new BigDecimal((Double) marketsObject.get("Price_eur"));
                    BigDecimal price_gbp = new BigDecimal((Double) marketsObject.get("Price_gbp"));
                    BigDecimal price_rur = new BigDecimal((Double) marketsObject.get("Price_rur"));
                    BigDecimal volume_24h = new BigDecimal((Double) marketsObject.get("Volume_24h"));
                    
                    BigDecimal ex = new BigDecimal(1);
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
                    
                    marketPriceService.rateSave(marketPrice);
                }
                
            } catch (ParseException e) {
                e.printStackTrace();
            }
            
        } catch (Exception e) {
            System.out.println(e);
        }
        
    }
    

	//db에서 받아온 데이터 중 원하는 속성만 추려서 JSON 객체화 한다.
	@RequestMapping(value = "/chartData", method = RequestMethod.GET)
	public JSONArray chart(@RequestParam("money_type") String money_type, HttpServletResponse response) throws Exception {
		
		//객체 타입으로 데이터를 날리면 안된다. 배열을 보내야한다.
		//chartMapper.xml로 부터  데이터를 뽑아 온다.
		List<MarketPriceChart> marketPriceList =  marketPriceService.chart(money_type);
		
		//JsonArray 객체 생성
		JSONArray jsonArray = new JSONArray();
		
		String timestamp;
		String perPrice = null;
		
		for(int i = 0 ; i < marketPriceList.size() ; i++){
			
			timestamp = marketPriceList.get(i).getTimestamp();
			
			if(money_type.equals("PRICE_BTC")) {
				
				perPrice = marketPriceList.get(i).getPrice_btc();
				
			} else if(money_type.equals("PRICE_USD")) {
				
				perPrice = marketPriceList.get(i).getPrice_usd();
				
			} else if(money_type.equals("PRICE_CNY")) {
				
				perPrice = marketPriceList.get(i).getPrice_cny();
				
			} else if(money_type.equals("PRICE_EUR")) {
				
				perPrice = marketPriceList.get(i).getPrice_eur();
				
			} else if(money_type.equals("PRICE_GBP")) {
				
				perPrice = marketPriceList.get(i).getPrice_gbp();
				
			} else if(money_type.equals("PRICE_RUR")) {
				
				perPrice = marketPriceList.get(i).getPrice_rur();
				
			}
					
			//bigDecimal로 형변환하기 위해서는 String으로 먼저 형변환해야한다.
			//timestamp는 원래 String 타입이므로 바로 BigDecimal 적용
			//api script에서 ms단위 까지 입력해야 정상 작동한다. 
			//db저장은 s단위 까지 저장했으므로 ms단위로 변형하기 위해 000을 덧붙여준다.
			BigDecimal bigTimestamp = new BigDecimal(timestamp + "000");
			BigDecimal bigPerPrice = new BigDecimal(perPrice); 	
			
			//배열에 삽입한다.	//객체에 담으면 API가 인식하지 못 한다.
			BigDecimal[] bigDecimalArray = {bigTimestamp, bigPerPrice};
			
			//Array 타입을 jsonArray에 추가한다.
			jsonArray.add(bigDecimalArray);
			
		}
		
		return jsonArray;
		
		}
	
	}
    
