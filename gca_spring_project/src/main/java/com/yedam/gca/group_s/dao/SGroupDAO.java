package com.yedam.gca.group_s.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yedam.gca.group_s.vo.SGroupVO;

@Repository("sGroupDAO")
public class SGroupDAO {
	
	@Autowired
	SqlSessionTemplate mybatis;
	
	public SGroupVO getRoomInfo(SGroupVO vo) {
		return mybatis.selectOne("SGroupDAO.getRoomInfo", vo);
	}
}
