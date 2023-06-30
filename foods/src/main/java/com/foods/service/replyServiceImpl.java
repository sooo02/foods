package com.foods.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.foods.vo.replyVO;
import com.foods.dao.replyDAO;
@Service
public class replyServiceImpl implements replyService {
	@Inject
	replyDAO replyDao;
	
	@Override
	public java.util.List<replyVO> List(int customerNo) {
		return replyDao.List(customerNo);
	}

	@Override
	public void insert(replyVO vo) {
		replyDao.insert(vo);

	}

	@Override
	public void update(replyVO vo) {
		replyDao.update(vo);

	}

	@Override
	public void delete(int customerNo) {
		replyDao.delete(customerNo);

	}

}
