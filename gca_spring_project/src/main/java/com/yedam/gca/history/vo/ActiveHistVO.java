package com.yedam.gca.history.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class ActiveHistVO {
	private int ach_num;			// *PK* // 활동이력번호
	private String m_id;				// 회원 ID
	private Date ach_dttm;				// 참여 일시
	private String ach_grant;			// 권한 (방장/멤버)
	private Date ach_confirm;			// 인증 시간
	private int bg_num;					// 매치 번호
	private int six_num;				// 용병 번호
	private int sg_num;					// 반짝 번호
	
	//미현
	private String result_msg;			//프로시저 out 요소
	private String in_type;				//프로시저 in 요소
	private int pk_num;				//프로시저 in 요소
	
}
