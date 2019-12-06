package com.yedam.gca.challenge.service;

import java.util.List;

import com.yedam.gca.challenge.vo.ChallengeVO;
import com.yedam.gca.history.vo.ChallengeHistVO;


public interface ChallengeService {
	
	////////////수림///////////////////
	//챌린지목록 전체조회  (사용자별 챌린지 참가여부확인)
	public List<ChallengeVO> getChallengeList();
	
	//챌린지 단건조회 
	public ChallengeVO getChallenge(ChallengeVO vo);
	
	// 사용자 챌린지 참가여부 확인 
	public ChallengeHistVO checkChallengeHistory(ChallengeHistVO vo);
	
	//챌린지 참가등록, (챌린지 히스토리에 내역남김) 
	public void insertChallenge(ChallengeHistVO vo); 
	
	//스페셜챌린지 결제페이지
	public ChallengeVO challengePayment(ChallengeVO vo);

}