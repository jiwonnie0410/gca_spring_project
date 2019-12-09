package com.yedam.gca.history.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yedam.gca.history.vo.ChallengeHistVO;

@Repository
public class ChallengeHistDAO {
	
	@Autowired
	SqlSessionTemplate mybatis;
	
	//************* 수림 **************//
	
	/// 스코어 목록 조회(랭킹)
	public List<ChallengeHistVO> getScoreList() {
		return mybatis.selectList("ChallengeHistDAO.getScoreList");
	}
}
