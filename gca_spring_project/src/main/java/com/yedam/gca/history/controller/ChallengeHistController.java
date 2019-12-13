package com.yedam.gca.history.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.gca.board.vo.BoardSearchVO;
import com.yedam.gca.board.vo.QnaBoardVO;
import com.yedam.gca.common.Paging;
import com.yedam.gca.history.service.ChallengeHistService;
import com.yedam.gca.history.vo.ChallengeHistVO;

@Controller
public class ChallengeHistController {
	
	@Autowired ChallengeHistService service;
	
	///////////////// 수림 ///////////////////////////
	
	//스코어 목록 조회(유저 랭킹 페이지)
	@RequestMapping("history/rank")
	public String getScoreList(ChallengeHistVO vo, Model model, Authentication auth) {
		UserDetails userDetails = (UserDetails) auth.getPrincipal();	//로그인한 유저 정보 담음
		String id = userDetails.getUsername(); 	//로그인한 유저 id 담음
		vo.setM_id(id);
		model.addAttribute("scoreList", service.getScoreList());
		return "/user/history/rank";
	}
	
	
	
	/////////진영
	//챌린지 목록
	 @RequestMapping(value = "history/challengeList") 
	  public String getChallengehtList(Model model,ChallengeHistVO vo)  {
		 UserDetails user = (UserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		// ChallengeHistVO vo = new ChallengeHistVO();
		 vo.setM_id(user.getUsername()); 
		  model.addAttribute("boardList",service.getChallengehtList(vo)); 
		  return "/user/challenge/challenge_his"; 
		  }
	 
	 
	  // ajax목록
	  @ResponseBody
	  @RequestMapping("/ajax/getChallengehtList") 
	  public List<ChallengeHistVO> getChallengehtList(ChallengeHistVO vo) {
		  return service.getChallengehtList(vo);
		  }  
}
