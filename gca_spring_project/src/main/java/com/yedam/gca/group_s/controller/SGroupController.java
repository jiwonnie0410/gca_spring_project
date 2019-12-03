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
		System.out.println(service.getRoomInfo(vo));
		return "group_s/s_wating_room";
	}
	
	//미현
	@RequestMapping("/sgroup/getSgList")
	public String search(Model model, SGroupVO vo) {
		model.addAttribute("list", service.getSgList(vo));
		System.out.println(service.getSgList(vo));
		return "group_s/s_search";
	}
}
