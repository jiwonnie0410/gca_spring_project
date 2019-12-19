package com.yedam.gca.history.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yedam.gca.group_s.service.SGroupService;
import com.yedam.gca.history.service.ScoreHistService;
import com.yedam.gca.history.vo.ScoreHistVO;
import com.yedam.gca.member.vo.MembersVO;

@Controller
public class ScoreHistController {
	
	@Autowired ScoreHistService service;
	@Autowired SGroupService sgroupService;
	
	///////////////// 수림 ///////////////////////////
	
	//1. 스코어 목록 조회(유저 랭킹 페이지)
	@RequestMapping("history/rank")
	public String getRankList(ScoreHistVO vo, Model model, Authentication auth) {
		UserDetails userDetails = (UserDetails) auth.getPrincipal();	//로그인한 유저 정보 담음
		String id = userDetails.getUsername(); 							//로그인한 유저 id 담음
		vo.setM_id(id);
		model.addAttribute("rankList", service.getRankList()); 			//랭킹 리스트 전체정보
		model.addAttribute("myRank", service.getMyRank(vo));	
		return "/user/history/rank";
	}




///////////////// 은영 ///////////////////////////
	//업적 히스토리 조회
	@RequestMapping("history/score")
	public String getMyScore(MembersVO mvo, ScoreHistVO svo, Model model, Authentication auth) {
		//나의 점수 내역 model.addAttribute	
		UserDetails userDetails = (UserDetails) auth.getPrincipal();	//로그인한 유저 정보 담음
		String id = userDetails.getUsername(); 							//로그인한 유저 id 담음
		svo.setM_id(id);
		model.addAttribute("myscorelist", service.getMyScore(svo));	
		
		//레벨이미지 model.addAttribute
		//1)점수 합계 가져오기
		mvo.setM_id(id);
		svo = sgroupService.getMyTotalScore(mvo);
		int score = 0;
		if(svo.getSch_score() != 0) {
			score = svo.getSch_score();
		}
		//2)점수에 따른 레벨 이미지 불러오기
		if(isBetween(score, 0, 29)) { //isBetween함수는 바로 밑에..
			mvo.setM_level_cd("LEVEL1");
		}else if(isBetween(score, 30, 199)) {
			mvo.setM_level_cd("LEVEL2");
		}else if(isBetween(score, 200, 499)) {
			mvo.setM_level_cd("LEVEL3");
		}else if(isBetween(score, 500, 2999)) {
			mvo.setM_level_cd("LEVEL4");
		}else if(isBetween(score, 3000, 9999)) {
			mvo.setM_level_cd("LEVEL5");
		}else if(isBetween(score, 10000, 49999)) {
			mvo.setM_level_cd("LEVEL6");
		}else {
			mvo.setM_level_cd("LEVEL7");
		}
				
		System.out.println("mvo : "+mvo);
		model.addAttribute("mylevel", mvo); //일단 vo로 올려놓고 레벨만 이용.
		
		
		return "/user/history/score_history";
	}
	//between a and b
	public static boolean isBetween(int x, int lower, int upper) {
		return lower <= x && x <= upper;
	}
}
