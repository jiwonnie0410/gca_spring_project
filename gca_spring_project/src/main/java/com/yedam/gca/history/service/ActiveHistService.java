package com.yedam.gca.history.service;

import java.util.List;

import com.yedam.gca.history.vo.ActiveHistVO;

public interface ActiveHistService {
	
	//*************** 수림 *******************//
	// 유저별 활동히스토리 목록 조회
	public List<ActiveHistVO> getActiveHistList();
}