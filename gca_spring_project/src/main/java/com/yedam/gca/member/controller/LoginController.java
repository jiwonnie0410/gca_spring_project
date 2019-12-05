package com.yedam.gca.member.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.gca.member.service.MemberService;
import com.yedam.gca.member.vo.MembersVO;

@Controller
public class LoginController {
	
	@Autowired
	MemberService memberService;

	// 지원
	// 첫 로그인 페이지 (홈페이지 열자마자 보이는 화면)
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "/member/login";
	}
	
	// 네이버 아이디로 로그인 성공 시에 돌아올 페이지 -> 반짝 방 리스트로 감
	@RequestMapping("/login/naverCallback")
	public String naverCallback() {
		return "/member/callback";
	}
	
	// 회원가입 페이지
	@RequestMapping("/join")
	public String join() {
		return "/member/join";
	}
	
	// 회원가입 하기 (디비에 삽입) -> 회원가입 성공 시에 제일 첫 로그인 페이지로 감
	@RequestMapping("/insertJoin")
	public String insertJoin(HttpServletRequest request, MembersVO vo) {
		System.out.println("회원가입하려는 아이디: " + request.getParameter("mId"));
		vo.setM_id(request.getParameter("mId"));
		vo.setM_password(request.getParameter("mPw"));
		vo.setM_name(request.getParameter("mName"));
		vo.setM_nick(request.getParameter("mNick"));
		vo.setM_location(request.getParameter("mAddress"));
		vo.setM_age(request.getParameter("mAge"));
		vo.setGender_cd(request.getParameter("checkbox1"));
		memberService.insertMember(vo);
		return "/member/login";
	}
	
	// 아이디 중복 확인
	@ResponseBody
	@RequestMapping("/ajax/checkId")
	public int checkId(String id) {
		return memberService.checkId(id);
	}
	
	// 아이디 찾기 페이지
	@RequestMapping("/forgotId")
	public String forgotId() {
		return "/member/forgotId";
	}
	
	// 비밀번호 찾기 페이지
	@RequestMapping("/forgotPassword")
	public String forgotPw() {
		return "/member/forgotPw";
	}
	
}
