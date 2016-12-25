package com.kosta136th.dealerNews;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kosta136th.user.User;

@Repository
public class DealerNewsDAOImpl implements DealerNewsDAO{
	
	@Inject
	private SqlSession sqlSession;
	
	private static String namespace = "com.kosta136th.mapper.dealerNewsMapper";
	
	@Override
	//첫 페이지와 끝 페이지의 정보 로부터 List의 정보를 추출
	public List<DealerNews> getDealerNewsList(int startDealerNewsIndex, int howMuch) {
		
		class paging{
			int startDealerNewsIndex;
			int howMuch;
			
			public paging(int startDealerNewsIndex, int howMuch){
				this.startDealerNewsIndex = startDealerNewsIndex;
				this.howMuch = howMuch;
			}
		}
		
		List<DealerNews> dealerNewsList = sqlSession.selectList(namespace + ".getDealerNewsList", new paging(startDealerNewsIndex, howMuch));
		
		return dealerNewsList;
	}
	
	@Override
	//첫 페이지와 끝 페이지를 설정한다.
	public DealerNews getPageMaker(DealerNews pageMaker) {
		
		int totalPage = (int)Math.ceil((double)getDealerNewsListSize() / pageMaker.getPerPageNum());
		int lastPage = (int)Math.min(pageMaker.getPerPagebarPage() * Math.ceil((double)pageMaker.getCurrentPage()/pageMaker.getPerPagebarPage()),
						totalPage);
		int firstPage = (int)Math.max(1, lastPage - pageMaker.getPerPagebarPage() + 1);
		
		pageMaker.setLastPage(lastPage);
		pageMaker.setFirstPage(firstPage);
		
		//받았을 때
		System.out.println("★★★★★★★★★★★★★★★★★★★★");
		System.out.println("perPagebarPage : " + pageMaker.getPerPagebarPage());
		System.out.println("perPageNum : " + pageMaker.getPerPageNum());
		System.out.println("currentPage : " + pageMaker.getCurrentPage());
		System.out.println("totalPage : " + totalPage);
		System.out.println("firstPage : " + firstPage);
		System.out.println("lastPage : " + lastPage);
		System.out.println("★★★★★★★★★★★★★★★★★★★★");

		return pageMaker;
	}
	
	@Override
	//현재 글번호에 맞추어서 페이지를 재설정 하는 메소드
	public DealerNews getPageMakerByDealerNewsNo(DealerNews pageMaker){
		
		//글번호에 해당하는 인덱스 i를 구한 후
		//새로운 페이지로 갱신한다
		try{				
		int index = sqlSession.selectOne(namespace + ".getDealerNewsIndex", pageMaker);
		int newCurrentPage = (int)Math.floor((double)index / pageMaker.getPerPageNum()) + 1;
		pageMaker.setCurrentPage(newCurrentPage);
		
		System.out.println("getPageMakerByDealerNewsNo");
		System.out.println("★★★★★★★★★★★★★★★★★★★★");
		System.out.println("현재 글번호에 해당하는 인덱스 : " + index);
		System.out.println("현재 글번호로 페이지를 재계산한다");
		System.out.println("perPagebarPage : " + pageMaker.getPerPagebarPage());
		System.out.println("perPageNum : " + pageMaker.getPerPageNum());
		System.out.println("currentPage : " + pageMaker.getCurrentPage());
		System.out.println("★★★★★★★★★★★★★★★★★★★★");
		}catch(Exception e){
			e.printStackTrace();
		}
		return pageMaker;
	}
	
	@Override
	//전체 딜러뉴스의 수를 구하는 메소드
	public int getDealerNewsListSize() {
		
		int DealerNewsListSize = sqlSession.selectOne(namespace + ".getDealerNewsListSize");
		
		return DealerNewsListSize;
	}

	@Override
	public void writeNews(DealerNews dealerNews, HttpSession httpSession) {
		
		User user = new User();
		String email = (String) ( 
				( (Map<String,Object>)( httpSession.getAttribute("login") ) )
				.get("USER_EMAIL")
				); //httpSession의 login에 맵 타입으로 저장되어 있다. email과 가입 유형이. 
		user.setUSER_EMAIL(email);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user", user);
		map.put("news", dealerNews);
		
		System.out.println(map.toString());
		
		sqlSession.insert(namespace + ".writeNews", map);
		
	}
	
	@Override
	public void deleteNews(DealerNews dealerNews) {
		
		sqlSession.update(namespace + ".deleteNews", dealerNews);
		
		int totalPage = (int)Math.ceil((double)getDealerNewsListSize() / dealerNews.getPerPageNum());
		dealerNews.setCurrentPage(Math.min(dealerNews.getCurrentPage(), totalPage));
				
	}

	@Override
	public DealerNews getNews(DealerNews pageMaker) {
		
		DealerNews news = sqlSession.selectOne(namespace + ".getNews", pageMaker);
		
		if (news != null){
			pageMaker.setWriter(news.getWriter());
			pageMaker.setTitle(news.getTitle());
			pageMaker.setContent(news.getContent());
			pageMaker.setRegi_date(news.getRegi_date());
		}else{
			pageMaker = null;
		}
		
		System.out.println("getNews");
		System.out.println("★★★★★★★★★★★★★★★★★★★★");
		System.out.print("내용 읽어오기 : ");
		if (news != null){
			System.out.println(pageMaker.toString());
		}else{
			System.out.println("이제 존재하지 않음.");
		}
		System.out.println("★★★★★★★★★★★★★★★★★★★★");
		
		return pageMaker;
	}
	
	@Override
	public void modifyNews(DealerNews dealerNews) {
		sqlSession.update(namespace + ".modifyNews", dealerNews);
	}

	@Override
	public DealerNews getPreviousNews(DealerNews dealerNews) {
		return sqlSession.selectOne(namespace + ".getPreviousNews", dealerNews);
	}

	@Override
	public DealerNews getNextNews(DealerNews dealerNews) {
		return sqlSession.selectOne(namespace + ".getNextNews", dealerNews);
	}

}
