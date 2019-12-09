package com.yedam.gca.group_s.service;

import java.util.List;

import com.yedam.gca.admin.vo.TroubleVO;
import com.yedam.gca.group_s.vo.SGroupVO;

public interface SGroupService {
	
	//은영
	SGroupVO getRoomInfo(SGroupVO vo);
	int doReport(TroubleVO vo);
	
	//미현
	List<SGroupVO> getSgList(SGroupVO vo);
	int updateCnt(SGroupVO vo);
	SGroupVO insertSg(SGroupVO vo);
}
