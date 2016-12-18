package com.kosta136th.freeBoard;

import java.util.List;

import com.kosta136th.freeBoard.FreeBoard;
import com.kosta136th.freeBoard.Criteria;
import com.kosta136th.freeBoard.SearchCriteria;

public interface FreeBoardService {

	public void regist(FreeBoard freeBoard) throws Exception;
	
	public FreeBoard read(Integer freeBoard_Num) throws Exception;

	// public void modify(FreeBoard freeBoard) throws Exception;

	public List<FreeBoard> listAll() throws Exception;

	public List<FreeBoard> listCriteria(Criteria cri) throws Exception;

	public int listCountCriteria(Criteria cri) throws Exception;

	public List<FreeBoard> listSearchCriteria(SearchCriteria cri) throws Exception;

	public int listSearchCount(SearchCriteria cri) throws Exception;
}
