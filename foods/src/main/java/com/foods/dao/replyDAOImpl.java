package com.foods.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.foods.vo.replyVO;
@Repository
public class replyDAOImpl implements replyDAO {
	@Inject
	SqlSession sqlSession;
	
	String mapper = "replyMapper.";
	
	@Override
	public java.util.List<replyVO> List(int customerNo) {
		return sqlSession.selectList(mapper+"listReply", customerNo);
	}

	@Override
	public void insert(replyVO vo) {
		sqlSession.insert(mapper+"insertReply", vo);

	}

	@Override
	public void update(replyVO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(int customerNo) {
		// TODO Auto-generated method stub

	}

}
