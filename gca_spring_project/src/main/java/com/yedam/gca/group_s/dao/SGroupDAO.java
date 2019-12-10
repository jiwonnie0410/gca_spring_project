package com.yedam.gca.group_s.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yedam.gca.admin.vo.TroubleVO;
import com.yedam.gca.group_s.vo.SGroupVO;
import com.yedam.gca.history.vo.ActiveHistVO;

@Repository("sGroupDAO")
public class SGroupDAO {
	
	@Autowired
	SqlSessionTemplate mybatis;
	
//-------------은영	
	public SGroupVO getRoomInfo(SGroupVO vo) {
		return mybatis.selectOne("SGroupDAO.getRoomInfo", vo);
	}
	
	public int doReport(TroubleVO vo) {
		return mybatis.insert("SGroupDAO.doReport", vo);
	}
	
	public void cancelJoin(String id) {
		mybatis.delete("ActiveHistDAO.cancelJoin", id);
	}
	
	
//-------------미현
	
	//반짝 목록 조회
	public List<SGroupVO> getSgList(SGroupVO vo) {
		return mybatis.selectList("SGroupDAO.getSgList", vo);
	}
	
	//참여 시 cnt 업데이트 하기(수정 필요)
	public int updateCnt(SGroupVO vo) {
		return mybatis.update("SGroupDAO.updateCnt", vo);
	}
	 
	//반짝 방 생성
	public void insertSg(SGroupVO vo){
		mybatis.selectOne("SGroupDAO.insertSg", vo);
	}
	

}
