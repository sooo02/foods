package com.foods.shop;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.foods.vo.FoodsVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")


public class AdminMapperTests {
   @Inject
   SqlSession sqlSession;
   
   String mapper = "com.foods.mapper.adminMapper.";
   
   /* 상품 등록 */
   @Test
   public void foodsEnrollTest() throws Exception{
      
      FoodsVO foods = new FoodsVO();
      
      foods.setFoodsName("mapper 테스트");
      foods.setCateCode("5678");
      foods.setFoodsPrice(20000);
      foods.setFoodsDetail("상품 소개 .....");
      
      sqlSession.insert(mapper+"foodsEnroll",foods);
   }
}