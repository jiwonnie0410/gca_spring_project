package com.yedam.gca.admin.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class AlertVO {
	// 운영자가 보내는 알림 쪽지
	private int alert_num;		// *PK* // 알림 번호
	private String alert_contents;			// 알림 내용
	private Date alert_dttm;				// 보낸 날짜
	private String m_id;					// 쪽지 받는 회원 ID

}
