package com.foods.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.foods.dao.foodsDAO;
import com.foods.vo.FoodsVO;
@Service
public class foodsServiceImpl implements foodsService {
   @Inject
   foodsDAO foodsDao;
   @Override
   public List<FoodsVO> FoodsList() {
      
      // Dao에 선언된 메소드를 호출
            return foodsDao.foodsList();
   }
   public void insertFoods(FoodsVO vo) {
      foodsDao.insertFoods(vo);
   }
   public FoodsVO viewFoods(int foodsId) {
      return foodsDao.viewFoods(foodsId);
   }
   public void updateFoods(FoodsVO vo) {
      foodsDao.updateFoods(vo);
   }

   
   public void deleteFoods(int foodsId) {
      foodsDao.deleteFoods(foodsId);
   }
   
}