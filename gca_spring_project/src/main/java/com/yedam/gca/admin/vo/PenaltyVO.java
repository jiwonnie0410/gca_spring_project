package com.yedam.gca.admin.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class PenaltyVO {

	private String pn_id;			// 활동정지 받은 회원 ID
	private Date pn_start_dttm;		// 활동정지 시작
	private Date pn_end_dttm;		// 활동정지 끝
}
