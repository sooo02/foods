package com.foods.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.foods.service.shopService;
import com.foods.vo.FoodsVO;

@Controller

public class shopController {
	 @Autowired
	private shopService shopservice;

	//상품 관리
	@RequestMapping("/shop")
	public String memberList(Model model) { //Model 앞페이지의 정보
		//목록을 조회를 해서 전달
		List<FoodsVO> list = shopservice.FoodsList();
		model.addAttribute("list", list); //foods_list.jsp에 items에 선언된 이름과 동일
		
		return "shop";
	}
	@RequestMapping("shop/view") 
	public String foodsView(@RequestParam int foodsId, Model model) {
		//페이지 연결 환인 후
		//서비스 연결(값을 전달시 addAttribute)
		//dto = member_view.jsp value에 {dto.userio}
		System.out.println("상품 상세보기");
		FoodsVO data = shopservice.viewFoods(foodsId);
		model.addAttribute("dto", data); //session영역에 저장
		
		return "shop_view";
	}
		}

