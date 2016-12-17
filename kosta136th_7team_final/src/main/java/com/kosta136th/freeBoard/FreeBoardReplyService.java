package com.kosta136th.freeBoard;

import java.util.List;
import com.kosta136th.freeBoard.Criteria;
import com.kosta136th.freeBoard.FreeBoardReply;

public interface FreeBoardReplyService {

	public void addReply(FreeBoardReply vo) throws Exception;

	public List<FreeBoardReply> listReply(Integer freeBoard_Num) throws Exception;

//	public void modifyReply(FreeBoardReply vo) throws Exception;
//
//	public void removeReply(Integer reply_Num) throws Exception;

	public List<FreeBoardReply> listReplyPage(Integer freeBoard_Num, Criteria cri) throws Exception;

	public int count(Integer freeBoard_Num) throws Exception;
}
