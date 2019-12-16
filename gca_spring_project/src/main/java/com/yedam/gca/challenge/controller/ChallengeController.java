package com.yedam.gca.challenge.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.gca.admin.vo.MoneyVO;
import com.yedam.gca.challenge.service.ChallengeService;
import com.yedam.gca.challenge.vo.ChallengeVO;
import com.yedam.gca.history.vo.ChallengeHistVO;

@Controller
public class ChallengeController {
	@Autowired ChallengeService service;
	
	///////////////////////////////수림 ////////////////////////////
	// 1. 챌린지 목록 조회
	@RequestMapping("challenge/list")
	public String getChallengeList(Model model, ChallengeHistVO vo, Authentication auth) {		
		// 챌린지 전체목록 불러오기
		model.addAttribute("challengeList", service.getChallengeList());
		// 유저가 참가한 챌린지 기록 불러오기
		UserDetails userDetails = (UserDetails) auth.getPrincipal();	//로그인한 유저 정보 담음
		String id = userDetails.getUsername(); 	//로그인한 유저 id 담음
		vo.setM_id(id);
		model.addAttribute("myHistory", service.checkChallengeHistoryList(vo));
		
		return "/user/challenge/challenge";
	}
	
	//2. 챌린지 단건 조회
	@RequestMapping("challenge/contents")
	public String getChallenge(@RequestParam(value="num", defaultValue = "", required = true) 
			int num, Model model, ChallengeVO vo, ChallengeHistVO hvo, Authentication auth ) {
		// 유저가 클릭한 챌린지 단건의 상세정보 불러옴
		vo.setCl_num(num);
		model.addAttribute("challenge", service.getChallenge(vo)); 
		
		// 유저가 참가한 챌린지 기록 불러오기
		UserDetails userDetails = (UserDetails) auth.getPrincipal();	//로그인한 유저 정보 담음
		String id = userDetails.getUsername(); 	//로그인한 유저 id 담음
		hvo.setM_id(id);
		hvo.setCl_num(num);
		model.addAttribute("myHistory", service.checkChallengeHistory(hvo));
		
		return "/user/challenge/challengeContents";
	}
	
	
	// 3.챌린지 참가등록, (챌린지 히스토리에 내역남김) 
	@RequestMapping(value="/challenge/ajax/insertChallenge.json", consumes ="application/json")
	@ResponseBody
	public void insertChallenge(@RequestBody ChallengeHistVO vo) {
		service.insertChallenge(vo);
	}
	
	// 4. 스페셜챌린지 결제페이지
	@RequestMapping("challenge/payment")
	public String challengePayment(@RequestParam(value="num", defaultValue="", required = true) 
	int num, Model model, ChallengeVO vo) {
		// 결제페이지 출력용
		vo.setCl_num(num);
		model.addAttribute("challenge", service.getChallenge(vo)); 
		
	 return "/user/challenge/challengePayment";
	}
	
	// 5. 스페셜챌린지 결제시 Money테이블에 정보 저장
	@RequestMapping(value="/challenge/ajax/insertMoney.json", consumes ="application/json" )
	@ResponseBody
	public void insertMoney(@RequestBody MoneyVO vo) {
		service.insertMoney(vo);
	}
	
	
}
