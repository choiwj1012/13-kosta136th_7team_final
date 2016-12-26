package scrap;

import java.sql.Connection;
import java.sql.DriverManager;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kosta136th.scrap.AbroadScrap;
import com.kosta136th.scrap.AbroadScrapDAO;
import com.kosta136th.scrap.DemesticScrap;
import com.kosta136th.scrap.DemesticScrapDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class MariaDBConnectionTest {

	
	@Inject
	private AbroadScrapDAO abroadScrapDao;
	
	@Inject
	private DemesticScrapDAO demesticScrapDao;
	
	// variable
	private static final String DRIVER = "org.mariadb.jdbc.Driver";
	private static final String URL = "jdbc:mariadb://localhost:3300/bitcoin";
	private static final String USER = "root";
	private static final String PW = "1234";
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
	public void addAbroadScrapTest() throws Exception{
		AbroadScrap abroadScrap = new AbroadScrap();
		int user_num = 1;
		String email = "pcj902702@naver.com";
		String link = "www.link2.com";
		String author = "author2";
		String title = "title2";
		String date = "date2";
		String description = "description2";
		String imgSrc = "imgSrc2";
		
		abroadScrap.setUser_num(user_num);
		abroadScrap.setEmail(email);
		abroadScrap.setLink(link);
		abroadScrap.setAuthor(author);
		abroadScrap.setTitle(title);
		abroadScrap.setDate(date);
		abroadScrap.setDescription(description);
		abroadScrap.setImgSrc(imgSrc);
		
		abroadScrapDao.addAbroadScrap(abroadScrap);
	}
	
	@Test
	public void popularNewsTest() throws Exception
	{
		abroadScrapDao.popularNews();
	}
	
	@Test
	public void abrScrapCheckTest() throws Exception
	{
		AbroadScrap abroadScrap = new AbroadScrap();
		String email = "email2@email.com";
		String link = "www.link2.com";
		String author = "author2";
		String title = "title2";
		String date = "date2";
		String description = "description2";
		String imgSrc = "imgSrc2";
		
		abroadScrap.setEmail(email);
		abroadScrap.setLink(link);
		abroadScrap.setAuthor(author);
		abroadScrap.setTitle(title);
		abroadScrap.setDate(date);
		abroadScrap.setDescription(description);
		abroadScrap.setImgSrc(imgSrc);
		
		abroadScrapDao.abrScrapCheck(abroadScrap);
	}
	
	@Test
	public void removeAbroadScrapTest() throws Exception
	{
		String email = "email2@email.com";
		String link = "www.link2.com";
		String author = "author2";
		String title = "title2";
		String date = "date2";
		String description = "description2";
		String imgSrc = "imgSrc2";
		AbroadScrap abroadScrap = new AbroadScrap();
		abroadScrap.setEmail(email);
		abroadScrap.setLink(link);
		abroadScrap.setAuthor(author);
		abroadScrap.setTitle(title);
		abroadScrap.setDate(date);
		abroadScrap.setDescription(description);
		abroadScrap.setImgSrc(imgSrc);
		
		abroadScrapDao.removeAbroadScrap(abroadScrap);
		
	}
	
	@Test
	public void abrScrapListTest() throws Exception
	{
		String email = "pcj902702@naver.com";
		
		abroadScrapDao.abrScrapList(email);
	}
	
	@Test
	public void addDemesticScrapTest() throws Exception
	{
		DemesticScrap demesticScrap = new DemesticScrap();

		int user_num = 1;
		String email = "pcj902702@naver.com";
		String title = "title2";
		String link = "www.link2.com";
		String description = "description2";
		String keyword = "keyword";
		String pubDate = "20012-01-01";
		demesticScrap.setPubDate(pubDate);
		demesticScrap.setUser_num(user_num);
		demesticScrap.setEmail(email);
		demesticScrap.setTitle(title);
		demesticScrap.setLink(link);
		demesticScrap.setDescription(description);
		demesticScrap.setKeyword(keyword);
		
		demesticScrapDao.addDemesticScrap(demesticScrap);
	}
	
	@Test
	public void demPopularNewsTest() throws Exception
	{
		demesticScrapDao.popularNews();
	}
	
	@Test
	public void getUserNumberTest() throws Exception
	{
		String email = "pcj902702@naver.com";
		demesticScrapDao.getUserNumber(email);
	}
	
	@Test
	public void demScrapCheckTest() throws Exception
	{
		
		int user_num = 1;
		String email = "pcj902702@naver.com";
		String title = "title2";
		String link = "www.link2.com";
		String description = "description2";
		String keyword = "keyword";
		DemesticScrap demesticScrap = new DemesticScrap();
		demesticScrap.setUser_num(user_num);
		demesticScrap.setEmail(email);
		demesticScrap.setTitle(title);
		demesticScrap.setLink(link);
		demesticScrap.setDescription(description);
		demesticScrap.setKeyword(keyword);
		
		demesticScrapDao.demScrapCheck(demesticScrap);
	}
	
	@Test
	public void removeDemesticScrapTest() throws Exception
	{
		int user_num = 1;
		String email = "pcj902702@naver.com";
		String title = "title2";
		String link = "www.link2.com";
		String description = "description2";
		String keyword = "keyword";
		DemesticScrap demesticScrap = new DemesticScrap();
		demesticScrap.setUser_num(user_num);
		demesticScrap.setEmail(email);
		demesticScrap.setTitle(title);
		demesticScrap.setLink(link);
		demesticScrap.setDescription(description);
		demesticScrap.setKeyword(keyword);
		
		demesticScrapDao.removeDemesticScrap(demesticScrap);
	}
	
	@Test
	public void demScrapListTest() throws Exception
	{
		String email = "pcj902702@naver.com";
		
		demesticScrapDao.demScrapList(email);
	}
	
	
	
	
}
