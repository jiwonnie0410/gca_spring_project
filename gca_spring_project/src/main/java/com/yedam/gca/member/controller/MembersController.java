package com.yedam.gca.member.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.yedam.gca.member.service.MemberService;
import com.yedam.gca.member.vo.MembersVO;



@Controller
public class MembersController {
	
	 private static final Logger logger = LoggerFactory.getLogger(MembersController.class);
	@Autowired
	MemberService memberService;
	
	
//	// 1. 정보수정 페이지 이동
//		@RequestMapping("member/updateform")
//		public String updateform() {
//			return "/user/member/member_update";
//		}
//		
		
		// 정보수정 페이지 이동
	    @RequestMapping("member/updateform")
	    public String updateform(Model model)throws Exception{
			UserDetails user = (UserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	        // 회원 정보를 model에 저장
	        model.addAttribute("dto", memberService.viewMember(user.getUsername()));
	       // member_view.jsp로 포워드
	        return "/user/member/member_update";
	    }
	
	
	
// 01 회원 상세정보 조회
    @RequestMapping("member/member_view.do")
    public String viewMember(Model model)throws Exception{
		UserDetails user = (UserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        
		// 회원 정보를 model에 저장
        model.addAttribute("dto", memberService.viewMember(user.getUsername()));
        // 현재까지 자신이 쌓은 포인트 (지원 추가)
        model.addAttribute("score", memberService.getScore(user.getUsername()));
        // 현재까지 자신이 쓴 글 갯수 (지원 추가)
//        model.addAttribute("count", memberService.getBoardCount(user.getUsername()));
        
        // member_view.jsp로 포워드
       return "/user/member/profile";
    }
    
    
    
 
    // 02. 회원 정보 수정 처리
    @RequestMapping("member/update")
    public String memberUpdate(@ModelAttribute MembersVO vo, Model model){
           memberService.updateMember(vo);
           //회원정보 받아오기
           UserDetails user = (UserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
           // 회원 정보를 model에 저장
	        model.addAttribute("dto", memberService.viewMember(user.getUsername()));
           return "/user/member/profile";
   }
    
    
//    @RequestMapping("member/update")
//    public String memberUpdate(@ModelAttribute MembersVO vo, Model model, RedirectAttributes rttr) throws Exception{
//           memberService.updateMember(vo);
//       	rttr.addFlashAttribute("msg", "회원정보 수정 완료");
//           return "redirect:/user/member/member_view";
//   }
    
    
    // 03. 회원정보 삭제 처리
    // @RequestMapping : url mapping
    // @RequestParam : get or post방식으로 전달된 변수값
    @RequestMapping("member/delete")
    public String memberDelete(@RequestParam String userId, @RequestParam String userPw, Model model, MembersVO vo){
    	// 비밀번호 체크
		boolean result = memberService.checkPw(vo.getM_id(), vo.getM_password()); 
		/* boolean passMatch = passEncoder.matches(vo.getM_id(), vo.getM_password()); */
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
