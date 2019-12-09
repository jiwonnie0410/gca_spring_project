package com.yedam.gca.group_s.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.gca.admin.vo.TroubleVO;
import com.yedam.gca.common.service.CodeService;
import com.yedam.gca.common.vo.CodeVO;
import com.yedam.gca.group_s.service.SGroupService;
import com.yedam.gca.group_s.vo.SGroupVO;

@Controller
public class SGroupController {
	
	@Autowired	SGroupService sgroupService;
	@Autowired	CodeService codeService;
	
	
	//은영
	@RequestMapping("/sgroup/getRoomInfo")
	public String getRoomInfo(Model model, SGroupVO vo) {
		model.addAttribute("sgroup", sgroupService.getRoomInfo(vo));
		System.out.println(model);
		return "group_s/s_wating_room";
	}
	
	//신고하기 insert
		@ResponseBody
		@RequestMapping(value="/sgroup/doReport", consumes="application/json")
		public int doReport(@RequestBody TroubleVO vo) {
//			model.addAttribute("report", service.getRoomInfo(vo));
			return sgroupService.doReport(vo);
//			System.out.println(model);
		}
	
//미현
	
	//전체 반짝 리스트 조회
	@RequestMapping("/sgroup/getSgList")
	public String search(Model model, SGroupVO vo) {
		model.addAttribute("list", sgroupService.getSgList(vo));
		System.out.println(sgroupService.getSgList(vo));
		return "group_s/s_search";
	}
	
	//선택한 방에 참여
	@RequestMapping("/sgroup/getRoomInfo2")
	public String getRoomInfo(@RequestParam(value="sg_num", defaultValue="", required=true) int sg_num,
			@RequestParam(value="sg_now_cnt", defaultValue="", required=true) int sg_now_cnt,
			Model model, SGroupVO vo) {
		vo.setSg_num(sg_num);
		vo.setSg_now_cnt(sg_now_cnt+1);
		sgroupService.updateCnt(vo);
		model.addAttribute("sgroup", sgroupService.getRoomInfo(vo));
		return "group_s/s_wating_room";
	}
	
	//반짝 방 참여 전에 참여 여부와 실 참여인원 수 조회하기
	@ResponseBody
	@RequestMapping(value="sgroup/sgNowCnt/{sg_num}", method = RequestMethod.GET)
	public SGroupVO sgNowCnt(@PathVariable int sg_num, SGroupVO vo, HttpSession session) {
		String m_id = (String) session.getAttribute("m_id");
		vo.setM_id(m_id);
		vo.setSg_num(sg_num);
		return sgroupService.getRoomInfo(vo);
	}
	
	//반짝 생성 폼으로 이동
	@RequestMapping("/sgroup/createRoomForm")
	public String createRoomForm(Model model, CodeVO vo) {
		vo.setCd_group("SPORTS1_CD");
		model.addAttribute("sports_list", codeService.getCodeList(vo));
		vo.setCd_group("SKILL_CD");
		model.addAttribute("skill_list", codeService.getCodeList(vo));
		vo.setCd_group("GENDER_CD");
		model.addAttribute("gender_list", codeService.getCodeList(vo));
		return "group_s/s_search_cre";
	}
	
	//방 생성
	@RequestMapping(value="sgroup/creRoom", method=RequestMethod.POST)
	public String createRoom(@ModelAttribute SGroupVO vo, HttpSession session) {
		String m_id = (String) session.getAttribute("m_id");
//		vo.setM_id(m_id);
		vo.setM_id("test");
		sgroupService.insertSg(vo);
//		int sg_num = vo.getSg_num();
		return "redirect:getRoomInfo2?sg_num="+vo.getSg_num()+"&sg_now_cnt=0";
	}
}
