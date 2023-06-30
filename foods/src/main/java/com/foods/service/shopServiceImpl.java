package com.foods.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.foods.dao.foodsDAO;
import com.foods.dao.shopDAO;
import com.foods.vo.FoodsVO;
@Service
public class shopServiceImpl implements shopService {
	@Inject
	shopDAO shopDao;
	@Override
	public List<FoodsVO> FoodsList() { 
		// Dao에 선언된 메소드를 호출
				return shopDao.foodsList();
	}
	public FoodsVO viewFoods(int foodsId) {
		return shopDao.viewFoods(foodsId);
	}
}
