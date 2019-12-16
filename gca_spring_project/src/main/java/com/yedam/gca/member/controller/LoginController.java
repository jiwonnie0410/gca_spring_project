package com.yedam.gca.member.controller;

import java.io.IOException;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.yedam.gca.member.service.MemberService;
import com.yedam.gca.member.service.NaverLoginBO;
import com.yedam.gca.member.vo.MembersVO;

@Controller
public class LoginController {

	@Autowired
	MemberService memberService;

	// 지원
	
//	private NaverLoginBO naverLoginBO;
//	private String apiResult = null;
//
//	@Autowired
//	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
//		this.naverLoginBO = naverLoginBO;
//	}
	
	// 첫 로그인 페이지 (홈페이지 열자마자 보이는 화면)
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "/notiles/member/login";
	}
	
//	// 첫 로그인 페이지 (홈페이지 열자마자 보이는 화면)
//	@RequestMapping(value = "/", method = { RequestMethod.GET, RequestMethod.POST })
//	public String home(Locale locale, Model model, HttpSession session) {
//		// 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출
//		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
//		// https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
//		// redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
//		System.out.println("네이버:" + naverAuthUrl);
//		// 네이버
//		model.addAttribute("url", naverAuthUrl);
//		
//		return "/notiles/member/login";
//	}

	// 네이버 아이디로 로그인 성공 시에 돌아올 페이지 -> 반짝 방 리스트로 감
	@RequestMapping("/login/naverCallback")
	public String naverCallback() {
		return "/notiles/member/callback";
	}
	
//	// 네이버 아이디로 로그인 성공 시에 돌아올 페이지 -> 반짝 방 리스트로 감
//	@RequestMapping(value = "/login/naverCallback", method = { RequestMethod.GET, RequestMethod.POST })
//	public String naverCallback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws IOException, ParseException {
//		System.out.println("여기는 callback");
//		OAuth2AccessToken oauthToken;
//		oauthToken = naverLoginBO.getAccessToken(session, code, state);
//		
//		// 1. 로그인 사용자 정보를 읽어온다.
//		apiResult = naverLoginBO.getUserProfile(oauthToken); // String형식의 json데이터
//		/**
//		 * apiResult json 구조 {"resultcode":"00", "message":"success",
//		 * "response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
//		 **/
//		
//		// 2. String형식인 apiResult를 json형태로 바꿈
//		JSONParser parser = new JSONParser();
//		Object obj = parser.parse(apiResult);
//		JSONObject jsonObj = (JSONObject) obj;
//		
//		// 3. 데이터 파싱
//		// Top레벨 단계 _response 파싱
//		JSONObject response_obj = (JSONObject) jsonObj.get("response");
//		// response의 nickname값 파싱
//		String nickname = (String) response_obj.get("nickname");
//		System.out.println(nickname);
//		
//		// 4. 파싱 닉네임 세션으로 저장
//		session.setAttribute("sessionId", nickname); // 세션 생성
//		model.addAttribute("result", apiResult);
//		
//		return "/notiles/member/callback";
//	}
	
		/*
		 * // 네이버는 로그아웃이 따로 없기 때문에 세션을 비워줘야 함
		 * 
		 * @RequestMapping(value = "/logout", method = { RequestMethod.GET,
		 * RequestMethod.POST }) public String logout(HttpSession session) throws
		 * IOException { System.out.println("여기는 logout"); session.invalidate(); return
		 * "redirect:index.jsp"; }
		 */

	// security에서 로그인 후 유저와 관리자가 돌아갈 페이지 따로 설정
	@RequestMapping("/login/callback")
	public String callback(HttpServletRequest request, Model model) {
		// security 통해서 로그인한 사람의 정보 가져오기
		MembersVO memInfo = (MembersVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String mStatus = memInfo.getM_status_cd();

		// 권한과 활동 상태에 따라 페이지 다르게 리턴
		if (request.isUserInRole("ROLE_Admin")) { // 관리자가 로그인 하면 차트 페이지로 넘어감
			return "redirect:/admin/chart";
		} else if (request.isUserInRole("ROLE_User") && mStatus.equals("M02")) { // 활동 정지 상태인 유저면 메시지 띄우는 페이지로 넘어간 다음
																					// 홍보게시판 감
			return "redirect:/alert/block";
		} else { // 일반 사용자가 로그인 하면 반짝 목록 페이지로 넘어감
			return "redirect:/sgroup/getSgList";
		}
	}

	// 활동정지인 사람들 alert 띄우는 페이지
	@RequestMapping("alert/block")
	public String block() {
		return "/notiles/member/blockId";
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
		if (flag == false) {
			model.addAttribute("joinMessage", map.get("message"));
			return "../notiles/member/join";
		} else {
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
		if (flag == false) { // 실패했을 때
			model.addAttribute("idMessage", map.get("message")); // jsp 페이지에서 alert로 띄울 메시지 넘기기
			return "/notiles/member/forgotId";
		} else { // 성공했을 때
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
		if (flag == false) { // 실패했을 때
			model.addAttribute("pwMessage", map.get("message")); // jsp 페이지에서 alert로 띄울 메시지 넘기기
			return "/notiles/member/forgotPw";
		} else { // 성공했을 때
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
	@RequestMapping(value = "/ajax/updateOption.json", method = RequestMethod.PUT, consumes = "application/json") // 요청헤더
																													// jsp에서
																													// 보낸걸
																													// 읽음
	@ResponseBody
	public void updateSwitch(@RequestBody MembersVO vo) {
		memberService.updateSwitch(vo);
	}

	// 3. 범위슬라이더 변경시 범위 업데이트
	@RequestMapping(value = "/ajax/updateRange.json", method = RequestMethod.PUT, consumes = "application/json")
	@ResponseBody
	public void updateRange(@RequestBody MembersVO vo) {
		memberService.updateRange(vo);
	}
}
