package com.kosta136th.dealerNews;

import java.util.List;

import javax.servlet.http.HttpSession;

public interface DealerNewsReplyDAO {

	List<DealerNewsReply> getDealerNewsReplyList(DealerNews dealerNews);

	void writeReply(DealerNewsReply dealerNewsReply, HttpSession httpSession);

	void deleteReply(DealerNewsReply dealerNewsReply);

}
