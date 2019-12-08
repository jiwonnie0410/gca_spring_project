package com.yedam.gca.history.service;

import java.util.List;

import com.yedam.gca.history.vo.ChallengeHistVO;

public interface ChallengeHistService {

	////////////// 수림 //////////////////
	
	// 스코어 목록 조회(랭킹)
	List<ChallengeHistVO> getScoreList();

}