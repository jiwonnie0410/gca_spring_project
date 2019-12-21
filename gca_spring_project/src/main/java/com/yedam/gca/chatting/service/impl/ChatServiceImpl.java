package com.yedam.gca.chatting.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yedam.gca.chatting.dao.ChatDAO;
import com.yedam.gca.chatting.service.ChatService;
import com.yedam.gca.chatting.vo.ChatHistVO;
import com.yedam.gca.history.vo.ActiveHistVO;

@Service("chatService")
public class ChatServiceImpl implements ChatService {

	@Resource
	ChatDAO chatDAO;
	
	@Override
	public void insertChatHist(ChatHistVO vo) {
		chatDAO.insertChatHist(vo);
	}

	@Override
	public List<ChatHistVO> getChatHist(ChatHistVO vo) {
		return chatDAO.getChatHist(vo);
	}

	@Override
	public ChatHistVO getJoinTime(ActiveHistVO vo) {
		return chatDAO.getJoinTime(vo);
	}
	
	

}
