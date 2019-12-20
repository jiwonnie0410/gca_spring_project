package com.yedam.gca.chatting.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yedam.gca.chatting.vo.ChatHistVO;

@Repository("chatDAO")
public class ChatDAO {
	
	@Autowired
	SqlSessionTemplate mybatis;
	
//-----은영
	//채팅 내역 insert
	public void insertChatHist(ChatHistVO vo) {
		mybatis.insert("ChatDAO.insertChatHist",vo);
	}
}
