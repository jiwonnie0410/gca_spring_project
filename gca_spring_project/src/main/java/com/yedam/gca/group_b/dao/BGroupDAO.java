package com.yedam.gca.group_b.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yedam.gca.admin.vo.TroubleVO;
import com.yedam.gca.group_b.vo.BGroupVO;
import com.yedam.gca.group_s.vo.SGroupVO;
import com.yedam.gca.history.vo.ActiveHistVO;
import com.yedam.gca.member.vo.MembersVO;

@Repository("bGroupDAO")
public class BGroupDAO {
	
	@Autowired
	SqlSessionTemplate mybatis;
	
//-------------은영	

	//신고하기
	public int doReport(TroubleVO vo) {
		return mybatis.insert("SGroupDAO.doReport", vo);
	}
	//참가 취소 시 활동이력 삭제
	public void cancelJoin(ActiveHistVO vo) {
		mybatis.delete("ActiveHistDAO.cancelJoin", vo);
	}
	//참가 취소 시 방 현재 인원수 -1
	public void minusNowCntBg(ActiveHistVO vo) {
		mybatis.update("BGroupDAO.minusNowCntBg", vo);
	}
	//방 입장 시 웹소켓으로 프로필 이름 반환(입장할때 다른사람들에게 뿌려주기 위해.)
	public String returnImage(MembersVO vo) {
		return mybatis.selectOne("MemberDAO.returnImage", vo);
	}
	//id로 멤버 한명 조회
	public MembersVO getOneMem(MembersVO vo) {
		return mybatis.selectOne("MemberDAO.getOneMem", vo);
	}
	//id로 방장인지 멤버인지 조회
	public ActiveHistVO getOnesAuthority(ActiveHistVO vo) {
		return mybatis.selectOne("ActiveHistDAO.getAuthority", vo);
	}
	
	
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
