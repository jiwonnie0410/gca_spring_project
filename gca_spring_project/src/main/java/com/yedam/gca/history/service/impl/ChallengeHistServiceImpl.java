package com.yedam.gca.history.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.gca.history.dao.ChallengeHistDAO;
import com.yedam.gca.history.service.ChallengeHistService;
import com.yedam.gca.history.vo.ChallengeHistVO;

@Service
public class ChallengeHistServiceImpl implements ChallengeHistService{

	@Autowired ChallengeHistDAO dao;
	
	////////////// 수림 /////////////
	
	// 스코어 목록 출력(랭킹)
	@Override
	public List<ChallengeHistVO> getScoreList() {
		return dao.getScoreList();
	}
}
