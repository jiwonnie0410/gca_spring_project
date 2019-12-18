package com.yedam.gca.member.controller;

import java.io.IOException;
import java.text.Normalizer;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
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
import com.yedam.gca.member.vo.MembersVO;

@Controller
public class LoginController {

	@Autowired
	MemberService memberService;
	private String apiResult = null;

	// 지원
	// 1. 첫 로그인 페이지 (홈페이지 열자마자 보이는 화면)
	@RequestMapping(value = "/", method = { RequestMethod.GET, RequestMethod.POST })
	public String home(Locale locale, Model model, HttpSession session) {
		// 네이버 아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출
		MembersVO vo = new MembersVO();
		String naverAuthUrl = vo.getAuthorizationUrl(session);
		model.addAttribute("url", naverAuthUrl);
		
		return "/notiles/member/login";
	}

	// 2-1. 네이버 아이디로 로그인 성공 시에 돌아올 페이지 -> 반짝 방 리스트로 감
	@RequestMapping(value = "/login/naverCallback", method = { RequestMethod.GET, RequestMethod.POST })
	public String naverCallback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws IOException, ParseException {
		MembersVO vo = new MembersVO();
		OAuth2AccessToken oauthToken;
		oauthToken = vo.getAccessToken(session, code, state);
		
		// 1. 로그인 사용자 정보를 읽어온다.
		apiResult = vo.getUserProfile(oauthToken); // String형식의 json데이터
		System.out.println("여기는 콜백의 apiResult::: " + apiResult);
		// "id":"76298500","age":"20-29","gender":"F","email":"je708@naver.com","name":"\ubc15\uc9c0\uc6d0","birthday":"04-10"
		
		// 2. String형식인 apiResult를 json 형태로 바꿈
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;
		
		// 3. 데이터 파싱 후 vo에 set
		JSONObject response_obj = (JSONObject) jsonObj.get("response");
		
		String range = (String) response_obj.get("age");
		String gender;
		if(((String) response_obj.get("gender")).equals("F"))	// 성별이 여자면
			gender = "G01";
		else	// 성별이 남자면
			gender = "G02";
		String strangeName = (String) response_obj.get("name");							// 유니코드 이름
		String normalName = Normalizer.normalize(strangeName, Normalizer.Form.NFC);		// 유니코드를 한글로 변환
		
		vo.setM_id((String) response_obj.get("id"));
		vo.setM_age(range.substring(0, 2));
		vo.setGender_cd(gender);
		vo.setM_email((String) response_obj.get("email"));
		vo.setM_name(normalName);
		
		// insert 후에 조회를 해서 다시 가져오지 않기 때문에 여기서 값을 넣은 후 밑에서 세션에 저장을 해야 다른 페이지에서 세션 값으로 쓸 수 있음
		vo.setM_grant("ROLE_User");
		vo.setM_xy("35.8706757862181, 128.58944433619843");
		vo.setM_status_cd("M01");
		
		// 4. 파싱한 정보가 DB에 있는지 확인하고 없으면 DB에 insert -> 계정 상태까지 체크하고 리턴
		String mStatus = memberService.insertNaver(vo);
		
		// 5. security에 setContext으로 값을 담아줌
		SecurityContextHolder.getContext().setAuthentication(new UsernamePasswordAuthenticationToken(vo, null, vo.getAuthorities()));
		
		// 6. 활동정지 당한 회원인지 구분해서 페이지 리턴
		if(mStatus.equals("M01")) {
			return "redirect:/sgroup/getSgList";
		} else {
			return "/notiles/alert/block";
		}
	}
	
	// 2-2. 로그아웃
	@RequestMapping("/logout")
	public String logout() {
//		SecurityContextHolder.getContext().setAuthentication(new UsernamePasswordAuthenticationToken(null, null, null));
		return "/notiles/member/login";
	}
	
	// 3. security에서 로그인 후 유저와 관리자가 돌아갈 페이지 따로 설정
	@RequestMapping("/login/callback")
	public String callback(HttpServletRequest request, Model model) {
		// security 통해서 로그인한 사람의 정보 가져오기
		MembersVO memInfo = (MembersVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String mStatus = memInfo.getM_status_cd();

		// 권한과 활동 상태에 따라 페이지 다르게 리턴
		if (request.isUserInRole("ROLE_Admin")) { 									// 관리자가 로그인 하면 차트 페이지로 넘어감
			return "redirect:/admin/chart";
		} else if (request.isUserInRole("ROLE_User") && mStatus.equals("M02")) { 	// 활동 정지 상태인 유저면
			return "redirect:/alert/block"; 										// 메시지 띄우는 페이지로 넘어간 다음 홍보게시판 감
		} else { 																	// 일반 사용자가 로그인 하면 반짝 목록 페이지로 넘어감
			return "redirect:/sgroup/getSgList";
		}
	}

	// 4. 활동정지인 사람들 alert 띄우는 페이지
	@RequestMapping("alert/block")
	public String block() {
		return "/notiles/member/blockId";
	}

	// 5. 회원가입 페이지
	@RequestMapping("/join")
	public String join() {
		return "/notiles/member/join";
	}

	// 6. 회원가입 하기 (디비에 삽입) -> 회원가입 성공 시에 제일 첫 로그인 페이지로 감
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

	// 7. 아이디 중복 확인
	@ResponseBody
	@RequestMapping("/ajax/checkId")
	public int checkId(String id) {
		return memberService.checkId(id);
	}

	// 8. 아이디 찾기 페이지
	@RequestMapping("/forgotId")
	public String forgotId(HttpServletRequest request) {
		return "/notiles/member/forgotId";
	}

	// 9. 이메일로 아이디 보내기
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

	// 10. 비밀번호 찾기 페이지
	@RequestMapping("/forgotPassword")
	public String forgotPw() {
		return "/notiles/member/forgotPw";
	}

	// 11. 이메일로 임시 비밀번호 보내기
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

	// 12. 비밀번호 변경 페이지
	@RequestMapping("/member/changePassword")
	public String changePassword() {
		return "/user/member/changePassword";
	}

	// 13. 비밀번호 변경
	@RequestMapping("/member/updatePassword")
	public String updatePassword(MembersVO vo, Model model) {
		// 비밀번호 변경 성공 및 실패에 따라 각각 다른 페이지로 리턴
		Map<String, Object> map = memberService.changePw(vo);
		boolean flag = (boolean) map.get("flag");
		if (flag == false) { // 실패했을 때
			model.addAttribute("pwMessage", map.get("message")); // jsp 페이지에서 alert로 띄울 메시지 넘기기
			return "/user/member/changePassword";
		} else { // 성공했을 때
			model.addAttribute("pwMessage", map.get("message"));
			return "/user/member/member_view";
		}
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
