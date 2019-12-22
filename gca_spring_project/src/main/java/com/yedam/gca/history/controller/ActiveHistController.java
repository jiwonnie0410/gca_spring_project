package com.yedam.gca.history.controller;

import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.gca.history.service.ActiveHistService;
import com.yedam.gca.history.vo.ActiveHistVO;

@Controller
public class ActiveHistController {
	@Autowired ActiveHistService service;
	
	//*************** 수림 *******************//
	// 1. 유저별 활동히스토리 전체목록 탭용
	@RequestMapping("history/activeHistory")
	public String getActiveHistList(Model model, ActiveHistVO vo,Authentication auth) {
		UserDetails userDetails = (UserDetails) auth.getPrincipal();	//로그인한 유저 정보 담음
		String id = userDetails.getUsername(); 	//로그인한 유저 id 담음
		vo.setM_id(id);
		model.addAttribute("activeHistList", service.getActiveHistList(vo));   
		return "/user/history/active_history";
	}
	
	// 2. 유저별 활동 히스토리 달력에 뿌릴 JSON
	@RequestMapping("/ajax/getActiveHistList.json")
	@ResponseBody
	public List<Map> getActiveHistList(ActiveHistVO vo, Authentication auth) {
		UserDetails userDetails = (UserDetails) auth.getPrincipal();	//로그인한 유저 정보 담음
		String id = userDetails.getUsername(); 	//로그인한 유저 id 담음
		vo.setM_id(id);
		return service.getActiveHistList(vo);
	}

	
	// *************  수림 끝 **********************//
	
}
