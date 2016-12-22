
package com.kosta136th.marketPrice;


import org.springframework.web.bind.annotation.RequestMapping;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.math.BigDecimal;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/rate/*")
public class MarketPriceDataController {
    
    @Inject
    private MarketPriceService marketPriceService;
    

//    @Scheduled(fixedDelay = 5400000)
//    @RequestMapping(value = "/rateSave", method = RequestMethod.GET)
//    public void rateSave() {
//        
//        try {
//            
//            String apiURL = "";          
//            String command = "";
//            
//            //apiURL = "https://www.worldcoinindex.com/apiservice/json?key=TSd9QUg1uE9PRE3JSFP88IWvJ";
//            apiURL = "https://www.worldcoinindex.com/apiservice/json?key=3GJ2UwUK92ikwWvZOZ0xtKXlA";
//            
//            URL url = new URL(apiURL);
//            HttpURLConnection con = (HttpURLConnection)url.openConnection();
//            con.setRequestMethod("GET");
//            int responseCode = con.getResponseCode();
//            
//            BufferedReader br;
//            if(responseCode==200) { 
//                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
//            } else {
//                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
//            }
//            
//            String inputLine;
//            StringBuffer res = new StringBuffer();
//            
//            while ((inputLine = br.readLine()) != null) {
//                res.append(inputLine);
//            }
//            
//            br.close();
//            
//            if(responseCode==200) {
//                command = res.toString();
//            }
//            
//            String jsonInfo = command;
//            
//            try {
//            	
//                JSONParser jsonParser = new JSONParser();
//                JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonInfo);
//                JSONArray marketsInfoArray = (JSONArray) jsonObject.get("Markets");
//   
//                for(int i=0; i<marketsInfoArray.size(); i++){
//                	
//                    JSONObject marketsObject = (JSONObject) marketsInfoArray.get(i);
//                    BigDecimal price_btc = new BigDecimal((Double) marketsObject.get("Price_btc"));
//                    BigDecimal price_usd = new BigDecimal((Double) marketsObject.get("Price_usd"));
//                    BigDecimal price_cny = new BigDecimal((Double) marketsObject.get("Price_cny"));
//                    BigDecimal price_eur = new BigDecimal((Double) marketsObject.get("Price_eur"));
//                    BigDecimal price_gbp = new BigDecimal((Double) marketsObject.get("Price_gbp"));
//                    BigDecimal price_rur = new BigDecimal((Double) marketsObject.get("Price_rur"));
//                    BigDecimal volume_24h = new BigDecimal((Double) marketsObject.get("Volume_24h"));
//                    
//                    BigDecimal ex = new BigDecimal(1);
//                    BigDecimal price_btc_out = price_btc.divide(ex, 6, BigDecimal.ROUND_DOWN);
//                    BigDecimal price_usd_out = price_usd.divide(ex, 7, BigDecimal.ROUND_DOWN);
//                    BigDecimal price_cny_out = price_cny.divide(ex, 7, BigDecimal.ROUND_DOWN);
//                    BigDecimal price_eur_out = price_eur.divide(ex, 7, BigDecimal.ROUND_DOWN);
//                    BigDecimal price_gbp_out = price_gbp.divide(ex, 7, BigDecimal.ROUND_DOWN);
//                    BigDecimal price_rur_out = price_rur.divide(ex, 7, BigDecimal.ROUND_DOWN);
//                    BigDecimal volume_24h_out = volume_24h.divide(ex, 6, BigDecimal.ROUND_DOWN);
//                    
//                    MarketPriceSave marketPrice = new MarketPriceSave();
//                    
//                    marketPrice.setLabel((String) marketsObject.get("Label"));
//                    marketPrice.setName((String) marketsObject.get("Name"));
//                    marketPrice.setPrice_btc_result(price_btc_out);
//                    marketPrice.setPrice_usd_result(price_usd_out);
//                    marketPrice.setPrice_cny_result(price_cny_out);
//                    marketPrice.setPrice_eur_result(price_eur_out);
//                    marketPrice.setPrice_gbp_result(price_gbp_out);
//                    marketPrice.setPrice_rur_result(price_rur_out);
//                    marketPrice.setVolume_24h_result(volume_24h_out);
//                    marketPrice.setTimestamp((Long) marketsObject.get("Timestamp"));
//                    
//                    marketPriceService.rateSave(marketPrice);
//                }
//                
//            } catch (ParseException e) {
//                e.printStackTrace();
//            }
//            
//        } catch (Exception e) {
//            System.out.println(e);
//        }
//        
//    }
    

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
	
	// 비트코인 화폐 환율
	@RequestMapping(value = "/bitrate", method = RequestMethod.GET)
	public ArrayList<MarketPriceOutPut> bitCoinRate(@RequestParam("money_type") String money_type, @RequestParam("sorting_type") String sorting_type, HttpServletResponse response) throws Exception {

		List<MarketPrice> bitCoinList = marketPriceService.coinRateList(sorting_type, money_type);

		ArrayList<MarketPriceOutPut> marketPriceList = new ArrayList<MarketPriceOutPut>();
		
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

			MarketPriceOutPut marketPrice = new MarketPriceOutPut();
			
			// 라벨의 "/BTC"를 제거하는 코드 
			String beforeLabel = bitCoinList.get(i).getLabel();
			String removeString = "/BTC";
			int removeStringNum = beforeLabel.indexOf(removeString);
			String afterLabel = beforeLabel.substring(0, (beforeLabel.substring(removeStringNum).indexOf("/")+removeStringNum));

			marketPrice.setLabel(afterLabel);
			marketPrice.setName(bitCoinList.get(i).getName());;
			
			if (money_type.equals("PRICE_BTC")) {
						
				marketPrice.setPrice(price_btc_out);
						
			} else if (money_type.equals("PRICE_USD")) {
						
				marketPrice.setPrice(price_usd_out);
						
			} else if (money_type.equals("PRICE_CNY")) {
						
				marketPrice.setPrice(price_cny_out);
						
			} else if (money_type.equals("PRICE_EUR")) {
						
				marketPrice.setPrice(price_eur_out);
						
			} else if(money_type.equals("PRICE_GBP")) {
						
				marketPrice.setPrice(price_gbp_out);
						
			} else if(money_type.equals("PRICE_RUR")) {
						
				marketPrice.setPrice(price_rur_out);
						
			} else {
						
				System.out.println("입력한 값이 없습니다.");
						
			}
			
			marketPrice.setVolume_24h(volume_24h_out);
			
			marketPriceList.add(marketPrice);

			}
			
			return marketPriceList;

}

	
//	 실제 화폐 환율
	@RequestMapping(value = "/rateList", method = RequestMethod.GET)
	public ArrayList<Rate> rateList(HttpServletResponse response) throws Exception{
		
		ArrayList<Rate> rateList = new ArrayList<Rate>();

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

        return rateList;
		
	}
	
	@RequestMapping(value = "oneChart", method = RequestMethod.GET)
	public JSONArray selectChart(@RequestParam("coin_type") String coin_type, @RequestParam("money_type") String money_type, HttpServletResponse response) throws Exception{
		
		OneChart oneChart = new OneChart();
		oneChart.setCoin_type(coin_type);
		oneChart.setMoney_type(money_type);
		
		List<MarketPrice> selectOneChart =  marketPriceService.oneChart(oneChart);
		JSONArray ChartArray = new JSONArray();

		String timestamp;
		String perPrice = null;
		
		
		for(int i = 0 ; i < selectOneChart.size() ; i++){
			
			MarketPrice marketPrice = new MarketPrice();
			timestamp = selectOneChart.get(i).getTimestamp();
			
			if(money_type.equals("PRICE_BTC")) {

				marketPrice.setPrice_btc(selectOneChart.get(i).getPrice_btc());
				perPrice = marketPrice.getPrice_btc();
				
			} else if(money_type.equals("PRICE_USD")) {
				
				marketPrice.setPrice_usd(selectOneChart.get(i).getPrice_usd());
				perPrice = marketPrice.getPrice_usd();
				
			} else if(money_type.equals("PRICE_CNY")) {
				
				marketPrice.setPrice_cny(selectOneChart.get(i).getPrice_cny());
				perPrice = marketPrice.getPrice_cny();
				
			} else if(money_type.equals("PRICE_EUR")) {

				marketPrice.setPrice_eur(selectOneChart.get(i).getPrice_eur());
				perPrice = marketPrice.getPrice_eur();
				
			} else if(money_type.equals("PRICE_GBP")) {

				marketPrice.setPrice_gbp(selectOneChart.get(i).getPrice_gbp());
				perPrice = marketPrice.getPrice_gbp();

			} else if(money_type.equals("PRICE_RUR")) {

				marketPrice.setPrice_rur(selectOneChart.get(i).getPrice_rur());
				perPrice = marketPrice.getPrice_rur();
				
			}
			
			BigDecimal bigTimestamp = new BigDecimal(timestamp + "000");
			BigDecimal bigPerPrice = new BigDecimal(perPrice); 	

			BigDecimal[] bigDecimalArray = {bigTimestamp, bigPerPrice};

			ChartArray.add(bigDecimalArray);
			
		}
		
		return ChartArray;
		
	}
	
}



