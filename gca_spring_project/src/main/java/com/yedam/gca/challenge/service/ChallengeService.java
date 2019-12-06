package com.yedam.gca.challenge.service;

import java.util.List;

import com.yedam.gca.challenge.vo.ChallengeVO;


public interface ChallengeService {

	//챌린지목록 전체조회  (사용자별 챌린지 참가여부확인)
	List<ChallengeVO> getChallengeList();
	
	//챌린지 단건조회 
	ChallengeVO getChallenge(ChallengeVO vo);
	
	//챌린지 참가등록, (챌린지 히스토리에 내역남김) 
	public void insertChallenge(ChallengeVO vo); 
	
	//스페셜챌린지 결제페이지
	public ChallengeVO challengePayment(ChallengeVO vo);

}