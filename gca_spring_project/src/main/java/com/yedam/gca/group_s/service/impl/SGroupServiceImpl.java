package com.yedam.gca.group_s.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.gca.group_s.dao.SGroupDAO;
import com.yedam.gca.group_s.service.SGroupService;
import com.yedam.gca.group_s.vo.SGroupVO;

@Service("sGroupService")
public class SGroupServiceImpl implements SGroupService {
	
	@Autowired
	SGroupDAO sgroupDAO;

	
	//은영
	@Override
	public SGroupVO getRoomInfo(SGroupVO vo) {
		return sgroupDAO.getRoomInfo(vo);
	}

	
	//미현
	@Override
	public List<SGroupVO> getSgList(SGroupVO vo) {
		return sgroupDAO.getSgList(vo);
	}

}
