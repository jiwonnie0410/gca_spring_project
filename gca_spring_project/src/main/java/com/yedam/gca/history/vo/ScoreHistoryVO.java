package com.yedam.gca.history.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class ScoreHistoryVO {

	private String m_id;					// 회원 ID
	private int sh_score;					// 점수
	private Date sh_date;					// 득점 날짜
	private String sh_getfrom;				// 득점 구분 (반짝/챌린지)
	private int sh_number;			// *PK* // 점수 이력 번호

}
