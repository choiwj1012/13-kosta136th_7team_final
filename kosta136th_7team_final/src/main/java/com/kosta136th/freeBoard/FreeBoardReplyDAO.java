package com.kosta136th.freeBoard;

import java.util.List;
import com.kosta136th.freeBoard.FreeBoardReply;
import com.kosta136th.freeBoard.Criteria;

public interface FreeBoardReplyDAO {
	
	public List<FreeBoardReply> list(Integer freeBoard_Num) throws Exception;

	  public void create(FreeBoardReply vo) throws Exception;

//	  public void update(FreeBoardReply vo) throws Exception;
//
//	  public void delete(Integer reply_Num) throws Exception;

	  public List<FreeBoardReply> listPage(
	      Integer freeBoard_Num, Criteria cri) throws Exception;

	  public int count(Integer freeBoard_Num) throws Exception;
	  
	  public int getFreeBoard_Num(Integer reply_Num) throws Exception;
}
