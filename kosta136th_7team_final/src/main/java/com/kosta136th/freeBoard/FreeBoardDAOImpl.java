package com.kosta136th.freeBoard;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class FreeBoardDAOImpl implements FreeBoardDAO {
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "com.kosta136th.mapper.FreeBoardMapper";

	@Override
	public void create(FreeBoard vo) throws Exception {
		session.insert(namespace + ".create", vo);

	}

	@Override
	public FreeBoard read(Integer freeBoard_Num) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<FreeBoard> listAll() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	  public void updateViewCnt(Integer bno) throws Exception {
		  
		  session.update(namespace +".updateViewCnt", bno);
	  }
}
