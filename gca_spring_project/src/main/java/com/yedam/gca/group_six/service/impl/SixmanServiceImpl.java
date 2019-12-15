package com.yedam.gca.group_six.service.impl;

import java.util.List;
import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yedam.gca.group_six.dao.SixmanDAO;
import com.yedam.gca.group_six.service.SixmanService;
import com.yedam.gca.group_six.vo.SixmanVO;

@Service("sixmanService")
public class SixmanServiceImpl implements SixmanService {
	
	@Resource 	SixmanDAO sixmanDAO;

	
	//은영	

	
	
	
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
