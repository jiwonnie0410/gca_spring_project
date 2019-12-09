package com.yedam.gca.admin.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.gca.admin.service.AdminService;
import com.yedam.gca.challenge.vo.ChallengeVO;

@Controller
public class AdminController {
// 1-1챌린지 관리 페이지		1-2챌린지 등록
// 2매출 페이지
// 3-1통계 페이지 	3-2반짝 운동별 통계 	3-3동호회 매치 운동별 통계 	 3-4연령대 및 운동(반짝)성별 통계 	3-5지역별 반짝 운동 통계
	
	@Autowired AdminService adminService;

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
	public List<Map<String, Object>> chartBgroup(){
		return adminService.chartBgroup();
	}

	// 3-4. 통계 -> 연령대 및 운동(반짝)성별 통계

	// 3-5. 통계 -> 지역별 반짝 운동 통계
	@ResponseBody
	@RequestMapping("")
	public List<Map<String, Object>> chartCity(){
		System.out.println("대구 12월: " + adminService.chartCity(12, "대구"));
		System.out.println("대구 11월: " + adminService.chartCity(11, "대구"));
		
		return adminService.chartCity(12, "대구");
	}

}
