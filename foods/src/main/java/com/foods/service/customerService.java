package com.foods.service;

import java.util.List;

import com.foods.vo.customerVO;

public interface customerService {
	public List<customerVO> selectList();
    public void insert(customerVO vo);
	public customerVO view(int customerNo);
    public void update(customerVO vo);
	public void delete(int customerNo);
	//조회수
	public void increaseViewcnt(int customerNo);
	//페이징, 검색
	public List<customerVO> listAll(int start, int end, String searchOption, String keyword);
	public int countArticle(String searchOption, String keyword) throws Exception;	
}
 