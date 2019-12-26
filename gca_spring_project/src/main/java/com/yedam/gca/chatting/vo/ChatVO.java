package com.yedam.gca.chatting.vo;

import lombok.Data;

@Data
public class ChatVO {
	private int ch_num;			// *PK* // 채팅방 번호
	private int ch_pp_cnt;				// 인원수
	private String m_ids;				// 채팅 참여한 회원들 ID
	private String m_nick;				// 채팅한 회원의 닉네임(chat table에는 없는 column)
}
