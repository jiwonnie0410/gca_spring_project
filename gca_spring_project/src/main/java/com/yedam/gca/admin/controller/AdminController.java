package com.yedam.gca.admin.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.gca.admin.service.AdminService;

@Controller
public class AdminController {

	@Autowired
	AdminService adminService;

	// 지원
	// 챌린지 관리 페이지
	@RequestMapping("/admin/challenge")
	public String adminChallenge() {
		return "/admin/admin_challenge_list";
	}

	// 매출 페이지
	@RequestMapping("/admin/sale")
	public String adminMoney() {
		return "/admin/admin_bank";
	}

	// 통계 페이지
	@RequestMapping("/admin/chart")
	public String adminChart() {

		return "/admin/admin_chart";
	}

	// 통계 -> 반짝 운동별 통계
	@ResponseBody
	@RequestMapping("/ajax/chart/sgroup")
	public List<Map<String, Object>> chartSgroup() {
		System.out.println(adminService.chartSgroup());
		return adminService.chartSgroup();
	}

	// 통계 -> 동호회 매치 운동별 통계

	// 통계 -> 연령대 및 운동(반짝)성별 통계

	// 통계 -> 지역별 반짝 운동 통계
	@ResponseBody
	@RequestMapping("")
	public List<Map<String, Object>> chartCity(){
		return adminService.chartCity(12, "대구");
	}

}
