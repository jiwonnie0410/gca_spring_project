package com.yedam.gca.history.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yedam.gca.history.service.ActiveHistService;
import com.yedam.gca.history.vo.ActiveHistVO;

@Controller
public class ActiveHistController {
	@Autowired ActiveHistService service;
	
	//*************** 수림 *******************//
	// 스코어 목록 조회(랭킹)
	@RequestMapping("history/activeHistory")
	public String getActiveHistList(Model model, HttpSession session) {
		
		// 임시아이디 세션에 담음
		ActiveHistVO vo = new ActiveHistVO();
		vo.setM_id("test");
		session.setAttribute("id", vo.getM_id());
		
		model.addAttribute("ActiveHistList", service.getActiveHistList());
		return "history/all_history";
	}

}
