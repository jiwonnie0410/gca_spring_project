package com.yedam.gca.chatting.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yedam.gca.chatting.vo.ChatHistVO;
import com.yedam.gca.history.vo.ActiveHistVO;

@Repository("chatDAO")
public class ChatDAO {
	
	@Autowired
	SqlSessionTemplate mybatis;
	
//-----은영
	//채팅 내역 insert
	public void insertChatHist(ChatHistVO vo) {
		mybatis.insert("ChatDAO.insertChatHist",vo);
	}
	
	//채팅내역 불러오기
	public List<ChatHistVO> getChatHist(ChatHistVO vo) {
		return mybatis.selectList("ChatDAO.getChatHist", vo);
	}
	
	//채팅 불러오기를 위한 방 참여시간 불러오기
	public ChatHistVO getJoinTime(ActiveHistVO vo) {
		return mybatis.selectOne("ActiveHistDAO.getJoinTime", vo);
	};
}
