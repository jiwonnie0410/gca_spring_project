package com.yedam.gca.common.bootpay.request;

public class Cancel {
	
	/// 부트페이 환불용 VO DB사용 X 서버전송용
	
	public String receipt_id;         // 환불용 고유아이디
    public String name;				  // 환불유저 아이디
    public String reason;			  // 환불사유
    public double price;				  // 부분환불시 금액 (없으면 전체환불)

}
