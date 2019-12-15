package com.yedam.gca.history.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yedam.gca.history.vo.ChallengeHistVO;
import com.yedam.gca.history.vo.ScoreHistVO;

@Repository
public class ScoreHistDAO {
	
	@Autowired
	SqlSessionTemplate mybatis;
	
	//************* 수림 **************//
	
	// 1.랭킹 목록 전체 조회
	public List<ScoreHistVO> getRankList() {
		return mybatis.selectList("ScoreHistDAO.getRankList");
	}
	
	// 2. 로그인 유저 1명 랭킹 조회
	public ScoreHistVO getMyRank(ScoreHistVO vo) {
		return mybatis.selectOne("ScoreHistDAO.getMyRank");
	}

}
