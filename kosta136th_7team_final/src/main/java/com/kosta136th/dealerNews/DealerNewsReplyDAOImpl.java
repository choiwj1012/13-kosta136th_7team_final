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
public class DealerNewsReplyDAOImpl implements DealerNewsReplyDAO{
	
	private static String namespace = "com.kosta136th.mapper.dealerNewsMapper";

	@Inject
	private SqlSession sqlSession;
	
	public DealerNewsReplyDAOImpl(){
	}

	@Override
	public List<DealerNewsReply> getDealerNewsReplyList(DealerNews dealerNews) {
		return sqlSession.selectList(namespace + ".getDealerNewsReplyList", dealerNews);
	}

	@Override
	public void writeReply(DealerNewsReply dealerNewsReply, HttpSession httpSession) {
		System.out.println("DAO에 도착했다.");
		System.out.println("가져온 등록 댓글의 정보 : ");
		System.out.println(dealerNewsReply.toString());
		
		if (dealerNewsReply.getReply_num() != 0){
			
			DealerNewsReply parent = sqlSession.selectOne(namespace + ".getReplyWhom", dealerNewsReply);

			System.out.println("부모 댓글 번호의 정보로부터 부모 댓글의 정보를 가져온다 : ");
			System.out.println(parent.toString());
			
			System.out.println("분기 rank를 구한다");
			int newRank = sqlSession.selectOne(namespace + ".getReplyRank", parent); 
			sqlSession.update(namespace + ".getReplyRankUpdate", parent); 
			System.out.println(newRank);
			
			int newIndent = parent.getIndent() + 1;
			dealerNewsReply.setRank(newRank);
			dealerNewsReply.setIndent(newIndent);
			dealerNewsReply.setParent_reply_num(parent.getParent_reply_num());
		}
		
		User user = new User();
		String email = (String) ( 
				( (Map<String,Object>)( httpSession.getAttribute("login") ) )
				.get("USER_EMAIL")
				); //httpSession의 login에 맵 타입으로 저장되어 있다. email과 가입 유형이. 
		user.setUSER_EMAIL(email);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user", user);
		map.put("reply", dealerNewsReply);
		
		System.out.print("댓글의 정보 : ");
		System.out.println(dealerNewsReply.toString());
		sqlSession.insert(namespace + ".writeReply", map);
		
		if (dealerNewsReply.getReply_num() == 0){
			sqlSession.update(namespace + ".updateParentReplyNums");
		}
		
	}

	@Override
	public void deleteReply(DealerNewsReply dealerNewsReply) {
		System.out.println("리플 정보 : " + dealerNewsReply.toString());

		sqlSession.update(namespace + ".deleteReply", dealerNewsReply);
	}
	
	
}
