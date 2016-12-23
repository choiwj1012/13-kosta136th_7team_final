package com.kosta136th.scrap;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Service;

@Service
public class AbroadScrapServiceImpl implements AbroadScrapService{

	@Inject
	private AbroadScrapDAO dao;
	  
	@Override
	public List<AbroadScrap> serachAllNews() throws Exception {
		List<AbroadScrap> list = new ArrayList<AbroadScrap>();

		for(int h = 0; h < 10; h++)
		{
			if(h == 0)
			{
				Document doc = Jsoup.connect("https://news.bitcoin.com/")
						.userAgent("Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.152 Safari/537.36").ignoreHttpErrors(true).timeout(5000)
						.get();

				//기사주소 크롤링
				Elements link= doc.select(".item-details");
				Elements link2 = link.select("h3 > a");
				Elements link3 = link2.select("a[href]");
				

				//기사기자 크롤링
				Elements author= doc.select(".item-details .meta-info .td-post-author-name");
				Elements author2 = author.select("a[href]");
				

				//제목 크롤링
				Elements title= doc.select(".item-details");
				Elements title2 = title.select("h3 > a");
				Elements title3 = title2.select("a[title]");
				

				//기사 날짜 크롤링
				Elements date= doc.select(".item-details .meta-info .td-post-date");
				Elements date2 = date.select("time");
			

				//기사 요약 크롤링
				Elements article= doc.select(".item-details");
				Elements article2 = article.select("p");
				

				//이미지 주소 크롤링
				Elements imgSrc = doc.select(".item-details .td-module-thumb");
				Elements imgSrc2 = imgSrc.select("img");
				for(int i = 0; i < 10; i++)
				{
					AbroadScrap abs = new AbroadScrap();
					if(author2.get(i).text().length() == 0)
					{
						abs.setAuthor("null");
					}
					else
					{
						abs.setAuthor(author2.get(i).text());
					}
					
					if(date2.get(i).text().length() == 0)
					{
						abs.setDate("null");
					}
					else
					{
						abs.setDate(date2.get(i).text());
					}
					
					if(article2.get(i).text().length() == 0)
					{
						abs.setDescription("null");
					}
					else
					{
						abs.setDescription(article2.get(i).text());
					}
					if(imgSrc2.get(i).attr("abs:src").length() == 0)
					{
						abs.setImgSrc("null");
					}
					else
					{
						abs.setImgSrc(imgSrc2.get(i).attr("abs:src"));
					}
					
					if(link3.get(i).attr("abs:href").length() == 0)
					{
						abs.setLink("null");
					}
					else
					{
						abs.setLink(link3.get(i).attr("abs:href"));
					}
					
					if(title3.get(i).attr("abs:title").length() == 0)
					{
						abs.setTitle("null");
					}
					else
					{
						abs.setTitle(title3.get(i).attr("abs:title").substring(25));
					}
					
					list.add(abs);
					
					
					
					
//					System.out.println(link3.get(i).attr("abs:href"));
//					System.out.println(author2.get(i).text());
//					if(title3.get(i).attr("abs:title").length() != 0)
//					{
//						System.out.println(title3.get(i).attr("abs:title").substring(25));
//					}
//					System.out.println(date2.get(i).text());
//					System.out.println(article2.get(i).text());
//					System.out.println(imgSrc2.get(i).attr("abs:src"));
				}
				
				
			}
			else
			{
				int pageNum = h + 1;
				Document doc = Jsoup.connect("https://news.bitcoin.com/page/"+pageNum+"/")
						.userAgent("Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.152 Safari/537.36").ignoreHttpErrors(true).timeout(5000)
						.get();

				//기사주소 크롤링
				Elements link= doc.select(".item-details");
				Elements link2 = link.select("h3 > a");
				Elements link3 = link2.select("a[href]");
				

				//기사기자 크롤링
				Elements author= doc.select(".item-details .meta-info .td-post-author-name");
				Elements author2 = author.select("a[href]");

				//제목 크롤링
				Elements title= doc.select(".item-details");
				Elements title2 = title.select("h3 > a");
				Elements title3 = title2.select("a[title]");
				

				//기사 날짜 크롤링
				Elements date= doc.select(".item-details .meta-info .td-post-date");
				Elements date2 = date.select("time");
				

				//기사 요약 크롤링
				Elements article= doc.select(".item-details");
				Elements article2 = article.select("p");
				

				//이미지 주소 크롤링
				Elements imgSrc = doc.select(".item-details .td-module-thumb");
				Elements imgSrc2 = imgSrc.select("img");
				
				for(int i = 0; i < 10; i++)
				{
					AbroadScrap abs = new AbroadScrap();
					if(author2.get(i).text().length() == 0)
					{
						abs.setAuthor("null");
					}
					else
					{
						abs.setAuthor(author2.get(i).text());
					}
					
					if(date2.get(i).text().length() == 0)
					{
						abs.setDate("null");
					}
					else
					{
						abs.setDate(date2.get(i).text());
					}
					
					if(article2.get(i).text().length() == 0)
					{
						abs.setDescription("null");
					}
					else
					{
						abs.setDescription(article2.get(i).text());
					}
					if(imgSrc2.get(i).attr("abs:src").length() == 0)
					{
						abs.setImgSrc("null");
					}
					else
					{
						abs.setImgSrc(imgSrc2.get(i).attr("abs:src"));
					}
					
					if(link3.get(i).attr("abs:href").length() == 0)
					{
						abs.setLink("null");
					}
					else
					{
						abs.setLink(link3.get(i).attr("abs:href"));
					}
					
					if(title3.get(i).attr("abs:title").length() == 0)
					{
						abs.setTitle("null");
					}
					else
					{
						abs.setTitle(title3.get(i).attr("abs:title").substring(32));
					}
					
					list.add(abs);
				}
			}
		}
		return list;
	}
	
