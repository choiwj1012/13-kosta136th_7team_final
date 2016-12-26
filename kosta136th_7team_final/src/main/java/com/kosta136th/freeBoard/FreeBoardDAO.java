package com.kosta136th.freeBoard;

import java.util.List;

public interface FreeBoardDAO {

	public void create(FreeBoard vo) throws Exception;

	public FreeBoard read(Integer freeBoard_Num) throws Exception;
	
	public void update(FreeBoard vo) throws Exception;
	
	public void delete(Integer freeBoard_Num) throws Exception;
	
	public List<FreeBoard> listAll() throws Exception; 

}
