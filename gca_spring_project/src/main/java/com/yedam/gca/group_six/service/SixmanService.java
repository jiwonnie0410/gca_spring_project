package com.yedam.gca.group_six.service;

import java.util.List;

import com.yedam.gca.group_six.vo.SixmanVO;

public interface SixmanService {
	
	//은영
			
	
	//미현
	SixmanVO getRoomInfo(SixmanVO vo);
	
	List<SixmanVO> getSixList(SixmanVO vo);
	void insertSix(SixmanVO vo);
	List<SixmanVO> getSixEndList(SixmanVO vo);

}
