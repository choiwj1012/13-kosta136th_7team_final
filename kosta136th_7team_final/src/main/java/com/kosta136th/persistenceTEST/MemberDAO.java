package com.kosta136th.persistenceTEST;

import com.kosta136th.domainTEST.MemberVO;

public interface MemberDAO {

	public String getTime();
	
	public void insertMember(MemberVO vo);
	
}
