package com.yedam.gca.history.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yedam.gca.admin.vo.MoneyVO;
import com.yedam.gca.challenge.vo.ChallengeVO;
import com.yedam.gca.history.vo.ChallengeHistVO;

@Repository
public class ChallengeHistDAO {
	
	@Autowired
	SqlSessionTemplate mybatis;
	
	
	//은영
	public List<ChallengeVO> getMyChallenge(ChallengeHistVO vo){
		return mybatis.selectList("ChallengeDAO.getChallengeHist", vo);
	}
	public List<MoneyVO> getPaidMoney(MoneyVO vo){
		return mybatis.selectList("ChallengeDAO.getPaidMoney", vo);
	}
	
}
