package com.yedam.gca.challenge.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yedam.gca.challenge.service.ChallengeService;
import com.yedam.gca.challenge.vo.ChallengeVO;

@Repository
public class ChallengeDAO implements ChallengeService {
	@Autowired
	SqlSessionTemplate mybatis;
	
	//챌린지 전체조회  (사용자별 챌린지 참가여부확인)
	@Override
	public List<ChallengeVO> getChallengeList() {
		return mybatis.selectList("ChallengeDAO.getChallengeList");
	}
	
	//챌린지 참가 (사용자가 챌린지 참가중이 아닐시)

}
