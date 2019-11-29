package com.yedam.gca.admin.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class TroubleVO {

	private Date trouble_date;				// 신고 날짜
	private String trouble_reason;			// 신고 사유
	private String trouble_maker;			// 신고당한 사람 ID
	private String m_id;					// 신고자 ID
	private int trouble_number;		// *PK* // 신고 번호
	
}
