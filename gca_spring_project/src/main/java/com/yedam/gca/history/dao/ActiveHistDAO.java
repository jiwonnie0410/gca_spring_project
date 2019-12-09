package com.yedam.gca.history.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yedam.gca.history.vo.ActiveHistVO;

@Repository
public class ActiveHistDAO {
	@Autowired
	SqlSessionTemplate mybatis;
	
	//************* 수림********************//
	
	// 유저별 활동히스토리 목록 조회
	public List<ActiveHistVO> getActiveHistList() {
		return mybatis.selectList("ActiveHistDAO.getActiveHistList");
	}


	
	//*************** 미현 *******************//
	//SGroup+BGroup+Sixman 참여 전 참여 여부 확인 + 마감 인원 파악
	public void validIn(ActiveHistVO vo) {
		mybatis.selectOne("ActiveHistDAO.validIn", vo);
	}
	
	//SGroup+BGroup+Sixman 방 참여
	public void roomInsert(ActiveHistVO vo) {
		mybatis.selectOne("ActiveHistDAO.roomInsert", vo);
	}
}
