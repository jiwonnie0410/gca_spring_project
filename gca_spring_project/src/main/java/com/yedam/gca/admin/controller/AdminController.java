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
	// 관리자 챌린지 관리
	@RequestMapping("/admin/challenge")
	public String adminChallenge() {
		return "/admin/admin_challenge_list";
	}

	// 관리자 통계관리/매출
	@RequestMapping("/admin/sale")
	public String adminMoney() {
		return "/admin/admin_bank";
	}

	// 관리자 통계관리/통계
	@RequestMapping("/admin/chart")
	public String adminChart() {
		
		return "/admin/admin_chart";
	}

	// 관리자 통계관리/통계/반짝운동별 통계
	@ResponseBody
	@RequestMapping("/ajax/chart/sgroup")
	public List<Map<String, Object>> chartSgroup() {
		System.out.println(adminService.chartSgroup());
		return adminService.chartSgroup();
	}

}
