package com.kosta136th.marketPrice;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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