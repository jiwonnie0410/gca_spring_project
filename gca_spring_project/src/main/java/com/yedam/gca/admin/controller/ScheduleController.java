package com.yedam.gca.admin.controller;

import org.apache.commons.io.IOUtils;
import org.apache.http.HttpResponse;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import com.yedam.gca.common.BootpayApi;
import com.yedam.gca.common.vo.CancelVO;

@Controller
public class ScheduleController {

	// ************* 수림 ******************* //

	static BootpayApi api;

	// 1. 챌린지 실패시 부분환불 (매일 am 0:05분에 실행)

	@Scheduled(cron = "0 5 0 * * * ")
	public static void main(String[] args) {
		api = new BootpayApi();
		partialRefund();
	}

	public static void partialRefund() {
		CancelVO cancel = new CancelVO();

		cancel.receipt_id = "593f8febe13f332431a8ddae";
		cancel.name = "관리자 홍길동";
		cancel.reason = "택배 지연에 의한 구매자 취소요청";

		try {
			HttpResponse res = api.cancel(cancel);
			String str = IOUtils.toString(res.getEntity().getContent(), "UTF-8");
			System.out.println(str);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
