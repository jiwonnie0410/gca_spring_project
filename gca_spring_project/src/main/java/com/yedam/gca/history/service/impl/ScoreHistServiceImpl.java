package com.yedam.gca.history.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.gca.history.dao.ScoreHistDAO;
import com.yedam.gca.history.service.ScoreHistService;
import com.yedam.gca.history.vo.ScoreHistVO;

@Service
public class ScoreHistServiceImpl implements ScoreHistService{
	
	@Autowired ScoreHistDAO dao;
	
	////////////// 수림 /////////////
	
	// 스코어 목록 출력(랭킹)
	@Override
	public List<ScoreHistVO> getRankList() {
		return dao.getRankList();
	}
	
	@Override
	public ScoreHistVO getMyRank(ScoreHistVO vo) {
		return dao.getMyRank(vo);
	}
	
	
	
	
	
	//////////////은영 /////////////
	public List<ScoreHistVO> getMyScore(ScoreHistVO vo) {
		return dao.getMyScore(vo);
	}

}
