package com.yedam.gca.chatting.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class ChatHistVO {
	private String chh_content;			// 채팅 내용
	private Date chh_dttm;					// 채팅 보낸 시간
	private int chh_num;			// *PK* // 채팅이력 번호
	private int ch_num;					// 채팅방 번호
	private String m_id;					// 채팅 보낸 회원 ID
}
