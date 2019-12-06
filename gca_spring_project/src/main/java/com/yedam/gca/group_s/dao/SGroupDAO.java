package com.yedam.gca.group_s.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yedam.gca.group_s.vo.SGroupVO;

@Repository("sGroupDAO")
public class SGroupDAO {
	
	@Autowired
	SqlSessionTemplate mybatis;
	
	//은영	
	public SGroupVO getRoomInfo(SGroupVO vo) {
		return mybatis.selectOne("SGroupDAO.getRoomInfo", vo);
	}
	
	
	//미현
	public List<SGroupVO> getSgList(SGroupVO vo) {
		return mybatis.selectList("SGroupDAO.getSgList", vo);
	}
	
	public int updateCnt(SGroupVO vo) {
		return mybatis.update("SGroupDAO.updateCnt", vo);
	}
}
