package com.kosta136th.dealerNews;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

@Service
public class DealerNewsReplyServiceImpl implements DealerNewsReplyService{
	@Inject
	private DealerNewsReplyDAO dealerNewsReplyDao;
	
	@Override
	public List<DealerNewsReply> getDealerNewsReplyList(DealerNews dealerNews) {
		return dealerNewsReplyDao.getDealerNewsReplyList(dealerNews);
	}

	@Override
	public void writeReply(DealerNewsReply dealerNewsReply, HttpSession httpSession) {
		dealerNewsReplyDao.writeReply(dealerNewsReply, httpSession);
	}

	@Override
	public void deleteReply(DealerNewsReply dealerNewsReply) {
		dealerNewsReplyDao.deleteReply(dealerNewsReply);		
	}

}
