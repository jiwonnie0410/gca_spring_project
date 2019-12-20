package com.yedam.gca.chatting.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yedam.gca.chatting.dao.ChatDAO;
import com.yedam.gca.chatting.service.ChatService;
import com.yedam.gca.chatting.vo.ChatHistVO;

@Service("chatService")
public class ChatServiceImpl implements ChatService {

	@Resource
	ChatDAO chatDAO;
	
	@Override
	public void insertChatHist(ChatHistVO vo) {
		chatDAO.insertChatHist(vo);
	}

}
