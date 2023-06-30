package com.foods.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.foods.service.replyService;
import com.foods.vo.replyVO;
@Controller
@RequestMapping("/reply/*")
public class replyController {
	@Inject
	replyService replyservice;
	//댓글입력
	@RequestMapping("insert")
	public void insert(@ModelAttribute replyVO vo, HttpSession session){
		//현재 로그인 한 아이디기억
		String memberId = (String) session.getAttribute("memberId");
		vo.setReplyer(memberId); //작성자에 현재 사용자 아이디를 저장
		replyservice.insert(vo); //등록작업
	}
	
	//댓글목록
	@RequestMapping("list")
	public ModelAndView list(@RequestParam int customerNo, ModelAndView mav){
		List<replyVO> list = replyservice.List(customerNo); //목록조회
		
		mav.setViewName("customer/replyList"); //이동할 페이지 지정
		mav.addObject("list",list);
		return mav;
	}
}
