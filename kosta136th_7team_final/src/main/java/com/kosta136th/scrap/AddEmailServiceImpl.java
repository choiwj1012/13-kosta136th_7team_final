package com.kosta136th.scrap;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class AddEmailServiceImpl implements AddEmailService {

	@Inject
	private AddEmailDao dao;
	
	@Override
	public void addEmail(String email) throws Exception {
		
		dao.addEmail(email);

	}

}
