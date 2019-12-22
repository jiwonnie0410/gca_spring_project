package com.yedam.gca.challenge.service;

import java.util.List;

import com.yedam.gca.admin.vo.MoneyVO;
import com.yedam.gca.challenge.vo.ChallengeVO;
import com.yedam.gca.history.vo.ChallengeHistVO;


public interface ChallengeService {
	
	////////////수림///////////////////
	// 1. 챌린지목록 전체조회  (사용자별 챌린지 참가여부확인)
	public List<ChallengeVO> getChallengeList();
	
	// 2. 챌린지 단건조회 
	public ChallengeVO getChallenge(ChallengeVO vo);
	
	// 3. 사용자 챌린지 참가여부 확인 
	public List<ChallengeVO> checkChallengeHistoryList(ChallengeHistVO vo);
	
	// 4. 챌린지 단건조회 (목록에서 클릭시 이동)
	public ChallengeHistVO checkChallengeHistory(ChallengeHistVO vo);
	
	// 5. 챌린지 참가등록, (챌린지 히스토리에 내역남김) 
	public void insertChallenge(ChallengeHistVO vo); 
	
	// 6. 스페셜챌린지 결제페이지
	public ChallengeVO challengePayment(ChallengeVO vo);
	
	// 7. 스페셜챌린지 결제완료시 머니 테이블에 이력 남김
	public void insertMoney(MoneyVO vo);
	
	// 8. 챌린지 성공시 포인트 증정
	public void insertChallengeScore();
	

}