package com.yedam.gca.history.service;

import java.util.List;

import com.yedam.gca.history.vo.ScoreHistVO;

public interface ScoreHistService {
	
	////////////// 수림 //////////////////
	
	//1. 스코어 목록 조회(랭킹)
	List<ScoreHistVO> getRankList();
	
	// 2. 로그인 유저 1명 랭킹 조회
	ScoreHistVO getMyRank(ScoreHistVO vo);
	
	
	
	//////////////은영 //////////////////
	
	//본인의 획득 점수, 날짜, 획득경로 조회
	List<ScoreHistVO> getMyScore(ScoreHistVO vo);

}
