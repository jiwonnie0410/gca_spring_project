package com.yedam.gca.group_six.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.gca.common.code.service.CodeService;
import com.yedam.gca.common.code.vo.CodeVO;
import com.yedam.gca.group_six.service.SixmanService;
import com.yedam.gca.group_six.vo.SixmanVO;
import com.yedam.gca.history.service.ActiveHistService;
import com.yedam.gca.history.vo.ActiveHistVO;
import com.yedam.gca.member.vo.MembersVO;

@Controller
public class SixmanController {
	
	@Autowired	SixmanService sixmanService;
	@Autowired	CodeService codeService;
	@Autowired	ActiveHistService actService;
	
	
//*****************************************은영************************************

	


//*****************************************미현************************************
	
	
	//전체 용병 모집 리스트 조회
	@RequestMapping(value="/sixman/getSixList")
	public String search(Model model, SixmanVO vo, CodeVO cvo) {
		MembersVO memInfo = (MembersVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();//세션 정보 갖고 오기
		vo.setM_xy(memInfo.getM_xy());
		
		vo.setScroll_rec(3); //조회할 레코드 수(직접 입력)
		model.addAttribute("sixman", vo);
		model.addAttribute("list", sixmanService.getSixList(vo));
		
		//sports2와 관련된 code정보 모두 보내기
		cvo.setCd_group("SPORTS2_CD");
		model.addAttribute("sports_list", codeService.getCodeList(cvo));
		
		if(vo.getEnd_dis() == null) {
			return "/user/group_six/six_search";			
		} else {
			return "/notiles/group_six/six_search_temp";
		}
	}
	
	//마감 용병 모집 리스트 조회
	@RequestMapping(value="/sixman/getSixListEnd")
	public String searchEnd(SixmanVO vo, CodeVO cvo, Model model) {
		MembersVO memInfo = (MembersVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();//세션 정보 갖고 오기
		vo.setM_xy(memInfo.getM_xy());
		
		vo.setScroll_rec(3); //조회할 레코드 수(직접 입력)
		model.addAttribute("sixman", vo);
		model.addAttribute("list", sixmanService.getSixEndList(vo));
		
		//sports2와 관련된 code정보 모두 보내기
		cvo.setCd_group("SPORTS2_CD");
		model.addAttribute("sports_list", codeService.getCodeList(cvo));
		
		if(vo.getEnd_dis() == null) {
			return "/user/group_six/six_end_room";
		} else {
			return "/notiles/group_six/six_end_temp";
		}
	}
	
	//용병 모집 방 참여 전에  참여 여부 확인 + 마감 인원 파악
	@ResponseBody
	@RequestMapping(value="/sixman/sixValidIn/{six_num}", method = RequestMethod.GET)
	public ActiveHistVO sixValidIn(@PathVariable int six_num, ActiveHistVO vo, CodeVO cvo) {
		MembersVO memInfo = (MembersVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal(); //세션 정보 갖고 오기
		vo.setM_id(memInfo.getM_id());
		
		vo.setIn_type("six"); //sg:반짝방, bg:매치방, six:용병방(직접 입력)
		vo.setPk_num(six_num);
		actService.validIn(vo);
		return vo;
	}
	
	//선택한 방에 참여1) - 이미 참여되어 있는 방에 참여
	@RequestMapping("/sixman/alreadyIn")
	public String alreadyIn(
			@RequestParam(value="six_num", defaultValue="", required=true) int six_num,
			Model model, SixmanVO vo, ActiveHistVO avo, CodeVO cvo) {
		vo.setSix_num(six_num);
		model.addAttribute("sixman", sixmanService.getRoomInfo(vo));
		
		//참여 인원 정보를 채팅방으로 넘김
		avo.setSix_num(six_num);
		model.addAttribute("memlist", actService.getActMemList(avo));
		return "/user/group_six/six_wating_room";
	}
	
	//선택한 방에 참여2)- 참여되어 있지 않은 방에 참여
	@RequestMapping("/sixman/roomIn")
	public String roomIn(
			@RequestParam(value="six_num", defaultValue="", required=true) int six_num,
			Model model, SixmanVO vo, ActiveHistVO avo, CodeVO cvo) {
		MembersVO memInfo = (MembersVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal(); //세션 정보 갖고 오기
		avo.setM_id(memInfo.getM_id());
		
		avo.setIn_type("six"); //sg:반짝방, bg:매치방, six:용병방(직접 입력)
		avo.setPk_num(six_num);
		actService.roomInsert(avo);
		
		return "redirect:alreadyIn?six_num="+avo.getSix_num()
								+ "&first_in=first_in"; //새로 참여하는 경우임을 구분하기 위해 보내는 잉여값. 
									//alreadyIn에서 다른 처리작업을 할 필요 없이 값이 그대로 넘어감
	}

	
	//용병 모집 생성 폼으로 이동
	@RequestMapping("/sixman/createRoomForm")
	public String createRoomForm(Model model, CodeVO vo) {
		vo.setCd_group("SPORTS2_CD");
		model.addAttribute("sports_list", codeService.getCodeList(vo));
		vo.setCd_group("SKILL_CD");
		model.addAttribute("skill_list", codeService.getCodeList(vo));
		vo.setCd_group("GENDER_CD");
		model.addAttribute("gender_list", codeService.getCodeList(vo));
		return "/user/group_b/b_room_cre";
	}
	
	//방 생성
	@RequestMapping(value="/sixman/creRoom", method=RequestMethod.POST)
	public String createRoom(@ModelAttribute SixmanVO vo) {
		MembersVO memInfo = (MembersVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal(); //세션 정보 갖고 오기
		vo.setM_id(memInfo.getM_id());
		
		sixmanService.insertSix(vo);
		return "redirect:alreadyIn?six_num="+vo.getSix_num();
	}
	
	//전체 용병 모집+마감 용병 모집 리스트 조회(미사용중)
	@RequestMapping(value="/sixman/getSixList/{whatroom}")
	public String search(@PathVariable String whatroom, Model model, SixmanVO vo, CodeVO cvo) {
		MembersVO memInfo = (MembersVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();//세션 정보 갖고 오기
		vo.setM_xy(memInfo.getM_xy());
		
		vo.setScroll_rec(3); //조회할 레코드 수(직접 입력)
		model.addAttribute("sixman", vo);
		if(whatroom == "default") 	model.addAttribute("list", sixmanService.getSixList(vo));
		else if(whatroom == "end") 	model.addAttribute("list", sixmanService.getSixEndList(vo));
		
		//sports2와 관련된 code정보 모두 보내기
		cvo.setCd_group("SPORTS2_CD");
		model.addAttribute("sports_list", codeService.getCodeList(cvo));
		
		String viewsrc = null;
		if(whatroom == "default") {
			if(vo.getEnd_dis() == null) viewsrc = "/user/group_b/b_search";
			else viewsrc = "/notiles/group_six/six_search_temp";
		} else if(whatroom == "end") {
			if(vo.getEnd_dis() == null) viewsrc = "/user/group_b/b_end_room";
			else viewsrc = "/notiles/group_six/six_end_temp";
		}
		return viewsrc;
	}
	
}
