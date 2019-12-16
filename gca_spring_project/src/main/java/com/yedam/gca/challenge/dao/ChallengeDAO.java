package com.yedam.gca.challenge.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yedam.gca.admin.vo.MoneyVO;
import com.yedam.gca.challenge.vo.ChallengeVO;
import com.yedam.gca.history.vo.ChallengeHistVO;

@Repository
public class ChallengeDAO  {
	
	@Autowired
	SqlSessionTemplate mybatis;
	
	///////////////수림/////////////////
	// 1. 챌린지 목록조회 
	public List<ChallengeVO> getChallengeList() {
		return mybatis.selectList("ChallengeDAO.getChallengeList");
	}
	
	// 2. 챌린지 단건조회 (목록에서 클릭시 이동)
	public ChallengeVO getChallenge(ChallengeVO vo) {
		return mybatis.selectOne("ChallengeDAO.getChallenge", vo);
	}
	
	// 3. 사용자 챌린지 참가여부 확인 
	public List<ChallengeVO> checkChallengeHistoryList(ChallengeHistVO vo) {
		return mybatis.selectList("ChallengeDAO.checkChallengeHistoryList", vo);
	}
	
	// 4. 챌린지 단건조회 (목록에서 클릭시 이동)
	public ChallengeHistVO checkChallengeHistory(ChallengeHistVO vo) {
		return mybatis.selectOne("ChallengeDAO.checkChallengeHistory", vo);
	}
	
	// 5. 챌린지 참가등록, (챌린지 히스토리에 내역남김) 
	public void insertChallenge(ChallengeHistVO vo) {
		mybatis.insert("ChallengeDAO.insertChallenge", vo);
	}
	
	// 6. 스페셜챌린지 결제페이지 조회
	public ChallengeVO challengePayment(ChallengeVO vo) {
		return mybatis.selectOne("ChallengeDAO.challengePayment", vo);
	}
	
	// 7. 스페셜챌린지 결제완료시 머니 테이블에 이력 남김
	public void insertMoney(MoneyVO vo) {
		mybatis.insert("ChallengeDAO.insertMoney", vo);
	}

}
