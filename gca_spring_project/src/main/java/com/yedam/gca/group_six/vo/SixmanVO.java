package com.yedam.gca.group_six.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class SixmanVO {

	private int six_num;		// *PK* // 용병글 번호
	private String status_cd;			// 상태 (참여가능/참여대기/실패/성공)
	private String six_name;			// 방 이름
	private Date six_start_dttm;				// 개설 날짜
	private Date six_end_dttm;				// 마감 날짜
	private int six_now_cnt;				// 현재 인원
	private String six_xy;				// xy좌표
	private int six_end_cnt;				// 마감 인원
	private String six_location;		// 장소
	private String sports2_cd;			// 운동명
	private String skill_cd;			// 숙련도 (입문/초급/중급/고급)
	private String age_range;				// 연령대
	private String gender_cd;			// 성별 (여성/남성/혼성)

}
