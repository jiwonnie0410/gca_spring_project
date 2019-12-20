package com.yedam.gca.admin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.gca.admin.dao.AlertDAO;
import com.yedam.gca.admin.service.AlertService;
import com.yedam.gca.admin.vo.AlertVO;

@Service
public class AlertServiceImpl implements AlertService {
	
	@Autowired
	AlertDAO alertDAO;

	@Override
	public int getAlertCnt(AlertVO vo) {
		return alertDAO.getAlertCnt(vo);
	}

	@Override
	public List<AlertVO> getAlertList(AlertVO vo) {
		return alertDAO.getAlertList(vo);
	}

	@Override
	public List<AlertVO> getAlertNotRead(AlertVO vo) {
		return alertDAO.getAlertNotRead(vo);
	}

	@Override
	public List<AlertVO> getAlertRead(AlertVO vo) {
		return alertDAO.getAlertRead(vo);
	}

	@Override
	public List<AlertVO> updateAlertRea(AlertVO vo) {
		return alertDAO.updateAlertRea(vo);
	}

}
