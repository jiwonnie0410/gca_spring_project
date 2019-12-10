package com.yedam.gca.group_b.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class BGroupVO {

	private int bg_num;				// *PK* // 매치 번호
	private String bg_name;					// 방 이름
	private Date bg_start_dttm;				// 개설 날짜
	private Date bg_end_dttm;				// 마감 날짜
	private int bg_team_cnt;				// 선수 인원
	private String bg_location;				// 장소
	private String bg_xy;					// xy 좌표
	private String sports2_cd;				// 운동명
	private String skill_cd;				// 숙련도 (입문/초금/중급/고급)
	private String age_range;				// 연령대
	private String gender_cd;				// 성별 (여성/남성/혼성)
	private String status_cd;				// 상태 (참여가능/참여대기/실패/성공)
	private String m_id1;					// 방장 ID
	private String m_id2;					// 회원 ID

}
