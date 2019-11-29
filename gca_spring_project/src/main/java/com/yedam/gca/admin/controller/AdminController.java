package com.yedam.gca.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	
	// 지원 관리자 챌린지 관리
	@RequestMapping("/admin/challenge")
	public String adminChallenge() {
		return "/admin/admin_challenge_list";
	}

	// 지원 관리자 통계관리/매출
	@RequestMapping("/admin/sale")
	public String adminMoney() {
		return "/admin/admin_bank";
	}
	
	// 지원 관리자 통계관리/통계
	@RequestMapping("/admin/chart")
	public String adminChart() {
		return "/admin/admin_chart";
	}
}
