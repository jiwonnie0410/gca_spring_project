package com.yedam.gca.member.controller;

import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
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
	public String callback(HttpServletRequest request, Model model) {
		// security 통해서 로그인한 사람의 정보 가져오기
		MembersVO memInfo = (MembersVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String mStatus = memInfo.getM_status_cd();
		System.out.println("이 사람 활동 상태: " + mStatus);
		
		if(request.isUserInRole("ROLE_Admin")) { // 관리자가 로그인 하면 차트 페이지로 넘어감
			return "redirect:/admin/chart";
		} else if (request.isUserInRole("ROLE_User") && mStatus.equals("M02")) {
			model.addAttribute("statusMessage", "3번 이상의 신고가 누적되어 활동이 일시적으로 중지되었습니다. 현재 게시판 이용만 가능한 점 참고바랍니다.");
			return "redirect:/sgroup/getSgList";
		}
		else { // 일반 사용자가 로그인 하면 반짝 목록 페이지로 넘어감
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
	public String insertJoin(HttpServletRequest request, Model model, MembersVO vo) {
		vo.setGender_cd(request.getParameter("checkbox1")); // 성별만 따로 가져옴
		
		// 회원가입 후에 성공 및 실패에 따라 각각 다른 페이지로 리턴
		Map<String, Object> map = memberService.insertMember(vo);
		boolean flag = (boolean) map.get("flag");
		if(flag == false) {
			model.addAttribute("joinMessage", map.get("message"));
			return "../notiles/member/join";
		}
		else {
			model.addAttribute("joinMessage", map.get("message"));
			return "/notiles/member/login";
		}
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
	public String getId(HttpServletRequest request, Model model, MembersVO vo) {
		// 이메일로 아이디 보내기 성공 및 실패에 따라 각각 다른 페이지로 리턴
		Map<String, Object> map = memberService.forgotId(vo);
		boolean flag = (boolean) map.get("flag");
		if(flag == false) { // 실패했을 때
			model.addAttribute("idMessage", map.get("message")); // jsp 페이지에서 alert로 띄울 메시지 넘기기
			return "/notiles/member/forgotId";
		}
		else { // 성공했을 때
			model.addAttribute("idMessage", map.get("message"));
			return "/notiles/member/login";
		}
	}
	
	// 비밀번호 찾기 페이지
	@RequestMapping("/forgotPassword")
	public String forgotPw() {
		return "/notiles/member/forgotPw";
	}
	
	// 이메일로 임시 비밀번호 보내기
	@RequestMapping("/getTempPassword")
	public String getTempPassword(HttpServletRequest request, Model model, MembersVO vo) {
		// 이메일로 임시 비밀번호 보내기 성공 및 실패에 따라 각각 다른 페이지로 리턴
		Map<String, Object> map = memberService.forgotPw(vo);
		boolean flag = (boolean) map.get("flag");
		if(flag == false) { // 실패했을 때
			model.addAttribute("pwMessage", map.get("message")); // jsp 페이지에서 alert로 띄울 메시지 넘기기
			return "/notiles/member/forgotPw";
		}
		else { // 성공했을 때
			model.addAttribute("pwMessage", map.get("message"));
			return "/notiles/member/login";
		}
	}
	
	// 비밀번호 변경 페이지
    @RequestMapping("/member/changePassword")
    public String changePassword() {
    	return "/notiles/member/changePassword";
    }
    
    // 비밀번호 변경
    @RequestMapping("/member/updatePassword")
    public String updatePassword(MembersVO vo, Model model) {
    	model.addAttribute("pwChangeMessage", memberService.changePw(vo)); // jsp 페이지에서 alert로 띄울 메시지 넘기기
		return "/notiles/member/member_view";
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
	public MembersVO getAlarmInfo(MembersVO vo, Authentication auth) {
		UserDetails userDetails = (UserDetails) auth.getPrincipal();
		String id = userDetails.getUsername();
		vo.setM_id(id);
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
