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
import com.yedam.gca.challenge.vo.ChallengeVO;
import com.yedam.gca.common.Paging;
import com.yedam.gca.history.service.ChallengeHistService;
import com.yedam.gca.history.vo.ChallengeHistVO;

@Controller
public class ChallengeHistController {
	
	@Autowired ChallengeHistService service;
	
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
	  
	  
	  
	  
	  
//*********은영
	  @RequestMapping(value = "history/myChallengeList") 
	  public String myChallengeList(Model model,ChallengeHistVO vo)  {
		  	UserDetails user = (UserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		  	vo.setM_id(user.getUsername());
		  	List<ChallengeVO> cvo = service.getMyChallenge(vo);
		  	System.out.println(cvo);
		  	model.addAttribute("mychallist",service.getMyChallenge(vo)); 
		  	return "/user/history/challenge_history_noTemplet"; 
	  }
}
