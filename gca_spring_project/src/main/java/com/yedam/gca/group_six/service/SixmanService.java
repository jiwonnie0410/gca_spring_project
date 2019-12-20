package com.yedam.gca.group_six.service;

import java.util.List;

import com.yedam.gca.admin.vo.TroubleVO;
import com.yedam.gca.group_six.vo.SixmanVO;
import com.yedam.gca.history.vo.ActiveHistVO;
import com.yedam.gca.history.vo.ScoreHistVO;
import com.yedam.gca.member.vo.MembersVO;

public interface SixmanService {
	
	//은영
	int doReport(TroubleVO vo);
	void cancelJoin(ActiveHistVO vo);
	String returnImage(MembersVO vo);
	MembersVO getOneMem(MembersVO vo);
	ActiveHistVO getOnesAuthority(ActiveHistVO vo);
	ScoreHistVO getMyTotalScore(MembersVO vo);
	
	//미현
	SixmanVO getRoomInfo(SixmanVO vo);
	
	List<SixmanVO> getSixList(SixmanVO vo);
	void insertSix(SixmanVO vo);
	List<SixmanVO> getSixEndList(SixmanVO vo);

}
