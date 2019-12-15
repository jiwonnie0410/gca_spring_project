package com.yedam.gca.group_six.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yedam.gca.group_six.vo.SixmanVO;

@Repository("sixmanDAO")
public class SixmanDAO {
	
	@Autowired
	SqlSessionTemplate mybatis;
	
//-------------은영	

	
	
	
//-------------미현
	
	//방정보 한건 조회
	public SixmanVO getRoomInfo(SixmanVO vo) {
		return mybatis.selectOne("SixmanDAO.getRoomInfo", vo);
	}
	
	//목록 조회
	public List<SixmanVO> getSixList(SixmanVO vo) {
		return mybatis.selectList("SixmanDAO.getSixList", vo);
	}
	 
	//방 생성
	public void insertSix(SixmanVO vo){
		mybatis.selectOne("SixmanDAO.insertSix", vo);
	}
	
	//마감 방 조회
	public List<SixmanVO> getSixEndList(SixmanVO vo) {
		return mybatis.selectList("SixmanDAO.getSixEndList", vo);
	}

}
