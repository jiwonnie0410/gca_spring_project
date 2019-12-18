package com.yedam.gca.member.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.yedam.gca.member.service.MemberService;
import com.yedam.gca.member.vo.MembersVO;



@Controller
public class MembersController {
	
	 private static final Logger logger = LoggerFactory.getLogger(MembersController.class);
	@Autowired
	MemberService memberService;
	
	
	// 1. 정보수정 페이지 이동
		@RequestMapping("member/updateform")
		public String getAlarmInfo() {
			return "/user/member/member_update";
		}
	
	
	
// 01 회원 상세정보 조회
    @RequestMapping("member/member_view.do")
    public String viewMember(Model model)throws Exception{
		UserDetails user = (UserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        // 회원 정보를 model에 저장
        model.addAttribute("dto", memberService.viewMember(user.getUsername()));
       // member_view.jsp로 포워드
       return "/user/member/member_view";
    }
    
    
    
 
    // 02. 회원 정보 수정 처리
    @RequestMapping("member/update")
    public String memberUpdate(@ModelAttribute MembersVO vo, Model model){
        // 비밀번호 체크
        boolean result = memberService.checkPw(vo.getM_id(), vo.getM_password());
        if(result){ // 비밀번호가 일치하면 수정 처리후
           memberService.updateMember(vo);
            return "redirect:/user/member/member_view";
        } else { // 비밀번호가 일치하지 않는다면, div에 불일치 문구 출력, viwe.jsp로 포워드
            model.addAttribute("dto", vo);
            model.addAttribute("message", "비밀번호 불일치");
            return "/user/member/member_update";
       }
        
        
        
   }
    // 03. 회원정보 삭제 처리
    // @RequestMapping : url mapping
    // @RequestParam : get or post방식으로 전달된 변수값
    @RequestMapping("member/delete")
    public String memberDelete(@RequestParam String userId, @RequestParam String userPw, Model model){
        // 비밀번호 체크
        boolean result = memberService.checkPw(userId, userPw);
        if(result){ // 비밀번호가 맞다면 삭제 처리후, 전체 회원 목록으로 리다이렉트
            memberService.deleteMember(userId);
            return "redirect:/member/list.do";
       } else { // 비밀번호가 일치하지 않는다면, div에 불일치 문구 출력, viwe.jsp로 포워드
            model.addAttribute("message", "비밀번호 불일치");
            model.addAttribute("dto", memberService.viewMember(userId));
            return "/notiles/member/member_view";
        }
    }
	

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
