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

import com.yedam.gca.admin.vo.MoneyVO;
import com.yedam.gca.board.vo.BoardSearchVO;
import com.yedam.gca.board.vo.QnaBoardVO;
import com.yedam.gca.challenge.vo.ChallengeVO;
import com.yedam.gca.common.Paging;
import com.yedam.gca.history.service.ChallengeHistService;
import com.yedam.gca.history.vo.ChallengeHistVO;

@Controller
public class ChallengeHistController {
	
	@Autowired ChallengeHistService service;
	
//*********은영
	@RequestMapping(value = "history/myChallengeList") 
	public String myChallengeList(Model model,ChallengeHistVO cvo , MoneyVO mvo)  {
		 UserDetails user = (UserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		 cvo.setM_id(user.getUsername());
		 mvo.setM_id(user.getUsername());
		 //챌린지 히스토리에 뿌려줄 list
		 model.addAttribute("mychallist",service.getMyChallenge(cvo));
		 //챌린지 히스토리에 뿌려줄 내가 낸 보증금
		 model.addAttribute("money",service.getPaidMoney(mvo));
		 return "/user/history/challenge_history";
	}
}
