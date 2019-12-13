package com.yedam.gca.member.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
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
		return "/notiles/member/login";
	}
	
	// 네이버 아이디로 로그인 성공 시에 돌아올 페이지 -> 반짝 방 리스트로 감
	@RequestMapping("/login/naverCallback")
	public String naverCallback() {
		return "/notiles/member/callback";
	}
	
	// security에서 로그인 후 유저와 관리자가 돌아갈 페이지 따로 설정
	@RequestMapping("/login/callback")
	public String callback(HttpServletRequest request) {
		if(request.isUserInRole("ROLE_Admin")) { // 관리자가 로그인 하면 차트 페이지로 넘어감
			return "redirect:/admin/chart";
		} else { // 일반 사용자가 로그인 하면 반짝 목록 페이지로 넘어감
			return "redirect:/sgroup/getSgList";
		}
	}
	
	// 회원가입 페이지
	@RequestMapping("/join")
	public String join() {
		return "/notiles/member/join";
	}
	
	// 회원가입 하기 (디비에 삽입) -> 회원가입 성공 시에 제일 첫 로그인 페이지로 감
	@RequestMapping("/insertJoin")
	public String insertJoin(HttpServletRequest request) {
		MembersVO vo = new MembersVO();
		vo.setM_id(request.getParameter("mId"));
		vo.setM_password(request.getParameter("mPw"));
		vo.setM_name(request.getParameter("mName"));
		vo.setM_nick(request.getParameter("mNick"));
		vo.setM_location(request.getParameter("mAddress"));
		vo.setM_age(request.getParameter("mAge"));
		vo.setGender_cd(request.getParameter("checkbox1"));
		vo.setM_email(request.getParameter("mEmail"));
		vo.setM_xy(request.getParameter("mXy"));
		memberService.insertMember(vo);
		return "/notiles/member/login";
	}
	
	// 아이디 중복 확인
	@ResponseBody
	@RequestMapping("/ajax/checkId")
	public int checkId(String id) {
		return memberService.checkId(id);
	}
	
	// 아이디 찾기 페이지
	@RequestMapping("/forgotId")
	public String forgotId(HttpServletRequest request) {
		return "/notiles/member/forgotId";
	}
	
	// 이메일로 아이디 보내기
	@RequestMapping("/getId")
	public String getId(HttpServletRequest request, Model model) {
		MembersVO vo = new MembersVO();
		vo.setM_name(request.getParameter("mName"));
		vo.setM_email(request.getParameter("mEmail"));
		model.addAttribute("idMessage", memberService.forgotId(vo)); // jsp 페이지에서 alert로 띄울 메시지 넘기기
		return "/notiles/member/login";
	}
	
	// 비밀번호 찾기 페이지
	@RequestMapping("/forgotPassword")
	public String forgotPw() {
		return "/notiles/member/forgotPw";
	}
	
	// 이메일로 임시 비밀번호 보내기
	@RequestMapping("/getTempPassword")
	public String getTempPassword(HttpServletRequest request, Model model) {
		MembersVO vo = new MembersVO();
		vo.setM_id(request.getParameter("mId"));
		vo.setM_name(request.getParameter("mName"));
		vo.setM_email(request.getParameter("mEmail"));
		model.addAttribute("pwMessage", memberService.forgotPw(vo)); // jsp 페이지에서 alert로 띄울 메시지 넘기기
		return "/notiles/member/login";
	}
	// 지원 끝
	

	
	// **************** 수림 ***************** 
	
	// 1. 환경설정 페이지 이동
	@RequestMapping("member/option")
	public String getAlarmInfo() {
		return "/user/member/option";
	}
	
	// 2. 사용자 알람관련 정보 출력
	@RequestMapping("/ajax/getOption.json")
	@ResponseBody
	public MembersVO getAlarmInfo(MembersVO vo) {
		//임시 아이디
		vo.setM_id("test");
		return memberService.getAlarmInfo(vo);
	}
	// 3. 스위치 클릭시 정보 업데이트
	@RequestMapping(value = "/ajax/updateOption.json"
					, method = RequestMethod.PUT
					, consumes="application/json") //요청헤더 jsp에서 보낸걸 읽음
	@ResponseBody
	public void updateSwitch(@RequestBody MembersVO vo) {
		memberService.updateSwitch(vo);
	}
	
	// 3. 범위슬라이더 변경시 범위 업데이트
	@RequestMapping(value = "/ajax/updateRange.json"
			, method = RequestMethod.PUT
			, consumes="application/json")
	@ResponseBody
	public void updateRange(@RequestBody MembersVO vo) {
		memberService.updateRange(vo);
	}
}
