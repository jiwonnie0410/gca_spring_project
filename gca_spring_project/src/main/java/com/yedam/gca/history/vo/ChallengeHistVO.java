package com.yedam.gca.history.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class ChallengeHistVO {
	private int cl_num;			// *PK* // 챌린지 번호
	private String m_id;		// *PK* // 회원  ID
	private Date clh_start_dttm;		// 참여시작 날짜
	private int clh_cnt;				// 카운트
	private String clh_status_cd;		// 상태 (진행/성공/실패)
}
