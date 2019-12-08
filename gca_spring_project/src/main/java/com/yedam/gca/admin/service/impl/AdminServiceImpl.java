package com.yedam.gca.admin.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yedam.gca.admin.dao.AdminDAO;
import com.yedam.gca.admin.service.AdminService;

@Service
public class AdminServiceImpl implements AdminService {

	@Resource AdminDAO dao;

	// 반짝 운동별 통계
	@Override
	public List<Map<String, Object>> chartSgroup() {
		System.out.println("차트: " + dao.chartSgroup());
		return null;
	}

	// 동호회 매치 운동별 통계

	// 연령대 및 운동(반짝) 성별 통계

	// 지역별 반짝 운동 통계
	@Override
	public List<Map<String, Object>> chartCity(int month, String city) {
		return dao.chartCity(month, city);
	}

}
