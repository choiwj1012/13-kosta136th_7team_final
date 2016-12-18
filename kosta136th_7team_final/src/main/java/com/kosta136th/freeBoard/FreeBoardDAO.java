package com.kosta136th.freeBoard;

import java.util.List;
import com.kosta136th.freeBoard.FreeBoard;
import com.kosta136th.freeBoard.Criteria;
import com.kosta136th.freeBoard.SearchCriteria;


public interface FreeBoardDAO {

	public void create(FreeBoard vo) throws Exception;

	public FreeBoard read(Integer freeBoard_Num) throws Exception;

//	public void update(FreeBoard vo) throws Exception;
//
//	public void delete(Integer freeBoard_Num) throws Exception;

	public List<FreeBoard> listAll() throws Exception;

	public List<FreeBoard> listPage(int page) throws Exception;

	public List<FreeBoard> listCriteria(Criteria cri) throws Exception;

	public int countPaging(Criteria cri) throws Exception;

	// use for dynamic sql

	public List<FreeBoard> listSearch(SearchCriteria cri) throws Exception;

	public int listSearchCount(SearchCriteria cri) throws Exception;

	public void updateReplyCnt(Integer freeBoard_Num, int amount) throws Exception;

	public void updateViewCnt(Integer freeBoard_Num) throws Exception;

}
