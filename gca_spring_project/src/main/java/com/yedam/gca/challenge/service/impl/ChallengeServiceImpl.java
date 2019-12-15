package com.yedam.gca.challenge.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.gca.challenge.dao.ChallengeDAO;
import com.yedam.gca.challenge.service.ChallengeService;
import com.yedam.gca.challenge.vo.ChallengeVO;
import com.yedam.gca.history.vo.ChallengeHistVO;

@Service
public class ChallengeServiceImpl implements ChallengeService{

	@Autowired ChallengeDAO dao;
	
	// 1. 챌린지 전체목록 조회
	@Override
	public List<ChallengeVO> getChallengeList() {
		return dao.getChallengeList();
	}
	//2. 챌린지 단건 조회
	@Override
	public ChallengeVO getChallenge(ChallengeVO vo) {
		return dao.getChallenge(vo);
	}
	// 3. 챌린지 참여 조회
	@Override
	public List<ChallengeVO> checkChallengeHistoryList(ChallengeHistVO vo) {
		return dao.checkChallengeHistoryList(vo);
	}
	
	// 4. 챌린지 단건조회 (목록에서 클릭시 이동)
	@Override
	public ChallengeHistVO checkChallengeHistory(ChallengeHistVO vo) {
		return dao.checkChallengeHistory(vo);
	}
	
	// 5. 챌린지 참여입력
	@Override
	public void insertChallenge(ChallengeHistVO vo) {
		dao.insertChallenge(vo);
	}
	// 6. 챌린지 결제페이지 조회
	@Override
	public ChallengeVO challengePayment(ChallengeVO vo) {
		return dao.challengePayment(vo);
	}


}
