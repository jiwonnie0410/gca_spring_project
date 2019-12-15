package com.yedam.gca.history.vo;

import java.sql.Date;

import lombok.Data;
@Data
public class ScoreHistVO {
	private String m_id;					// 회원 ID
	private int sch_score;					// 점수
	private Date sch_dttm;					// 득점 날짜
	private String sch_part;				// 득점 구분 (반짝/챌린지)
	private int sch_num;			// *PK* // 점수 이력 번호
	
	
	// 수림추가
	private String rank;						// 랭킹순위  !DB에 없음    
	private String m_nick;						// 유저 닉네임  !조인용
	private	String m_image_cd;					// 유저 프로필사진 !조인용
}
