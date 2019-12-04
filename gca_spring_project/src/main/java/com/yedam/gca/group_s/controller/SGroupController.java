package com.yedam.gca.group_s.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.yedam.gca.group_s.service.SGroupService;
import com.yedam.gca.group_s.vo.SGroupVO;

@Controller
public class SGroupController {
	
	@Autowired
	SGroupService service;
	
	
	//은영
	@RequestMapping("/sgroup/getRoomInfo")
	public String getRoomInfo(Model model, SGroupVO vo) {
		model.addAttribute("sgroup", service.getRoomInfo(vo));
		System.out.println(model);
		return "group_s/s_wating_room";
	}
	
	//미현
	@RequestMapping("/sgroup/getRoomInfo2")
	public String getRoomInfo(@RequestParam(value="sg_num", defaultValue="", required=true) int sg_num,
			@RequestParam(value="sg_now_cnt", defaultValue="", required=true) int sg_now_cnt,
			Model model, SGroupVO vo) {
		vo.setSg_num(sg_num);
		vo.setSg_now_cnt(sg_now_cnt+1);
		model.addAttribute("sgroup", service.getRoomInfo(vo));
		return "group_s/s_wating_room";
	}
	
	
	@RequestMapping("/sgroup/getSgList")
	public String search(Model model, SGroupVO vo) {
		model.addAttribute("list", service.getSgList(vo));
		System.out.println(service.getSgList(vo));
		return "group_s/s_search";
	}
}
