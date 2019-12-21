package com.yedam.gca.chatting.vo;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Data;

@Data
public class ChatHistVO {
	private String chh_content;			// 채팅 내용
	private Timestamp chh_dttm;					// 채팅 보낸 시간
	private int chh_num;			// *PK* // 채팅이력 번호
	private int sg_num;						// 반짝일경우 반짝방번호
	private int bg_num;						// 동아리매치일경우 매치방번호
	private int six_num;					// 용병일경우 용병방번호
	private String m_id;					// 채팅 보낸 회원 ID
}
