package com.yedam.gca.group_b.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yedam.gca.group_b.vo.BGroupVO;

@Repository("bGroupDAO")
public class BGroupDAO {
	
	@Autowired
	SqlSessionTemplate mybatis;
	
//-------------은영	

	
	
	
//-------------미현
	
	//방정보 한건 조회
	public BGroupVO getRoomInfo(BGroupVO vo) {
		return mybatis.selectOne("BGroupDAO.getRoomInfo", vo);
	}
	
	//반짝 목록 조회
	public List<BGroupVO> getBgList(BGroupVO vo) {
		return mybatis.selectList("BGroupDAO.getBgList", vo);
	}
	 
	//반짝 방 생성
	public void insertBg(BGroupVO vo){
		mybatis.selectOne("BGroupDAO.insertBg", vo);
	}
	
	//마감 방 조회
	public List<BGroupVO> getBgEndList(BGroupVO vo) {
		return mybatis.selectList("BGroupDAO.getBgEndList", vo);
	}

}
