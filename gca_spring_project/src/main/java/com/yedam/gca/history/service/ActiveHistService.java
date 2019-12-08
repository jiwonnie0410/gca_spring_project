package com.yedam.gca.history.service;

import java.util.List;

import com.yedam.gca.history.vo.ActiveHistVO;

public interface ActiveHistService {
	
	//*************** 수림 *******************//
	// 스코어 목록 조회(랭킹)
	public List<ActiveHistVO> getActiveHistList();
}