package com.yedam.gca.admin.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.gca.admin.service.AdminService;
import com.yedam.gca.admin.service.MembersService;
import com.yedam.gca.challenge.vo.ChallengeVO;
import com.yedam.gca.member.vo.MembersVO;

@Controller
public class AdminController {
// 1-1챌린지 관리 페이지		1-2챌린지 등록
// 2매출 페이지
// 3-1통계 페이지 	3-2반짝 운동별 통계 	3-3동호회 매치 운동별 통계 	 3-4연령대 및 운동(반짝)성별 통계 	3-5지역별 반짝 운동 통계

	@Autowired
	AdminService adminService;

	@Autowired
	MembersService membersService;

	// 지원
	// 1-1. 챌린지 관리 페이지
	@RequestMapping("/admin/challenge")
	public String adminChallenge() {
		return "/admin/admin_challenge_list";
	}

	// 1-2. 챌린지 등록
	@ResponseBody
	@RequestMapping("/ajax/createChallenge")
	public String createChallenge(HttpServletRequest request, ChallengeVO vo) {
		request.getParameter(""); // 이런 식으로 vo에다 담기 -> 그러려면 jsp에 name 바꿔야 함
		return adminService.createChallenge(vo);
	}

	// 2. 매출 페이지
	@RequestMapping("/admin/sale")
	public String adminMoney() {
		return "/admin/admin_bank";
	}

	// 3-1. 통계 페이지
	@RequestMapping("/admin/chart")
	public String adminChart() {

		return "/admin/admin_chart";
	}

	// 3-2. 통계 -> 반짝 운동별 통계
	@ResponseBody
	@RequestMapping("/ajax/chart/sgroup")
	public List<Map<String, Object>> chartSgroup() {
		return adminService.chartSgroup();
	}

	// 3-3. 통계 -> 동호회 매치 운동별 통계
	@ResponseBody
	@RequestMapping("/ajax/chart/bgroup")
	public List<Map<String, Object>> chartBgroup() {
		return adminService.chartBgroup();
	}

	// 3-4. 통계 -> 연령대 및 운동(반짝)성별 통계
	@ResponseBody
	@RequestMapping("/ajax/chart/gender")
	public List<Map<String, Object>> chartGender() {
		return adminService.chartGender("G01", 20, 29);
	}

	// 3-5. 통계 -> 지역별 반짝 운동 통계
	@ResponseBody
	@RequestMapping("/ajax/chart/city")
	public List<Map<String, Object>> chartCity() {
//		Calendar calendar = new GregorianCalendar(Locale.KOREA);
//		String nowMonth = Integer.toString(calendar.get(Calendar.MONTH) + 1); 	// 현재 달
//		String oneMonth, twoMonth, threeMonth;									// 한달전, 두달전, 세달전
//		
//		// 만약 구하려는 달이 10월 전이라면 쿼리에는 09 08 07월로 들어가야 하기 때문에 문자열로 앞에 0을 붙여줌
//		// 현재 달
//		if((calendar.get(Calendar.MONTH)+1) < 10) {	nowMonth = "0".concat(Integer.toString(calendar.get(Calendar.MONTH) + 1)); }
//		else nowMonth = Integer.toString(calendar.get(Calendar.MONTH) + 1);
//		// 한달 전
//		if((calendar.get(Calendar.MONTH)) < 10) {	oneMonth = "0".concat(Integer.toString(calendar.get(Calendar.MONTH))); }
//		else oneMonth = Integer.toString(calendar.get(Calendar.MONTH));
//		// 두 달 전
//		if((calendar.get(Calendar.MONTH)-1) < 10) {	twoMonth = "0".concat(Integer.toString(calendar.get(Calendar.MONTH) - 1)); }
//		else twoMonth = Integer.toString(calendar.get(Calendar.MONTH) - 1);
//		// 세 달 전
//		if((calendar.get(Calendar.MONTH)-2) < 10) {	threeMonth = "0".concat(Integer.toString(calendar.get(Calendar.MONTH) - 2)); }
//		else threeMonth = Integer.toString(calendar.get(Calendar.MONTH) - 2);

//		for(int i=(Integer.parseInt(startMonth)); i<=Integer.parseInt(nowMonth); i++) {
//			adminService.chartCity(startMonth, "대구");
//		}

		return adminService.chartCity("12", "대구");
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 진영

	@RequestMapping("getUserList.do")
	public String getUserList1(Model model, MembersVO vo) {
		model.addAttribute("userList", membersService.getUserList(vo));
		return "/admin/userList";
	}

	@RequestMapping("getUser.do")
	public String getUser(Model model, MembersVO vo) {
		model.addAttribute("userSelect", membersService.getUser(vo));
		return "admin/user";
	}

	// 전체조회
	@ResponseBody
	@RequestMapping(value = "/members", method = RequestMethod.GET)
	public List<MembersVO> getUserList(Model model, MembersVO vo) {
		return membersService.getUserList(vo);
	}

	// 단건조회
	@ResponseBody
	@RequestMapping(value = "/members/{m_id}", method = RequestMethod.GET)
	public MembersVO getUser(@PathVariable String m_id, MembersVO vo, Model model) {
		vo.setM_id(m_id);
		return membersService.getUser(vo);
	}

	// 관리자 유저 삭제
	@ResponseBody
	@RequestMapping(value = "/members/{m_id}", method = RequestMethod.DELETE)
	public String deleteUser(@PathVariable String m_id, MembersVO vo) {
		vo.setM_id(m_id);
		membersService.deleteUser(vo);
		return m_id;
	}

	// 수정
//	@ResponseBody
//	@RequestMapping(value="/members"
//			,method=RequestMethod.PUT
//	//		,produces="application/json"      //응답헤더
//	 		,consumes="application/json"      //요청헤더
//     //       ,headers = {"Content-type=application/json" }
//	)
//	public MembersVO updateUser(@RequestBody MembersVO vo, Model model) {
//		membersService.updateUser(vo);
//		return  vo;
//	}

}
