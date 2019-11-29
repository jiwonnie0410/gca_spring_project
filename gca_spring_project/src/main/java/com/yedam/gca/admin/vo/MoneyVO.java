package com.yedam.gca.admin.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class MoneyVO {

	private String m_id;						// 회원 ID
	private int money_deposit;					// 입금액
	private Date money_deposit_date;			// 입금날짜
	private int money_withdraw;					// 출금액
	private Date money_withdraw_date;			// 출금날짜
	private String money_status;				// 상태
	private int money_number;			// *PK* // 수익현황이력번호
	
}
