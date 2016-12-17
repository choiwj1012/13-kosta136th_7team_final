package com.kosta136th.freeBoard;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.kosta136th.freeBoard.Criteria;
import com.kosta136th.freeBoard.FreeBoardReply;


@Repository
public class FreeBoardReplyDAOImpl implements FreeBoardReplyDAO {
	
	@Inject private SqlSession session;
	
	private static String namespace = "com.kosta136th.freeBoardReplyMapper";

	@Override
	public List<FreeBoardReply> list(Integer freeBoard_Num) throws Exception {

		return session.selectList(namespace + ".list", freeBoard_Num);
	}

	@Override
	public void create(FreeBoardReply vo) throws Exception {

		session.insert(namespace + ".create", vo);

	}

//	@Override
//	public void update(FreeBoardReply vo) throws Exception {
//		// TODO Auto-generated method stub
//
//	}
//
//	@Override
//	public void delete(Integer reply_Num) throws Exception {
//		// TODO Auto-generated method stub
//
//	}

	@Override
	public List<FreeBoardReply> listPage(Integer freeBoard_Num, Criteria cri) throws Exception {
		Map<String, Object> paramMap = new HashMap<>();

		paramMap.put("freeBoard_Num", freeBoard_Num);
		paramMap.put("cri", cri);

		return session.selectList(namespace + ".listPage", paramMap);
	}

	@Override
	public int count(Integer freeBoard_Num) throws Exception {
		
		return session.selectOne(namespace + ".count", freeBoard_Num);
	}

	@Override
	public int getFreeBoard_Num(Integer reply_Num) throws Exception {
		
		return session.selectOne(namespace + ".getFreeBoard_Num", reply_Num);
		
	}

}