	@Override
	public List<AbroadScrap> serachNews(int pageNum) throws Exception {
		List<AbroadScrap> list = new ArrayList<AbroadScrap>();

				Document doc = Jsoup.connect("https://news.bitcoin.com/page/"+pageNum+"/")
						.userAgent("Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.152 Safari/537.36").ignoreHttpErrors(true).timeout(5000)
						.get();

				//기사주소 크롤링
				Elements link= doc.select(".item-details");
				Elements link2 = link.select("h3 > a");
				Elements link3 = link2.select("a[href]");
				

				//기사기자 크롤링
				Elements author= doc.select(".item-details .meta-info .td-post-author-name");
				Elements author2 = author.select("a[href]");
				

				//제목 크롤링
				Elements title= doc.select(".item-details");
				Elements title2 = title.select("h3 > a");
				Elements title3 = title2.select("a[title]");
				

				//기사 날짜 크롤링
				Elements date= doc.select(".item-details .meta-info .td-post-date");
				Elements date2 = date.select("time");
				

				//기사 요약 크롤링
				Elements article= doc.select(".item-details");
				Elements article2 = article.select("p");
				

				//이미지 주소 크롤링
				Elements imgSrc = doc.select(".item-details .td-module-thumb");
				Elements imgSrc2 = imgSrc.select("img");
				
				for(int i = 0; i < 10; i++)
				{
					AbroadScrap abs = new AbroadScrap();
					if(author2.get(i).text().length() == 0)
					{
						abs.setAuthor("null");
					}
					else
					{
						abs.setAuthor(author2.get(i).text());
					}
					
					if(date2.get(i).text().length() == 0)
					{
						abs.setDate("null");
					}
					else
					{
						abs.setDate(date2.get(i).text());
					}
					
					if(article2.get(i).text().length() == 0)
					{
						abs.setDescription("null");
					}
					else
					{
						abs.setDescription(article2.get(i).text());
					}
					if(imgSrc2.get(i).attr("abs:src").length() == 0)
					{
						abs.setImgSrc("null");
					}
					else
					{
						abs.setImgSrc(imgSrc2.get(i).attr("abs:src"));
					}
					
					if(link3.get(i).attr("abs:href").length() == 0)
					{
						abs.setLink("null");
					}
					else
					{
						abs.setLink(link3.get(i).attr("abs:href"));
					}
					
					if(title3.get(i).attr("abs:title").length() == 0)
					{
						abs.setTitle("null");
					}
					else
					{
						abs.setTitle(title3.get(i).attr("abs:title").substring(32));
					}
					
					list.add(abs);
				}
			
		
		return list;
	}

	@Override
	public void addAbroadScrap(AbroadScrap vo) throws Exception{

			dao.addAbroadScrap(vo);
	
	}

	@Override
	public List<AbroadPopular> popularNews() throws Exception {
		return dao.popularNews();
	}

	@Override
	public String abrScrapCheck(AbroadScrap vo) throws Exception {
		
		return dao.abrScrapCheck(vo);
	}

	@Override
	public void removeAbroadScrap(AbroadScrap vo) throws Exception {
		dao.removeAbroadScrap(vo);
		
	}

	@Override
	public List<GETAbroadScrap> abrScrapList(String email) throws Exception {
		
		return dao.abrScrapList(email);
	}
}


