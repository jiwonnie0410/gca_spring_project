package com.yedam.gca.history.service;

import java.util.List;
import java.util.Map;

import com.yedam.gca.group_s.vo.SGroupVO;
import com.yedam.gca.history.vo.ActiveHistVO;
import com.yedam.gca.member.vo.MembersVO;

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
	
	//참여하면서 SGroup+BGroup+Sixman 방에 참여한 인물의 정보 가져오기
	List<MembersVO> getActMemList(ActiveHistVO vo);
	
	
	//***************** 은영 *******************//
}