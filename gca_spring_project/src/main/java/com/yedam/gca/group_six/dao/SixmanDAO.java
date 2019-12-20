package com.yedam.gca.group_six.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yedam.gca.admin.vo.TroubleVO;
import com.yedam.gca.group_six.vo.SixmanVO;
import com.yedam.gca.history.vo.ActiveHistVO;
import com.yedam.gca.history.vo.ScoreHistVO;
import com.yedam.gca.member.vo.MembersVO;

@Repository("sixmanDAO")
public class SixmanDAO {
	
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
	//참가 취소 시 반짝방 현재 인원수 -1
	public void minusNowCntSix(ActiveHistVO vo) {
		mybatis.update("sixmanDAO.minusNowCntSix", vo);
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
	//id로 본인의 점수 합계 조회
	public ScoreHistVO getMyTotalScore(MembersVO vo) {
		return mybatis.selectOne("ScoreHistDAO.getMyTotalScore", vo);
	}
	
	
	
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
