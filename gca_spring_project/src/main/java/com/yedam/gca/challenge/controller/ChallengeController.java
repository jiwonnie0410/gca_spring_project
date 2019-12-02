package com.yedam.gca.challenge.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yedam.gca.challenge.service.ChallengeService;

@Controller
public class ChallengeController {
	@Autowired ChallengeService challengeService;
	
	//수림 챌린지 목록 조회
	@RequestMapping("challenge/challengeList")
	public String getChallengeList(Model model) {
		model.addAttribute("challenge", challengeService.getChallengeList());
		return "challenge/challenge";
	}

}
