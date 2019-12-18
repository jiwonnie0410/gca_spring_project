package com.yedam.gca.group_b.service.impl;

import java.util.List;
import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yedam.gca.admin.vo.TroubleVO;
import com.yedam.gca.group_b.dao.BGroupDAO;
import com.yedam.gca.group_b.service.BGroupService;
import com.yedam.gca.group_b.vo.BGroupVO;
import com.yedam.gca.history.vo.ActiveHistVO;
import com.yedam.gca.member.vo.MembersVO;

@Service("bGroupService")
public class BGroupServiceImpl implements BGroupService {
	
	@Resource 	BGroupDAO bgroupDAO;

	
	//은영	
	
	public int doReport(TroubleVO vo) {
		return bgroupDAO.doReport(vo);
	}
	public void cancelJoin(ActiveHistVO vo) {
		bgroupDAO.cancelJoin(vo);
		bgroupDAO.minusNowCntBg(vo);
	}
	public String returnImage(MembersVO vo) {
		return bgroupDAO.returnImage(vo);
	}
	public MembersVO getOneMem(MembersVO vo) {
		return bgroupDAO.getOneMem(vo);
	}
	public ActiveHistVO getOnesAuthority(ActiveHistVO vo) {
		return bgroupDAO.getOnesAuthority(vo);
	}
	
	
	
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
