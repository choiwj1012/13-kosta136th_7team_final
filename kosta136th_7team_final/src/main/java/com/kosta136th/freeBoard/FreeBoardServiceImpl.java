package com.kosta136th.freeBoard;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class FreeBoardServiceImpl implements FreeBoardService {
	
	@Inject
	private FreeBoardDAO dao;

	@Override
	public void regist(FreeBoard freeBoard) throws Exception {
		dao.create(freeBoard);
	}

	@Override
	public FreeBoard read(Integer freeBoard_Num) throws Exception {
		return dao.read(freeBoard_Num);
	}

	@Override
	public void modify(FreeBoard freeBoard) throws Exception {
		dao.update(freeBoard);
	}

	@Override
	public void remove(Integer freeBoard_Num) throws Exception {
		dao.delete(freeBoard_Num);;
	}

	@Override
	public List<FreeBoard> listAll() throws Exception {
		return dao.listAll();
	}

}
