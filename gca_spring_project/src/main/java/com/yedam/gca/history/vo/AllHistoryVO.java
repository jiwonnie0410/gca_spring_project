package com.yedam.gca.history.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class AllHistoryVO {

	private int ah_number;		// *PK* // 활동이력번호
	private String m_id;				// 회원 ID
	private Date ah_date;				// 참여 시간
	private String ah_grant;			// 권한 (방장/멤버)
	private Date ah_confirm;			// 인증 시간
	private int bg_number;				// 매치 번호
	private int six_number;				// 용병 번호
	private int sg_number;				// 반짝 번호

}
