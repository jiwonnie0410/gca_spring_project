//package com.yedam.gca.admin.controller;
//
//import java.util.List;
//import java.util.Map;
//
//import org.apache.commons.io.IOUtils;
//import org.apache.http.HttpResponse;
//import org.apache.velocity.runtime.directive.Parse;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.scheduling.annotation.Scheduled;
//import org.springframework.stereotype.Component;
//
//import com.yedam.gca.admin.service.AdminService;
//import com.yedam.gca.common.bootpay.BootpayApi;
//import com.yedam.gca.common.bootpay.request.Cancel;
//
//@Component
//public class ScheduleController {
//
//	// ************* 수림 ******************* //
//	
//	@Autowired
//	static AdminService service;
//
//	static BootpayApi api;
//	
//	// 1. 챌린지 실패시 부분환불 (매일 am 0:05분에 실행)
//	//@Scheduled(cron = "5 * * * * * ")
//	@Scheduled(fixedRate = 100000)
//	public static void test() {
//	 api = new BootpayApi(
//				"5de9c9d85ade160030cc4a8a", 						// REST용 Application ID
//				"lgO2Fr/UI3L5QGI97pcPWspPIWozz0MSxndaDlC0s+A=" 		// 프로젝트의 Private KEY
//		);
//	 	getToken();
//		partialRefund();
//	}
//	
//	// 토큰 얻기
//	public static void getToken() {
//		
//        try {
//            api.getAccessToken();
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//	}
//	
//	// 전체환불 진행
////	public static void fullRefund() {
////		
////		List<Map<String, Object>> receipt  =  service.checkChallengeHistoryList(vo);
////		
////		for(Map<String,Object> list : receipt) {
////			Cancel cancel = new Cancel();
////			cancel.receipt_id = (String) list.get("money_moid");
////			
////			try {
////				HttpResponse res = api.cancel(cancel);
////				String str = IOUtils.toString(res.getEntity().getContent(), "UTF-8");
////				System.out.println(str + "환불완료?");
////			} catch (Exception e) {
////				e.printStackTrace();
////			}
////		}
//
//		
//
//
//
//
//	// 부분환불 진행
//	public static void partialRefund() {
//		List<Map<String, Object>> receipt = service.selectRefund();		// 서비스가 널이라 안담김
//
//		for (Map<String, Object> list : receipt) {
//			System.out.println( (String) list.get("money_moid") );
//			Cancel cancel = new Cancel();
//			cancel.receipt_id = (String) list.get("money_moid");
//			cancel.price = Integer.parseInt((String) list.get("money_deposit"));
//					
//
//			try {
//				HttpResponse res = api.cancel(cancel);
//				String str = IOUtils.toString(res.getEntity().getContent(), "UTF-8");
//				System.out.println(str + "환불완료?");
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//		}
//	}
//}
