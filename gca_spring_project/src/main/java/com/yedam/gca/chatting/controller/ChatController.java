package com.yedam.gca.chatting.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.gca.admin.vo.TroubleVO;
import com.yedam.gca.chatting.service.ChatService;
import com.yedam.gca.chatting.vo.ChatHistVO;

@Controller
public class ChatController {
	
	@Autowired ChatService chatService;
	
//은영
	//채팅 히스토리 insert
		@ResponseBody
		@RequestMapping(value={"sgroup/insertChatHist","bgroup/insertChatHist","sixman/insertChatHist"}, consumes="application/json")
		public int insertChatHist(@RequestBody ChatHistVO vo) {
			chatService.insertChatHist(vo);
			System.out.println("vo: "+vo);
			
			return 0;
		}
	
}
