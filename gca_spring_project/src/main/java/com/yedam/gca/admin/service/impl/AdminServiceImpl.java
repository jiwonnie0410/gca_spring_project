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

	@Override
	public List<Map<String, Object>> chartSgroup() {
		System.out.println("차트: " + dao.chartSgroup());
		return null;
	}

}
