package com.yedam.gca.group_s.service.impl;

import java.util.List;
import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yedam.gca.admin.vo.TroubleVO;
import com.yedam.gca.group_s.dao.SGroupDAO;
import com.yedam.gca.group_s.service.SGroupService;
import com.yedam.gca.group_s.vo.SGroupVO;
import com.yedam.gca.history.vo.ActiveHistVO;
import com.yedam.gca.history.vo.ScoreHistVO;
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
	public MembersVO getOneMem(MembersVO vo) {
		return sgroupDAO.getOneMem(vo);
	}
	public ActiveHistVO getOnesAuthority(ActiveHistVO vo) {
		return sgroupDAO.getOnesAuthority(vo);
	}
	public ScoreHistVO getMyTotalScore(MembersVO vo) {
		return sgroupDAO.getMyTotalScore(vo);
	}
	public List<ScoreHistVO> getAllTotalScore(ScoreHistVO vo){
		return sgroupDAO.getAllTotalScore(vo);
	}
	public int updateLevel(MembersVO vo) {
		return sgroupDAO.updateLevel(vo);
	}
	public List<TroubleVO> getHowManyTrouble(TroubleVO vo) {
		return sgroupDAO.getHowManyTrouble(vo);
	}
	public int updateMStatus(MembersVO vo) {
		return sgroupDAO.updateMStatus(vo);
	}

	
	//미현
	@Override
	public List<SGroupVO> getSgList(SGroupVO vo) {
		return sgroupDAO.getSgList(vo);
	}

	@Override
	public int insertSg(SGroupVO vo) {
		return sgroupDAO.insertSg(vo);
	}
	
	@Override
	public int insertSgAlert(SGroupVO vo) {
		return sgroupDAO.insertSgAlert(vo);
	}
	
	@Override
	public List<SGroupVO> getSgEndList(SGroupVO vo) {
		return sgroupDAO.getSgEndList(vo);
	}
	
	@Override
	public SGroupVO getSgCert(SGroupVO vo) {
		return sgroupDAO.getSgCert(vo);
	}

}
