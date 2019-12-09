package com.yedam.gca.history.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yedam.gca.group_s.vo.SGroupVO;
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
	
	//모달클릭시 반짝 정보 단건 출력
	public SGroupVO getSgroup(SGroupVO vo) {
		return mybatis.selectOne("ActiveHistDAO.getSgroup", vo);
	}
}
