package com.yedam.gca.history.service;

import java.util.List;
import java.util.Map;

import com.yedam.gca.group_s.vo.SGroupVO;
import com.yedam.gca.history.vo.ActiveHistVO;

public interface ActiveHistService {
	
	//*************** 수림 *******************//
	// 유저별 활동히스토리 목록 조회
	public List<Map> getActiveHistList(ActiveHistVO vo);
	
	//반짝 단건 받아옴
	public SGroupVO getSgroup(SGroupVO vo);




	//***************** 미현 *******************//
	//SGroup+BGroup+Sixman 참여 전 참여 여부 확인 + 마감 인원 파악
	public void validIn(ActiveHistVO vo);
	
	//SGroup+BGroup+Sixman 방 참여
	void roomInsert(ActiveHistVO vo);
	
	
	//***************** 은영 *******************//
}