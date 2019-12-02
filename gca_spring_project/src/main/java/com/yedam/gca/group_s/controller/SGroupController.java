package com.yedam.gca.group_s.controller;

import org.springframework.web.bind.annotation.RequestMapping;

public class SGroupController {
	@RequestMapping("/group_s/getRoomInfo")
	public String getRoomInfo() {
		return "group_s/getRoomInfo";
	}
}
