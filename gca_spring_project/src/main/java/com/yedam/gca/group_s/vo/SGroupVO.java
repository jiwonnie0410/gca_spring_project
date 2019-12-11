package com.yedam.gca.group_s.vo;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Data;

@Data
public class SGroupVO {

	private int sg_num;			// *PK* // 반짝 번호
	private String sg_name;					// 방 이름
	private Date sg_start_dttm;					// 개설 날짜
	private Timestamp sg_end_dttm;					// 마감 날짜
	private int sg_now_cnt;						// 현재 인원
	private int sg_end_cnt;					// 마감 인원
	private String sg_xy;					// xy 좌표
	private String sg_location;				// 장소
	private String sports1_cd;				// 운동명
	private String skill_cd;				// 숙련도 (입문/초급/중급/고급)
	private String age_range;					// 연령대
	private String gender_cd;				// 성별 (여성/남성/혼성)
	private String status_cd;				// 상태 (참여가능/참여대기/실패/성공)
	private String sg_option;				// 옵션 (도구지참, 반려동물)
	
	//은영
	
	
	//미현
	private String m_id;	//회원 ID
	private String m_xy;	//세션에 담기는 회원의 xy좌효
	private int scroll_page;	//스크롤 조회 시 마지막 rownum
}
