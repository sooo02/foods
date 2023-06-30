package com.foods.dao;

import java.util.List;

import com.foods.vo.FoodsVO;
import com.foods.vo.customerVO;

public interface foodsDAO {
      public List<FoodsVO> foodsList(); //여러상품의 정보를 조회
   
      //상품 등록
      public void insertFoods(FoodsVO vo); //한명의 정보를 저장
   
      //상품상세(수정시 필요)
      public FoodsVO viewFoods(int foodsId); //한명의 정보를 조회
      
      public void updateFoods(FoodsVO vo);
      
      public void deleteFoods(int foodsId);
      
      
}