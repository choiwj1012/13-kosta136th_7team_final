package marketPrice;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.DriverManager;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kosta136th.marketPrice.MarketPriceDAO;
import com.kosta136th.marketPrice.MarketPriceSave;
import com.kosta136th.marketPrice.OneChart;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class MariaDBConnectionTest {

	// variable
	private static final String DRIVER = "org.mariadb.jdbc.Driver";
	private static final String URL = "jdbc:mariadb://localhost:3300/bitcoin";
	private static final String USER = "root";
	private static final String PW = "1234";
	
	@Inject
	private MarketPriceDAO marketPriceDao;
	
	@Test
	public void testConnection() throws Exception {
		
		Class.forName(DRIVER);
		
		try(Connection con = DriverManager.getConnection(URL, USER, PW)){
			
			System.out.println(con);
			
		} catch(Exception e) {
			
			e.printStackTrace();
			
		}
		
	}
	
	@Test
	public void rateSaveTest() throws Exception{
		MarketPriceSave marketPriceSave = new MarketPriceSave();
		String label = "GUGU";
		String name = "PSY";
		long timestamp = 141212;
		BigDecimal price_btc_result = new BigDecimal(0.000044);
		BigDecimal price_usd_result = new BigDecimal(0.0013344);
		BigDecimal price_cny_result = new BigDecimal(0.1144);
		BigDecimal price_eur_result = new BigDecimal(0);
		BigDecimal price_gbp_result = new BigDecimal(623.1233);
		BigDecimal price_rur_result = new BigDecimal(1.1123);
		BigDecimal volume_24h_result = new BigDecimal(0);
		marketPriceSave.setLabel(label);
		marketPriceSave.setName(name);
		marketPriceSave.setName(name);
		marketPriceSave.setTimestamp(timestamp);
		marketPriceSave.setPrice_btc_result(price_btc_result);
		marketPriceSave.setPrice_usd_result(price_usd_result);
		marketPriceSave.setPrice_cny_result(price_cny_result);
		marketPriceSave.setPrice_eur_result(price_eur_result);
		marketPriceSave.setPrice_gbp_result(price_gbp_result);
		marketPriceSave.setPrice_rur_result(price_rur_result);
		marketPriceSave.setVolume_24h_result(volume_24h_result);
		marketPriceDao.rateSave(marketPriceSave);
	}
	
	@Test
	public void chartTest() throws Exception
	{
		String money_type = "PRICE_USD";
		marketPriceDao.chart(money_type);
	}
	
	@Test
	public void coinRateListTest() throws Exception
	{
		String sorting_type = "Label";
		String money_type = "PRICE_USD";
		marketPriceDao.coinRateList(sorting_type, money_type);
	}
	
	@Test
	public void oneChartTest() throws Exception
	{
		OneChart oneChart = new OneChart();
		String coinName = "Krypton";
		String money_type = "PRICE_USD";
		oneChart.setCoin_type(coinName);
		oneChart.setMoney_type(money_type);
		
		marketPriceDao.oneChart(oneChart);
	}
	
	
}
