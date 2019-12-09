package com.yedam.gca.admin.service;

import java.util.List;
import java.util.Map;

import com.yedam.gca.challenge.vo.ChallengeVO;

public interface AdminService {

	// 1. 챌린지 생성
	public String createChallenge(ChallengeVO vo);
	
	// 2. 반짝 운동별 통계
	public List<Map<String, Object>> chartSgroup();
	
	// 3. 동호회 매치 운동별 통계
	public List<Map<String, Object>> chartBgroup();
	
	// 4. 연령대 및 운동(반짝) 성별 통계
	public List<Map<String, Object>> chartGender(String gender, int startAge, int endAge);

	// 5. 지역별 반짝 운동 통계
	public List<Map<String, Object>> chartCity(String month, String city);
	
}
