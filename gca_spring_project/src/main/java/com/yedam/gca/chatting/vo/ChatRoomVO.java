package com.yedam.gca.chatting.vo;

import lombok.Data;

@Data
public class ChatRoomVO {

	private int ctr_number;			// *PK* // 채팅방 번호
	private int ctr_people_count;			// 인원수
	private String m_ids;					// 채팅 참여한 회원들 ID

}
