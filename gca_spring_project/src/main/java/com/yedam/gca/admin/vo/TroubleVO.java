package com.yedam.gca.admin.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class TroubleVO {

	private Date tr_dttm;				// 신고 날짜
	private String tr_reason_cd;			// 신고 사유
	private String tr_mid;			// 신고당한 사람 ID
	private String m_id;					// 신고자 ID
	private int tr_num;			// *PK* // 신고 번호
	
	//은영
	private int tr_how_many;		//신고당한횟수(테이블에는 없음)
	
	
	
	
	
	
	
	//진영
	private Date pn_start_dttm;		// 활동정지 시작
	private Date pn_end_dttm;		// 활동정지 끝
}
