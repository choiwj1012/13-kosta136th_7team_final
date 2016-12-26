package com.kosta136th.freeBoard;

import java.util.List;

public interface FreeBoardService {

	public void regist(FreeBoard freeBoard) throws Exception;
	
	public FreeBoard read(Integer freeBoard_Num) throws Exception;
	
	public void modify(FreeBoard freeBoard) throws Exception;
	
	public void remove(Integer freeBoard_Num) throws Exception;
	
	public List<FreeBoard> listAll() throws Exception;
}
