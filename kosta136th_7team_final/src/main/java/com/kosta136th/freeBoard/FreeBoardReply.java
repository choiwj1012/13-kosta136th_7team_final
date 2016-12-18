package com.kosta136th.freeBoard;

import java.util.Date;

public class FreeBoardReply {

	private Integer reply_Num;
	private Integer freeBoard_Num;
	private String replytext;
	private String replyer;

	private Date regdate;

	public Integer getReply_Num() {
		return reply_Num;
	}

	public void setReply_Num(Integer reply_Num) {
		this.reply_Num = reply_Num;
	}

	public Integer getFreeBoard_Num() {
		return freeBoard_Num;
	}

	public void setFreeBoard_Num(Integer freeBoard_Num) {
		this.freeBoard_Num = freeBoard_Num;
	}

	public String getReplytext() {
		return replytext;
	}

	public void setReplytext(String replytext) {
		this.replytext = replytext;
	}

	public String getReplyer() {
		return replyer;
	}

	public void setReplyer(String replyer) {
		this.replyer = replyer;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "ReplyVO [reply_Num=" + reply_Num + ", freeBoard_Num=" + freeBoard_Num + ", replytext=" + replytext
				+ ", replyer=" + replyer + ", regdate=" + regdate + "]";
	}
}
