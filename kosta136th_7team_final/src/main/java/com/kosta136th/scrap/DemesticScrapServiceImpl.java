package com.kosta136th.scrap;

import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlPullParserFactory;

@Service
public class DemesticScrapServiceImpl implements DemesticScrapService{

	@Inject
	private DemesticScrapDAO dao;
	
	private static String clientID = "lBUvkUjh3n4RKMaC5_FR";
	private static String clientSecret = "Mt4Ub4i38b";
	
	@Override
	public List<DemesticScrap> newsList(String keyword, int display, int start) throws Exception {
		List<DemesticScrap> list = null;
		try {
			URL url;
			url = new URL("https://openapi.naver.com/v1/search/"
					+ "news.xml?query="
					+ URLEncoder.encode(keyword, "UTF-8")
					+ (display !=0 ? "&display=" +display :"")
					+ (start !=0 ? "&start=" +start :""));

			URLConnection urlConn = url.openConnection();
			urlConn.setRequestProperty("X-Naver-Client-Id", clientID);
			urlConn.setRequestProperty("X-Naver-Client-Secret", clientSecret);

			XmlPullParserFactory factory = XmlPullParserFactory.newInstance();
			XmlPullParser parser = factory.newPullParser();
			parser.setInput(
					new InputStreamReader(urlConn.getInputStream()));
			//Test에서 했던 방식은 DOM방식이기때문에? 
			//그래서 이렇게 해도 된다?!??!??!? 



			int eventType = parser.getEventType();
			DemesticScrap b = null;
			while (eventType != XmlPullParser.END_DOCUMENT) {
				switch (eventType) {
				case XmlPullParser.END_DOCUMENT: // 문서의 끝
					break;
				case XmlPullParser.START_DOCUMENT:
					list = new ArrayList<DemesticScrap>();
					break;
				case XmlPullParser.END_TAG: {
					String tag = parser.getName();
					if(tag.equals("item"))
					{
						b.setKeyword(keyword);
						list.add(b);
						b = null;
					}
				}
				case XmlPullParser.START_TAG: {
					String tag = parser.getName();
					switch (tag) {
					case "item":
						b = new DemesticScrap();
						break;
					case "title":
						if(b != null)
							b.setTitle(parser.nextText());
						break;
					case "link":
						if(b != null)
							b.setLink(parser.nextText());
						break;
					case "description":
						if(b != null)
							b.setDescription(parser.nextText());
						break;
					case "pubDate":
						if(b != null)
							b.setPubDate(parser.nextText());
						break;

					}
				}
				}
				eventType = parser.next();
				
			}



		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public void addDemesticScrap(DemesticScrap vo) throws Exception{
		dao.addDemesticScrap(vo);
		
	}



	@Override
	public List<DemesticPopular> popularNews() throws Exception{
		
		return dao.popularNews();
	}

	@Override
	public int getUserNumber(String email) throws Exception {
		return dao.getUserNumber(email);
	}

	@Override
	public String demScrapCheck(DemesticScrap vo) throws Exception {
		
		return dao.demScrapCheck(vo);
	}

	@Override
	public void removeDemesticScrap(DemesticScrap vo) throws Exception {
		dao.removeDemesticScrap(vo);
		return;
		
	}

	@Override
	public List<GETDemesticScrap> demScrapList(String email) throws Exception{
		
		return dao.demScrapList(email);
	}



}
