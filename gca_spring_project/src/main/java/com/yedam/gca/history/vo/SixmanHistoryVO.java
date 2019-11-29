package com.yedam.gca.history.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class SixmanHistoryVO {

	private int sixh_number;		// *PK* // 용병이력번호
	private String m_id;					// 회원 ID
	private Date sixh_date;					// 참여시간
	private String sixg_grant;				// 권한 (방장/용병)
	private int six_number;					// 용병글 번호

}
