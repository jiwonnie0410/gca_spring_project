package com.yedam.gca.admin.controller;

import java.util.Collections;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.gca.admin.service.MembersService;
import com.yedam.gca.member.vo.MembersVO;



@Controller
public class MembersController {
	@Autowired
	MembersService membersService;
	
	
	
	
	
	
//	
//	// 03 회원 상세정보 조회
//    @RequestMapping("member/view.do")
//    public String memberView(@RequestParam String userId, Model model){
//        // 회원 정보를 model에 저장
//        model.addAttribute("dto", memberService.viewMember(userId));
//        //System.out.println("클릭한 아이디 확인 : "+userId);
//        logger.info("클릭한 아이디 : "+userId);
//        // member_view.jsp로 포워드
//        return "member/member_view";
//    }
//    // 04. 회원 정보 수정 처리
//    @RequestMapping("member/update.do")
//    public String memberUpdate(@ModelAttribute MemberVO vo, Model model){
//        // 비밀번호 체크
//        boolean result = memberService.checkPw(vo.getUserId(), vo.getUserPw());
//        if(result){ // 비밀번호가 일치하면 수정 처리후, 전체 회원 목록으로 리다이렉트
//            memberService.updateMember(vo);
//            return "redirect:/member/list.do";
//        } else { // 비밀번호가 일치하지 않는다면, div에 불일치 문구 출력, viwe.jsp로 포워드
//            // 가입일자, 수정일자 저장
//            MemberVO vo2 = memberService.viewMember(vo.getUserId());
//            vo.setUserRegdate(vo2.getUserRegdate());
//            vo.setUserUpdatedate(vo2.getUserUpdatedate());
//            model.addAttribute("dto", vo);
//            model.addAttribute("message", "비밀번호 불일치");
//            return "member/member_view";
//        }
//        
//    }
//    // 05. 회원정보 삭제 처리
//    // @RequestMapping : url mapping
//    // @RequestParam : get or post방식으로 전달된 변수값
//    @RequestMapping("member/delete.do")
//    public String memberDelete(@RequestParam String userId, @RequestParam String userPw, Model model){
//        // 비밀번호 체크
//        boolean result = memberService.checkPw(userId, userPw);
//        if(result){ // 비밀번호가 맞다면 삭제 처리후, 전체 회원 목록으로 리다이렉트
//            memberService.deleteMember(userId);
//            return "redirect:/member/list.do";
//        } else { // 비밀번호가 일치하지 않는다면, div에 불일치 문구 출력, viwe.jsp로 포워드
//            model.addAttribute("message", "비밀번호 불일치");
//            model.addAttribute("dto", memberService.viewMember(userId));
//            return "member/member_view";
//        }
//    }
//	
//	
//	
//	
//	
//	
}
