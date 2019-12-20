package com.yedam.gca.chatting.service;

import java.util.List;

import com.yedam.gca.chatting.vo.ChatHistVO;

public interface ChatService {
//은영
	void insertChatHist(ChatHistVO vo);
	List<ChatHistVO> getChatHist(ChatHistVO vo);
}
