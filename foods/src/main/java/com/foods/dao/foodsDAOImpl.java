package com.foods.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.foods.vo.FoodsVO;

@Repository
public class foodsDAOImpl implements foodsDAO {
   //DAO 데이터베이스 처리를 위해 SqlSession 이용
   @Inject
   SqlSession sqlSession;
   String mapper = "foodsMapper.";
      
   public List<FoodsVO> foodsList() {
      //mybatis에서 제공하는 메소드 insert,update,delete,select, selectList(모두조회), selectOne(1개조회)
      
      //return sqlSession.selectList("memberMapper.memberList"); //사용할 맵퍼명과 전달할 값 
      return sqlSession.selectList(mapper+"foodsList"); //사용할 맵퍼명과 전달할 값
   }
   @Override
   public void insertFoods(FoodsVO vo) {
      sqlSession.insert(mapper+"foodsWrite", vo); //사용할 맵퍼명과 전달할 값

   }
   @Override
   public FoodsVO viewFoods(int foodsId) {
      // ""안에는 mapper에 사용할 id 이름, memberId가 전달할 값
      return sqlSession.selectOne(mapper+"foodsView", foodsId); //1개의 값만 조회
   }
   @Override
   public void updateFoods(FoodsVO vo) {
      sqlSession.update(mapper+"foodsUpdate", vo);

   }

   @Override
   public void deleteFoods(int foodsId) {
      sqlSession.delete(mapper+"foodsDelete", foodsId);

   }
   
}