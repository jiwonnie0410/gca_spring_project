package com.yedam.gca.admin.service;

import java.util.List;
import java.util.Map;

public interface AdminService {

	// 반짝 운동별 통계
	public List<Map<String, Object>> chartSgroup();
	// 동호회 매치 운동별 통계
	
	// 연령대 및 운동(반짝) 성별 통계

	// 지역별 반짝 운동 통계
	public List<Map<String, Object>> chartCity(int month, String city);
}
