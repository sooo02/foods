package com.foods.dao;

import java.util.List;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.foods.vo.customerVO;

@Repository 
public class customerDAOImpl implements customerDAO {
	
	@Inject
	SqlSession sqlSession;
	
	String  mapper="customerMapper."; //namespace를 지정
	
	@Override
	public List<customerVO> selectList() {
		return sqlSession.selectList(mapper+"selectList");
	}

	@Override
	public void insert(customerVO vo) {
		sqlSession.insert(mapper+"insert", vo); //''안에 사용할 id

	}

	@Override
	public customerVO view(int customerNo) {
		return sqlSession.selectOne(mapper+"view", customerNo);
	}

	@Override
	public void update(customerVO vo) {
		sqlSession.update(mapper+"update", vo);

	}

	@Override
	public void delete(int customerNo) {
		sqlSession.delete(mapper+"delete", customerNo);

	}

	@Override
	public void increaseViewcnt(int customerNo) {
		sqlSession.update(mapper+"increaseViewcnt", customerNo); //해당 게시물의 조회수를 증가

	}

	//검색기능
	@Override
	public List<customerVO> listAll(int start, int end, String searchOption, String keyword){
		//2개의 변수를 batis에 전달하기 위해서 map 사용
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);

		return sqlSession.selectList(mapper+"listAll", map);
	}
	
	// 07. 게시글 레코드 갯수
    @Override
    public int countArticle(String searchOption, String keyword){
        // 검색옵션, 키워드 맵에 저장
        Map<String, String> map = new HashMap<String, String>();
        map.put("searchOption", searchOption);
        map.put("keyword", keyword);
        
		return sqlSession.selectOne(mapper+"countArticle", map);
		
    }  	

}
