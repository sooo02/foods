package com.foods.service;

import java.util.List;

import com.foods.vo.FoodsVO;

public interface shopService {
	//상품목록
	public List<FoodsVO> FoodsList(); //여러상품의 정보를 조회
	//상품상세(수정시 필요)
		public FoodsVO viewFoods(int foodsId); //한명의 정보를 조회
}
