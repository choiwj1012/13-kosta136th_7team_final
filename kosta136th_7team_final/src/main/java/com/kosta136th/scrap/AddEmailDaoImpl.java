package com.kosta136th.scrap;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class AddEmailDaoImpl implements AddEmailDao {

	@Inject
	private SqlSession session;
	
	private static String namespace = "com.kosta136th.mapper.NewsMapper";
	
	@Override
	public void addEmail(String email) throws Exception {
		
		session.insert(namespace + ".insertEmail", email);
		System.out.println("addemailDaoImpl.email : " + email);

	}

}
