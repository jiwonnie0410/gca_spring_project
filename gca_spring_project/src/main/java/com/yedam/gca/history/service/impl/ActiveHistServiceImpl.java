package com.yedam.gca.history.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.gca.group_s.vo.SGroupVO;
import com.yedam.gca.history.dao.ActiveHistDAO;
import com.yedam.gca.history.service.ActiveHistService;
import com.yedam.gca.history.vo.ActiveHistVO;

@Service
public class ActiveHistServiceImpl implements ActiveHistService{
	@Autowired	ActiveHistDAO dao;
	
	//*************** 수림 *******************//
	// 유저별 활동히스토리 목록 조회
	@Override
	public List<ActiveHistVO> getActiveHistList() {
		return dao.getActiveHistList();
	}

	//모달클릭시 반짝 정보 단건 출력
	@Override
	public SGroupVO getSgroup(SGroupVO vo) {
		return dao.getSgroup(vo);
	}

}
