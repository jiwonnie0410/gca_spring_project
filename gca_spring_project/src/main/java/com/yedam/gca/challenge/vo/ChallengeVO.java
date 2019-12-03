package com.yedam.gca.challenge.vo;

import java.sql.Date;

import lombok.Data;

@Data  //수림 수정
public class ChallengeVO {
	
	private int cl_num;			// *PK* // 챌린지 번호
	private String cl_status;				// 챌린지 구분 (기본/스페셜)
	private String cl_name;					// 챌린지명
	private String cl_content;				// 챌린지 내용
	private String sport1_cd;				// 챌린지 종목
	private int cl_cnt;					// 챌린지 성공횟수
	private Date cl_start_dttm;					// 시작 날짜
	private Date cl_end_dttm;					// 마감 날짜
	private int cl_score;					// 리워드 점수
	
}
