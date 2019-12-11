package com.yedam.gca.history.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yedam.gca.group_s.vo.SGroupVO;
import com.yedam.gca.history.vo.ActiveHistVO;
import com.yedam.gca.member.vo.MembersVO;

@Repository
public class ActiveHistDAO {
	@Autowired
	SqlSessionTemplate mybatis;
	
	//************* 수림********************//
	
	// 유저별 활동히스토리 목록 조회
	public List<Map> getActiveHistList(ActiveHistVO vo) {
		return mybatis.selectList("ActiveHistDAO.getActiveHistList", vo);
	}
	
	//아작스

	//모달클릭시 반짝 정보 단건 출력
	public SGroupVO getSgroup(SGroupVO vo) {
		return mybatis.selectOne("ActiveHistDAO.getSgroup", vo);
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
	
	//참여하면서 SGroup+BGroup+Sixman 방에 참여한 인물의 정보 가져오기
	public List<MembersVO> getActMemList(ActiveHistVO vo) {
		return mybatis.selectList("ActiveHistDAO.getActMemList", vo);
	}
	
	
	//*************** 은영 *******************//
}
