package com.yedam.gca.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yedam.gca.admin.service.AlertService;
import com.yedam.gca.admin.vo.AlertVO;

@Controller
public class AlertController {
	
	@Autowired
	AlertService service;
	
	//************ 수림 **********//
	
	// 1. 사용자 알람 메세지 확인
	@RequestMapping("member/alert")
	public String getAlertList(Model model, AlertVO vo, Authentication auth) {
	
	UserDetails userDetails = (UserDetails) auth.getPrincipal();	//로그인한 유저 정보 담음
	String id = userDetails.getUsername(); 	//로그인한 유저 id 담음
	vo.setM_id(id);	
	
	// 안읽은 알람 메세지 목록
	model.addAttribute("notReadList", service.getAlertNotRead(vo)); // 안읽은 메세지 목록
	service.updateAlertRea(vo); //안읽은 메세지를 읽음 처리한다
	
	// 모든 알람 메세지 목록
	model.addAttribute("alertList", service.getAlertList(vo));
	
	return "/user/member/alert";
	}
}
