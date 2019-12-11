package com.yedam.gca.group_s.service.impl;

import java.util.List;
import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yedam.gca.admin.vo.TroubleVO;
import com.yedam.gca.group_s.dao.SGroupDAO;
import com.yedam.gca.group_s.service.SGroupService;
import com.yedam.gca.group_s.vo.SGroupVO;
import com.yedam.gca.history.vo.ActiveHistVO;
import com.yedam.gca.member.vo.MembersVO;

@Service("sGroupService")
public class SGroupServiceImpl implements SGroupService {
	
	@Resource
	SGroupDAO sgroupDAO;

	
	//은영
	@Override
	public SGroupVO getRoomInfo(SGroupVO vo) {
		return sgroupDAO.getRoomInfo(vo);
	}
	public int doReport(TroubleVO vo) {
		return sgroupDAO.doReport(vo);
	}
	public void cancelJoin(ActiveHistVO vo) {
		sgroupDAO.cancelJoin(vo);
		sgroupDAO.minusNowCnt(vo);
	}
	public String returnImage(MembersVO vo) {
		return sgroupDAO.returnImage(vo);
	}
	

	
	//미현
	@Override
	public List<SGroupVO> getSgList(SGroupVO vo) {
		return sgroupDAO.getSgList(vo);
	}

	@Override
	public int updateCnt(SGroupVO vo) {
		return sgroupDAO.updateCnt(vo);
	}

	@Override
	public void insertSg(SGroupVO vo) {
		sgroupDAO.insertSg(vo);
	}

}
