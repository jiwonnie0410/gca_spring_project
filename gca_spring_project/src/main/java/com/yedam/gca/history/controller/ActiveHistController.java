package com.yedam.gca.history.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.gca.group_s.vo.SGroupVO;
import com.yedam.gca.history.service.ActiveHistService;
import com.yedam.gca.history.vo.ActiveHistVO;

@Controller
public class ActiveHistController {
	@Autowired ActiveHistService service;
	
	//*************** 수림 *******************//
	// 유저별 활동히스토리 목록 조회
	@RequestMapping("history/activeHistory")
	public String getActiveHistList(Model model, HttpSession session) {
		
		// 임시아이디 세션에 담음
		ActiveHistVO vo = new ActiveHistVO();
		vo.setM_id("test");
		session.setAttribute("id", vo.getM_id());
		
		model.addAttribute("activeHistList", service.getActiveHistList(vo));   
		return "/user/history/active_history";
	}
	
	@RequestMapping("/ajax/getSGroup.json")
	@ResponseBody
	public SGroupVO getSgroup(SGroupVO vo) {
		vo.setSg_num(1);
		service.getSgroup(vo);
		
		return vo;
	}
	
	// *************  수림 끝 **********************//

}
