package com.yedam.gca.history.service;

import java.util.List;

import com.yedam.gca.history.vo.ChallengeHistVO;

public interface ChallengeHistService {

	////////////// 수림 //////////////////
	
	// 스코어 목록 조회(랭킹)
	List<ChallengeHistVO> getScoreList();
	
	
	
	
	
	
	
	//진영
		// 챌린지 히스로리 목록 출력

	List<ChallengeHistVO> getChallengehtList(ChallengeHistVO vo);








}