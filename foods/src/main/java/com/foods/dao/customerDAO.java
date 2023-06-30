package com.foods.dao;

import java.util.List;

import com.foods.vo.customerVO;
 
public interface customerDAO {
	public List<customerVO> selectList();
    public void insert(customerVO vo);
	public customerVO view(int customerNo);
    public void update(customerVO vo);
	public void delete(int customerNo);
	
	//추가(응용) 게시글에 추가적인 작업- 검색, 페이지, 조회수
	public void increaseViewcnt(int customerNo); //게시글 증가
	//검색 분류(searchoption), 검색어(keyword)
	public List<customerVO> listAll(int start, int end, String searchOption, String keyword);
	public int countArticle(String searchOption, String keyword);
}
