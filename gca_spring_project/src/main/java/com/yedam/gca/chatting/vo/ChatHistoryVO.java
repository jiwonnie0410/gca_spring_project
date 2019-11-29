package com.yedam.gca.chatting.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class ChatHistoryVO {

	private String cth_contents;			// 채팅 내용
	private Date cth_date;					// 채팅 보낸 시간
	private int cth_number;			// *PK* // 채팅이력 번호
	private int ctr_number;					// 채팅방 번호
	private String m_id;					// 채팅 보낸 회원 ID
	
}
