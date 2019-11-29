package com.yedam.gca.group_b.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class BGroupVO {

	private int bg_number;			// *PK* // 매치 번호
	private String bg_name;					// 방 이름
	private Date bg_start;					// 개설 날짜
	private Date bg_end;					// 마감 날짜
	private int bg_people_count;			// 선수 인원
	private String bg_location;				// 장소
	private String bg_xy;					// xy 좌표
	private String bg_sports;				// 운동명
	private String bg_skill;				// 숙련도 (입문/초금/중급/고급)
	private String bg_age;					// 연령대
	private String bg_gender;				// 성별 (여성/남성/혼성)
	private String bg_status;				// 상태 (참여가능/참여대기/실패/성공)
	private String m_id;					// 방장 ID
	private String bg_m_id;					// 회원 ID

}
