package com.yedam.gca.group_six.service.impl;

import java.util.List;
import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yedam.gca.admin.vo.TroubleVO;
import com.yedam.gca.group_six.dao.SixmanDAO;
import com.yedam.gca.group_six.service.SixmanService;
import com.yedam.gca.group_six.vo.SixmanVO;
import com.yedam.gca.history.vo.ActiveHistVO;
import com.yedam.gca.history.vo.ScoreHistVO;
import com.yedam.gca.member.vo.MembersVO;

@Service("sixmanService")
public class SixmanServiceImpl implements SixmanService {
	
	@Resource 	SixmanDAO sixmanDAO;

	
	//은영	

	public int doReport(TroubleVO vo) {
		return sixmanDAO.doReport(vo);
	}
	public void cancelJoin(ActiveHistVO vo) {
		sixmanDAO.cancelJoin(vo);
		sixmanDAO.minusNowCntSix(vo);
	}
	public String returnImage(MembersVO vo) {
		return sixmanDAO.returnImage(vo);
	}
	public MembersVO getOneMem(MembersVO vo) {
		return sixmanDAO.getOneMem(vo);
	}
	public ActiveHistVO getOnesAuthority(ActiveHistVO vo) {
		return sixmanDAO.getOnesAuthority(vo);
	}
	public ScoreHistVO getMyTotalScore(MembersVO vo) {
		return sixmanDAO.getMyTotalScore(vo);
	}
	
	
	//미현
	@Override
	public SixmanVO getRoomInfo(SixmanVO vo) {
		return sixmanDAO.getRoomInfo(vo);
	}
	
	@Override
	public List<SixmanVO> getSixList(SixmanVO vo) {
		return sixmanDAO.getSixList(vo);
	}

	@Override
	public void insertSix(SixmanVO vo) {
		sixmanDAO.insertSix(vo);
	}
	@Override
	public List<SixmanVO> getSixEndList(SixmanVO vo) {
		return sixmanDAO.getSixEndList(vo);
	}

}
