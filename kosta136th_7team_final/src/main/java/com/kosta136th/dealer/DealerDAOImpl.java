package com.kosta136th.dealer;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class DealerDAOImpl implements DealerDAO{

	@Inject
	private SqlSession session;
	
	private static String namespace = "com.kosta136th.mapper.dealerMapper";

	@Override
	public List<Dealer> check() throws Exception {
		
		return session.selectList(namespace + ".check");
	}

	@Override
	public void create(Dealer dealer) throws Exception {
	
		session.insert(namespace + ".insert", dealer);
		
	}

	@Override
	public List<Dealer> list() throws Exception {
		
		return session.selectList(namespace + ".list");
	}

	@Override
	public Dealer read(int dealerNum) throws Exception {
		
		return session.selectOne(namespace + ".read", dealerNum);
	}

	@Override
	public void remove(int dealerNum) throws Exception {
		
		session.delete(namespace + ".delete", dealerNum);
		
	}

	@Override
	public int score(int dealerNum) throws Exception {
		
		return session.selectOne(namespace + ".score", dealerNum);
		
	}

	@Override
	public void update(Dealer dealer) throws Exception {
		
		session.update(namespace + ".update", dealer);
		
	}
	
	

}
