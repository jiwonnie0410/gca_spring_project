package com.yedam.gca.group_b.service;

import java.util.List;

import com.yedam.gca.admin.vo.TroubleVO;
import com.yedam.gca.group_b.vo.BGroupVO;
import com.yedam.gca.history.vo.ActiveHistVO;
import com.yedam.gca.history.vo.ScoreHistVO;
import com.yedam.gca.member.vo.MembersVO;

public interface BGroupService {
	
	//은영
	int doReport(TroubleVO vo);
	void cancelJoin(ActiveHistVO vo);
	String returnImage(MembersVO vo);
	MembersVO getOneMem(MembersVO vo);
	ActiveHistVO getOnesAuthority(ActiveHistVO vo);
	ScoreHistVO getMyTotalScore(MembersVO vo);
	
	//미현
	BGroupVO getRoomInfo(BGroupVO vo);
	
	List<BGroupVO> getBgList(BGroupVO vo);
	void insertBg(BGroupVO vo);
	int insertBgAlert(BGroupVO vo);
	List<BGroupVO> getBgEndList(BGroupVO vo);

}
