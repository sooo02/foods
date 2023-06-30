package com.foods.dao;

import java.util.List;

import com.foods.vo.FoodsVO;

public interface shopDAO {
		public List<FoodsVO> foodsList(); //여러상품의 정보를 조회
	
		//상품상세(수정시 필요)
		public FoodsVO viewFoods(int foodsId); //한명의 정보를 조회
}
