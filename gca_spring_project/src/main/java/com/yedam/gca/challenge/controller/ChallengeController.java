package com.yedam.gca.challenge.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.gca.challenge.service.ChallengeService;
import com.yedam.gca.challenge.vo.ChallengeVO;
import com.yedam.gca.history.vo.ChallengeHistVO;

@Controller
public class ChallengeController {
	@Autowired ChallengeService service;
	
	///////////////////////////////수림 ////////////////////////////
	//챌린지 목록 조회
	@RequestMapping("challenge/list")
	public String getChallengeList(Model model, HttpSession session) {
		ChallengeHistVO vo = new ChallengeHistVO();
		vo.setM_id("test");
		
		session.setAttribute("id", vo.getM_id());
		
		model.addAttribute("challengeList", service.getChallengeList());
		return "challenge/challenge";
	}
	
	//챌린지 단건 조회
	@RequestMapping("challenge/contents")
	public String getChallenge(@RequestParam(value="num", defaultValue = "", required = true) 
			int num, Model model, ChallengeVO vo ) {
		vo.setCl_num(num);
		model.addAttribute("challenge", service.getChallenge(vo)); 
		
		return "challenge/challengeContents";
	}
	
	//챌린지 참가등록, (챌린지 히스토리에 내역남김) 
	@RequestMapping(value="/challenge/ajax/insertChallenge.json", consumes ="application/json")
	@ResponseBody
	public void insertChallenge(@RequestBody ChallengeHistVO vo) {
		service.insertChallenge(vo);
	}
	
	//스페셜챌린지 결제페이지
	@RequestMapping("challenge/payment")
	public String challengePayment(@RequestParam(value="num", defaultValue="", required = true) 
	int num, Model model, ChallengeVO vo) {
		vo.setCl_num(num);
		model.addAttribute("challenge", service.getChallenge(vo)); 
		
	 return "challenge/challengePayment";
	}
}
