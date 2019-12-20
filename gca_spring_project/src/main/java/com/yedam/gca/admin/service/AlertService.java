package com.yedam.gca.admin.service;

import java.util.List;

import com.yedam.gca.admin.vo.AlertVO;
import com.yedam.gca.chatting.vo.SocketVO;

public interface AlertService {

	//읽지 않은 알림 건수 조회
	public int getAlertCnt(AlertVO vo);
	
	//알림의 특정 그룹에 속한 아이디 조회
	List<AlertVO> getAlertGroupId(SocketVO vo);

	//모든 나의 알람 메시지 확인하기
	public List<AlertVO> getAlertList(AlertVO vo);

	//시용자의 읽지 않은 알람 메시지 확인하기
	public List<AlertVO> getAlertNotRead(AlertVO vo);

	//사용자의 읽은 알람 메시지 확인하기T
	public List<AlertVO> getAlertRead(AlertVO vo);

	//메시지 확인 후 수신 여부 업데이트
	//안 읽은 메시지를 한꺼번에 확인하기 때문에 안 읽은 메시지 전부를 읽은 메시지로 변경함
	public List<AlertVO> updateAlertRea(AlertVO vo);

}