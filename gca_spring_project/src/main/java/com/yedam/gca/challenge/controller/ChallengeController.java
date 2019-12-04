package com.yedam.gca.challenge.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.yedam.gca.challenge.service.ChallengeService;
import com.yedam.gca.challenge.vo.ChallengeVO;

@Controller
public class ChallengeController {
	@Autowired ChallengeService service;
	
	//수림 챌린지 목록 조회
	@RequestMapping("challenge/list")
	public String getChallengeList(Model model) {
		model.addAttribute("challengeList", service.getChallengeList());
		
		return "challenge/challenge";
	}
	@RequestMapping("challenge/contents")
	public String getChallenge(@RequestParam(value="cl_num", defaultValue = "", required = true) 
			int cl_num, Model model, ChallengeVO vo ) {
		vo.setCl_num(cl_num);
		model.addAttribute("challenge", service.getChallenge(vo)); 
		
		return "challenge/challengeContents";
	}

}
