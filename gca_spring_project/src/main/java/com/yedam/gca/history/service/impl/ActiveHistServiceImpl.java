package com.yedam.gca.history.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.gca.group_s.vo.SGroupVO;
import com.yedam.gca.history.dao.ActiveHistDAO;
import com.yedam.gca.history.service.ActiveHistService;
import com.yedam.gca.history.vo.ActiveHistVO;
import com.yedam.gca.member.vo.MembersVO;

@Service("actService")
public class ActiveHistServiceImpl implements ActiveHistService{
	@Autowired	ActiveHistDAO dao;
	
	//*************** 수림 *******************//
	// 유저별 활동히스토리 목록 조회
	@Override
	public List<ActiveHistVO> getActiveHistList() {
		return dao.getActiveHistList();
	}
	
	//반짝 단건 받아옴
	@Override
	public SGroupVO getSgroup(SGroupVO vo) {
		return dao.getSgroup(vo);
	}
	
	
	//***************** 미현 *******************//
	//SGroup+BGroup+Sixman 참여 전 참여 여부 확인 + 마감 인원 파악
	@Override
	public void validIn(ActiveHistVO vo) {
		dao.validIn(vo);
	}

	//SGroup+BGroup+Sixman 방 참여
	@Override
	public void roomInsert(ActiveHistVO vo) {
		dao.roomInsert(vo);
	}
	
	//참여하면서 SGroup+BGroup+Sixman 방에 참여한 인물의 정보 가져오기
	public List<MembersVO> getActMemList(ActiveHistVO vo){
		return dao.getActMemList(vo);
	}


	//***************** 은영 *******************//

}
