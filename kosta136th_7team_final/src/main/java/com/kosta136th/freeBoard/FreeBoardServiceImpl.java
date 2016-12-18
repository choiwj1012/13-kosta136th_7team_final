package com.kosta136th.freeBoard;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.kosta136th.freeBoard.FreeBoard;
import com.kosta136th.freeBoard.Criteria;
import com.kosta136th.freeBoard.SearchCriteria;
import com.kosta136th.freeBoard.FreeBoardDAO;

@Service
public class FreeBoardServiceImpl implements FreeBoardService {
	@Inject
	private FreeBoardDAO dao;

	@Override
	public void regist(FreeBoard freeBoard) throws Exception {

		dao.create(freeBoard);
	}

	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public FreeBoard read(Integer freeBoard_Num) throws Exception {
		dao.updateViewCnt(freeBoard_Num);
		return dao.read(freeBoard_Num);
	}

	// @Override
	// public void modify(FreeBoard freeBoard) throws Exception {
	// // TODO Auto-generated method stub
	//
	// }

	@Override
	public List<FreeBoard> listAll() throws Exception {

		return dao.listAll();
	}

	@Override
	public List<FreeBoard> listCriteria(Criteria cri) throws Exception {

		return dao.listCriteria(cri);
	}

	@Override
	public int listCountCriteria(Criteria cri) throws Exception {

		return dao.countPaging(cri);
	}

	@Override
	public List<FreeBoard> listSearchCriteria(SearchCriteria cri) throws Exception {

		return dao.listSearch(cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {

		return dao.listSearchCount(cri);
	}

}
