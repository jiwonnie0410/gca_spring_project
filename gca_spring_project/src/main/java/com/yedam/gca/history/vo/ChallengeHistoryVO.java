package com.yedam.gca.history.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class ChallengeHistoryVO {

	private int cl_number;		// *PK* // 챌린지 번호
	private String m_id;		// *PK* // 회원  ID
	private Date clh_start;				// 참여시작 날짜
	private int clh_count;				// 카운트
	private String clh_status;			// 상태 (진행/성공/실패)
	private int clh_money;				// 보증금
	
}
