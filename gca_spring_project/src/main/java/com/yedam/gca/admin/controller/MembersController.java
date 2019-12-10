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
	
	
	/*
	 * @RequestMapping("getUserList.do") public String getUserList1(Model model,
	 * MembersVO vo) { model.addAttribute("userList",
	 * membersService.getUserList(vo)); return "admin/userList_Json"; }
	 */
	
	@RequestMapping("getUserList.do")
	public String getUserList1(Model model, MembersVO vo) {
		model.addAttribute("userList", membersService.getUserList(vo));
		return "/admin/userList";
	}
	
	
	  @RequestMapping("getUser.do") public String getUser(Model model, MembersVO vo){
		  model.addAttribute("userSelect", membersService.getUser(vo));
		  return"admin/user"; }
	 
	
	
	
	//전체조회
	@ResponseBody
	@RequestMapping(value="/members", method=RequestMethod.GET)
	public List<MembersVO> getUserList(Model model, MembersVO vo) {
		return  membersService.getUserList(vo);
	}
	
	//단건조회
	@ResponseBody
	@RequestMapping(value="/members/{m_id}",  method=RequestMethod.GET)
	public MembersVO getUser(@PathVariable String m_id, MembersVO vo, Model model) {
		vo.setM_id(m_id);
		return  membersService.getUser(vo);
	}
	
	//삭제
	@ResponseBody
	@RequestMapping(value="/members/{m_id}", method=RequestMethod.DELETE)
	public String deleteUser( @PathVariable String m_id, MembersVO vo) {
		vo.setM_id(m_id);
		membersService.deleteUser(vo);
		return m_id;
	}
	
	
	//등록
	@ResponseBody
	@RequestMapping(value="/members"
			,method=RequestMethod.POST
	//		,produces="application/json"     
	// 		,consumes="application/json"
            ,headers = {"Content-type=application/json" }
	)
	public Map insertUser(@RequestBody MembersVO vo, Model model) {
		membersService.insertUser(vo);
		return  Collections.singletonMap("result", true);
	}
	
	//수정
	@ResponseBody
	@RequestMapping(value="/members"
			,method=RequestMethod.PUT
	//		,produces="application/json"      //응답헤더
	 		,consumes="application/json"      //요청헤더
     //       ,headers = {"Content-type=application/json" }
	)
	public MembersVO updateUser(@RequestBody MembersVO vo, Model model) {
		membersService.updateUser(vo);
		return  vo;
	}	
	
}
