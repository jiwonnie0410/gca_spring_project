package com.yedam.gca.group_s.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yedam.gca.group_s.service.SGroupService;
import com.yedam.gca.group_s.vo.SGroupVO;

@Controller
public class SGroupController {
	
	@Autowired
	SGroupService service;
	
	
	//은영
	@RequestMapping("/group_s/getRoomInfo")
	public String getRoomInfo(Model model, SGroupVO vo) {
		model.addAttribute("sgroup", service.getRoomInfo(vo));
		return "group_s/getRoomInfo";
	}
	
	//미현
	
}
