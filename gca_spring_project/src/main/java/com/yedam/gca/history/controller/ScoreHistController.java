package com.yedam.gca.history.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yedam.gca.history.service.ScoreHistService;
import com.yedam.gca.history.vo.ScoreHistVO;

@Controller
public class ScoreHistController {
	
	@Autowired ScoreHistService service;
	
	///////////////// 수림 ///////////////////////////
	
	//1. 스코어 목록 조회(유저 랭킹 페이지)
	@RequestMapping("history/rank")
	public String getRankList(ScoreHistVO vo, Model model, Authentication auth) {
		UserDetails userDetails = (UserDetails) auth.getPrincipal();	//로그인한 유저 정보 담음
		String id = userDetails.getUsername(); 	//로그인한 유저 id 담음
		vo.setM_id(id);
		
		System.out.println(vo.getM_id() + "!check");
		model.addAttribute("rankList", service.getRankList()); //랭킹 리스트 전체정보
		//model.addAttribute("myRank", service.getMyRank(vo));	//!로그인 유저 랭킹 정보  + 매퍼에 vo안넘어감 체크필요
		return "/user/history/rank";
	}
	

}
