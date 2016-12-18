package com.kosta136th.freeBoard;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kosta136th.freeBoard.FreeBoardReply;
import com.kosta136th.freeBoard.Criteria;
import com.kosta136th.freeBoard.FreeBoardDAO;
import com.kosta136th.freeBoard.FreeBoardReplyDAO;

@Service
public class FreeBoardReplyServiceImpl implements FreeBoardReplyService {
	
	@Inject
	  private FreeBoardReplyDAO replyDAO;
	  @Inject
	  private FreeBoardDAO boardDAO;
	  
	  @Transactional
	  @Override
	  public void addReply(FreeBoardReply vo) throws Exception {

		  replyDAO.create(vo);
		  boardDAO.updateReplyCnt(vo.getFreeBoard_Num(), 1);
	  }

	  @Override
	  public List<FreeBoardReply> listReply(Integer freeBoard_Num) throws Exception {

	    return replyDAO.list(freeBoard_Num);
	  }
	  
	 /* @Transactional
	  @Override
	  public void modifyReply(FreeBoardReply vo) throws Exception {

		  replyDAO.update(vo);
	  }
	  
	  @Transactional
	  @Override
	  public void removeReply(Integer reply_Num) throws Exception {
		  
		  int freeBoard_Num = replyDAO.getFreeBoard_Num(reply_Num);
		  replyDAO.delete(reply_Num);
		  boardDAO.updateReplyCnt(freeBoard_Num, -1);
	  }*/

	  @Override
	  public List<FreeBoardReply> listReplyPage(Integer freeBoard_Num, Criteria cri) 
	      throws Exception {

	    return replyDAO.listPage(freeBoard_Num, cri);
	  }

	  @Override
	  public int count(Integer freeBoard_Num) throws Exception {

	    return replyDAO.count(freeBoard_Num);
	  }
}
