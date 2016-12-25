package com.kosta136th.dealerNews;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class DealerNewsFileServiceImpl implements DealerNewsFileService{

	@Inject
	private DealerNewsFileDAO dealerNewsFileDAO;
	
	@Override
	public int getAutoIncrementOfDealerNews() {
		return dealerNewsFileDAO.getAutoIncrementOfDealerNews();
	}

}
