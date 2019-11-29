package com.yedam.gca.group_six.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class SixmanVO {

	private int six_number;		// *PK* // 용병글 번호
	private String six_status;			// 상태 (참여가능/참여대기/실패/성공)
	private String six_name;			// 방 이름
	private Date six_start;				// 개설 날짜
	private Date six_end;				// 마감 날짜
	private int six_now;				// 현재 인원
	private String six_xy;				// xy좌표
	private int six_finish;				// 마감 인원
	private String six_location;		// 장소
	private String six_sports;			// 운동명
	private String six_skill;			// 숙련도 (입문/초급/중급/고급)
	private String six_age;				// 연령대
	private String six_gender;			// 성별 (여성/남성/혼성)

}
