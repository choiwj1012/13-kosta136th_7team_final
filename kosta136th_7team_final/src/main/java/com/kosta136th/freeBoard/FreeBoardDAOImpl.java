package com.kosta136th.freeBoard;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.kosta136th.freeBoard.FreeBoard;
import com.kosta136th.freeBoard.Criteria;
import com.kosta136th.freeBoard.SearchCriteria;

@Repository
public class FreeBoardDAOImpl implements FreeBoardDAO {
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "com.kosta136th.mapper.freeBoardMapper";

	@Override
	public void create(FreeBoard vo) throws Exception {
		System.out.println("여기까지오니1");
		session.insert("com.kosta136th.mapper.freeBoardMapper.create", vo);
		System.out.println("여기까지오니2");
	}

	@Override
	public FreeBoard read(Integer freeBoard_Num) throws Exception {
		
		return session.selectOne(namespace +".read ", freeBoard_Num);
	}

	
	@Override
	  public void updateViewCnt(Integer freeBoard_Num) throws Exception {
		  
		  session.update(namespace +".updateViewCnt", freeBoard_Num);
	  }
	
	@Override
	  public List<FreeBoard> listAll() throws Exception {
		
		System.out.println("listALl dao");
	    try {
	    	session.selectList(namespace + ".listAll");
	    }catch(Exception e) {
	    	e.printStackTrace();
	    }
		return session.selectList(namespace + ".listAll");
	  }

	  @Override
	  public List<FreeBoard> listPage(int page) throws Exception {

	    if (page <= 0) {
	      page = 1;
	    }

	    page = (page - 1) * 10;

	    return session.selectList(namespace + ".listPage", page);
	  }

	  @Override
	  public List<FreeBoard> listCriteria(Criteria cri) throws Exception {

	    return session.selectList(namespace + ".listCriteria", cri);
	  }

	  @Override
	  public int countPaging(Criteria cri) throws Exception {

	    return session.selectOne(namespace + ".countPaging", cri);
	  }

	  @Override
	  public List<FreeBoard> listSearch(SearchCriteria cri) throws Exception {

	    return session.selectList(namespace + ".listSearch", cri);
	  }

	  @Override
	  public int listSearchCount(SearchCriteria cri) throws Exception {

	    return session.selectOne(namespace + ".listSearchCount", cri);
	  }
	  
	  @Override
	  public void updateReplyCnt(Integer freeBoard_Num, int amount) throws Exception {
		  Map<String, Object> paramMap = new HashMap<String, Object>();
		  
		  paramMap.put("freeBoard_Num", freeBoard_Num);
		  paramMap.put("amount", amount);
		  
		  session.update(namespace + ".updateReplyCnt", paramMap);
	  }
}
