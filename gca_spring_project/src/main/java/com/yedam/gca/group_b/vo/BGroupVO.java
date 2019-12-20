package com.yedam.gca.group_b.vo;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Data;

@Data
public class BGroupVO {

	private int bg_num;				// *PK* // 매치 번호
	private String bg_name;					// 방 이름
	private Date bg_start_dttm;				// 개설 날짜
	private Timestamp bg_end_dttm;				// 마감 날짜
	private int bg_now_cnt;					// 현재 인원
	private int bg_end_cnt;					// 마감 인원
	private int bg_team_cnt;				// 선수 인원
	private String bg_location;				// 장소
	private String bg_xy;					// xy 좌표
	private String sports2_cd;				// 운동명
	private String skill_cd;				// 숙련도 (입문/초금/중급/고급)
	private String age_range;				// 연령대
	private String gender_cd;				// 성별 (여성/남성/혼성)

	//은영
	
	
	//미현
	private String m_id;	//회원 ID
	private String m_xy;	//세션에 담기는 회원의 xy좌표
	private Double dis;		//거리
	private Double end_dis;	//조회 시 마지막 출력된 거리값
	private Timestamp end_dttm;	//조회 시 마지막 출력된 마감시간
	private int end_num;	//조회 시 마지막 출력된 방번호
	private int scroll_rec;	//스크롤 조회 시 가져올 레코드 건 수
	private String key;		//검색 조건(운동명 등등)
	private String keyval;	//검색 내용(배드민턴 등등)
	private int alert_gnum;	//거리 알림 그룹
	

}
