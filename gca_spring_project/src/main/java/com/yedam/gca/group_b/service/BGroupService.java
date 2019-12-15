package com.yedam.gca.group_b.service;

import java.util.List;

import com.yedam.gca.group_b.vo.BGroupVO;

public interface BGroupService {
	
	//은영
			
	
	//미현
	BGroupVO getRoomInfo(BGroupVO vo);
	
	List<BGroupVO> getBgList(BGroupVO vo);
	void insertBg(BGroupVO vo);
	List<BGroupVO> getBgEndList(BGroupVO vo);

}
