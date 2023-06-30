package com.foods.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.foods.dao.customerDAO;
import com.foods.vo.customerVO;
@Service
public class customerServiceImpl implements customerService {
	@Inject
	customerDAO customerDAO;
	
	public List<customerVO> selectList() {		
		return customerDAO.selectList();
	}
 
	
	public void insert(customerVO vo) {
		customerDAO.insert(vo);
	}

	
	public customerVO view(int customerNo) {		
		return customerDAO.view(customerNo);
	}

	
	public void update(customerVO vo) {
		customerDAO.update(vo);
	}

	
	public void delete(int customerNo) {
		customerDAO.delete(customerNo);
	}

	//추가(응용) 게시글에 추가적인 작업- 검색, 페이지, 조회수
	public void increaseViewcnt(int customerNo){
		customerDAO.increaseViewcnt(customerNo);
	}
	public List<customerVO> listAll(int start, int end, String searchOption, String keyword){
		return customerDAO.listAll(start, end, searchOption, keyword);
	}
	
	// 07. 게시글 레코드 갯수 customerDAO.countArticle메서드 
    @Override
    public int countArticle(String searchOption, String keyword){
        return customerDAO.countArticle(searchOption, keyword);
    }
}
