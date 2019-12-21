package com.yedam.gca.chatting.service;

import java.util.List;

import com.yedam.gca.chatting.vo.ChatHistVO;
import com.yedam.gca.history.vo.ActiveHistVO;

public interface ChatService {
//은영
	void insertChatHist(ChatHistVO vo);
	List<ChatHistVO> getChatHist(ChatHistVO vo);
	ChatHistVO getJoinTime(ActiveHistVO vo);
}
