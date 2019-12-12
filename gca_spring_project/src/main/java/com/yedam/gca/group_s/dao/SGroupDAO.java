package com.yedam.gca.group_s.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yedam.gca.admin.vo.TroubleVO;
import com.yedam.gca.common.code.vo.CodeVO;
import com.yedam.gca.group_s.vo.SGroupVO;
import com.yedam.gca.history.vo.ActiveHistVO;
import com.yedam.gca.member.vo.MembersVO;

@Repository("sGroupDAO")
public class SGroupDAO {
	
	@Autowired
	SqlSessionTemplate mybatis;
	
//-------------은영	
	//방정보 한건 조회
	public SGroupVO getRoomInfo(SGroupVO vo) {
		return mybatis.selectOne("SGroupDAO.getRoomInfo", vo);
	}
	//신고하기
	public int doReport(TroubleVO vo) {
		return mybatis.insert("SGroupDAO.doReport", vo);
	}
	//참가 취소 시 활동이력 삭제
	public void cancelJoin(ActiveHistVO vo) {
		mybatis.delete("ActiveHistDAO.cancelJoin", vo);
	}
	//참가 취소 시 반짝방 현재 인원수 -1
	public void minusNowCnt(ActiveHistVO vo) {
		mybatis.update("SGroupDAO.minusNowCnt", vo);
	}
	//방 입장 시 웹소켓으로 프로필 코드 반환(입장할때 다른사람들에게 뿌려주기 위해.)
	public String returnImage(String id) {
		return mybatis.selectOne("SGroupDAO.returnImage", id);
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
	
	//마감 방 조회
	public List<SGroupVO> getSgEndList(SGroupVO vo) {
		return mybatis.selectList("SGroupDAO.getSgEndList", vo);
	}

}
