package com.kosta136th.freeBoard;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class FreeBoardDAOImpl implements FreeBoardDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace = "com.kosta136th.mapper.freeBoardMapper";
	
	@Override
	public void create(FreeBoard vo) throws Exception {

		session.insert(namespace+".create", vo);	
		
	}

	@Override
	public FreeBoard read(Integer freeboard_Num) throws Exception {
		
		System.out.println("freeBoard_Num DAO : " + freeboard_Num);
		System.out.println(session.selectOne(namespace + ".read", freeboard_Num).toString());
		System.out.println("error here");
		
		return session.selectOne(namespace+".read", freeboard_Num);	
	}

	@Override
	public void update(FreeBoard vo) throws Exception {

		session.update(namespace+".update", vo);	
	}

	@Override
	public void delete(Integer freeBoard_Num) throws Exception {
		
		session.update(namespace+".delete", freeBoard_Num);
		
	}

	@Override
	public List<FreeBoard> listAll() throws Exception {
		return session.selectList(namespace+".listAll");
	}
	
	
}
