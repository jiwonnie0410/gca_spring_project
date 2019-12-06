package com.yedam.gca.group_s.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	//전체 반짝 리스트 조회
	@RequestMapping("/sgroup/getSgList")
	public String search(Model model, SGroupVO vo) {
		model.addAttribute("list", service.getSgList(vo));
		System.out.println(service.getSgList(vo));
		return "group_s/s_search";
	}
	
	//선택한 방에 참여
	@RequestMapping("/sgroup/getRoomInfo2")
	public String getRoomInfo(@RequestParam(value="sg_num", defaultValue="", required=true) int sg_num,
			@RequestParam(value="sg_now_cnt", defaultValue="", required=true) int sg_now_cnt,
			Model model, SGroupVO vo) {
		vo.setSg_num(sg_num);
		vo.setSg_now_cnt(sg_now_cnt+1);
		service.updateCnt(vo);
		model.addAttribute("sgroup", service.getRoomInfo(vo));
		return "group_s/s_wating_room";
	}
	
	//반짝 방 참여 전에 실 참여인원 수 조회하기
	@ResponseBody
	@RequestMapping(value="sgroup/sgNowCnt/{sg_num}", method = RequestMethod.GET)
	public SGroupVO sgNowCnt(@PathVariable int sg_num, SGroupVO vo) {
		vo.setSg_num(sg_num);
		return service.getRoomInfo(vo);
	}
	
	//반짝 생성 폼으로 이동
	@RequestMapping("/sgroup/createRoomForm")
	public String createRoomForm() {
		return "group_s/s_search_cre";
	}
}
