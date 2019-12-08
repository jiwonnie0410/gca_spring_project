package com.yedam.gca.admin.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yedam.gca.admin.dao.AdminDAO;
import com.yedam.gca.admin.service.AdminService;
import com.yedam.gca.challenge.vo.ChallengeVO;

@Service
public class AdminServiceImpl implements AdminService {

	@Resource AdminDAO dao;

	// 1. 챌린지 생성
	@Override
	public String createChallenge(ChallengeVO vo) {
		dao.createChallenge(vo);

		// 챌린지 생성되면 생성됐다고 메시지 날리기
		return null;
	}

	// 2. 반짝 운동별 통계
	@Override
	public List<Map<String, Object>> chartSgroup() {
		System.out.println("차트: " + dao.chartSgroup());
		return null;
	}

	// 3. 동호회 매치 운동별 통계

	// 4. 연령대 및 운동(반짝) 성별 통계

	// 5. 지역별 반짝 운동 통계
	@Override
	public List<Map<String, Object>> chartCity(int month, String city) {
		return dao.chartCity(month, city);
	}

}
