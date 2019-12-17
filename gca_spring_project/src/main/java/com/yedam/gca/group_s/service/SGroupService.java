package com.yedam.gca.group_s.service;

import java.util.List;

import com.yedam.gca.admin.vo.TroubleVO;
import com.yedam.gca.common.code.vo.CodeVO;
import com.yedam.gca.group_s.vo.SGroupVO;
import com.yedam.gca.history.vo.ActiveHistVO;
import com.yedam.gca.member.vo.MembersVO;

public interface SGroupService {
	
	//은영
	SGroupVO getRoomInfo(SGroupVO vo);
	int doReport(TroubleVO vo);
	void cancelJoin(ActiveHistVO vo);
	String returnImage(MembersVO vo);
	MembersVO getOneMem(MembersVO vo);
	ActiveHistVO getOnesAuthority(ActiveHistVO vo);
			
	
	//미현
	List<SGroupVO> getSgList(SGroupVO vo);
	void insertSg(SGroupVO vo);
	List<SGroupVO> getSgEndList(SGroupVO vo);
	SGroupVO getSgCert(SGroupVO vo);

}
