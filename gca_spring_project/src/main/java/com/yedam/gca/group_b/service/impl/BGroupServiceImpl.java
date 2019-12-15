package com.yedam.gca.group_b.service.impl;

import java.util.List;
import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yedam.gca.group_b.dao.BGroupDAO;
import com.yedam.gca.group_b.service.BGroupService;
import com.yedam.gca.group_b.vo.BGroupVO;

@Service("bGroupService")
public class BGroupServiceImpl implements BGroupService {
	
	@Resource 	BGroupDAO bgroupDAO;

	
	//은영	

	
	
	
	//미현
	@Override
	public BGroupVO getRoomInfo(BGroupVO vo) {
		return bgroupDAO.getRoomInfo(vo);
	}
	
	@Override
	public List<BGroupVO> getBgList(BGroupVO vo) {
		return bgroupDAO.getBgList(vo);
	}

	@Override
	public void insertBg(BGroupVO vo) {
		bgroupDAO.insertBg(vo);
	}
	@Override
	public List<BGroupVO> getBgEndList(BGroupVO vo) {
		return bgroupDAO.getBgEndList(vo);
	}

}
