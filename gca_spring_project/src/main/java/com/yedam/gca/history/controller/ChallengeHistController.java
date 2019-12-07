package com.yedam.gca.history.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yedam.gca.history.service.ChallengeHistService;
import com.yedam.gca.history.vo.ChallengeHistVO;

@Controller
public class ChallengeHistController {
	
	@Autowired ChallengeHistService service;
	
	///////////////// 수림 ///////////////////////////
	
	//스코어 목록 조회(랭킹)
	@RequestMapping("rank")
	public String getScoreList(Model model, HttpSession session) {
		ChallengeHistVO vo = new ChallengeHistVO();
		vo.setM_id("test");
		session.setAttribute("id", vo.getM_id());
		
		model.addAttribute("scoreList", service.getScoreList());
		return "history/score_history";
		
		
	}
}
