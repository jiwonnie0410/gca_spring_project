package com.yedam.gca.history.service;

import java.util.List;

import com.yedam.gca.group_s.vo.SGroupVO;
import com.yedam.gca.history.vo.ActiveHistVO;

public interface ActiveHistService {
	
	//*************** 수림 *******************//
	// 유저별 활동히스토리 목록 조회
	public List<ActiveHistVO> getActiveHistList();
	
	//모달클릭시 반짝 정보 단건 출력
	public SGroupVO getSgroup(SGroupVO vo);
}