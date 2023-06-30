package com.foods.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.foods.dao.memberDAO;
import com.foods.vo.MemberVO;

//서비스 영역은 어노테이션 Service로 선언
@Service
public class memberServiceImpl implements memberService {
	//DAO를 호출해서 자료를 처리하는 목적
	@Inject
	memberDAO memberDao;
		
	public List<MemberVO> memberList() {
		// Dao에 선언된 메소드를 호출
		return memberDao.memberList();
	}
	
	public void insertMember(MemberVO vo) {
		memberDao.insertMember(vo);	
	}
	
	public MemberVO viewMember(String memberId) {
		return memberDao.viewMember(memberId);
	}
	
	public void updateMember(MemberVO vo) {
		memberDao.updateMember(vo);
	}
	public void deleteMember(String memberId) {
		memberDao.deleteMember(memberId);
	}
	public boolean checkPw(String memberId, String memberPw) {
		return memberDao.checkPw(memberId, memberPw);
	}
	
	//로그인 체크
	public boolean loginCheck(MemberVO vo, HttpSession session) {
		boolean result = memberDao.loginCheck(vo); //이름->DAO->true,false
		
		if(result) { //정상적인 로그인이면
			//로그인된 회원의 정보를 읽어온다.
			MemberVO vo2 = memberDao.viewMember(vo.getMemberId());
			session.setAttribute("memberId", vo2.getMemberId()); //섹션영역에 아이디와 이름을 저장
			session.setAttribute("memberName", vo2.getMemberName());
			session.setAttribute("admin", vo2.getAdmin());
		}
		return result;
		
	}
	
	//로그아웃
	public void logout(HttpSession session) {
		//지정한 섹션값만 삭제
		//session.removeAttribute("memberId");
		//session.removeAttribute("memberName");
		//모든 섹션값을 삭제(다른 설정값까지 삭제)
		session.invalidate();
	}

}
