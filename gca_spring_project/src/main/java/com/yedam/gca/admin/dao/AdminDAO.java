package com.yedam.gca.admin.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yedam.gca.challenge.vo.ChallengeVO;

@Repository
public class AdminDAO {

	@Autowired
	SqlSessionTemplate mybatis;
	
	// 챌린지 생성
	public int createChallenge(ChallengeVO vo) {
		return mybatis.insert("AdminDAO.insertChallenge", vo);
	}
	
	// 반짝 운동별 통계
	public List<Map<String, Object>> chartSgroup(){
		return mybatis.selectList("AdminDAO.chartSgroup");
	}
	
	// 동호회 매치 운동별 통계
	
	// 연령대 및 운동(반짝) 성별 통계
	
	// 지역별 반짝 운동 통계
	public List<Map<String, Object>> chartCity(int month, String city){
		Map<String, Object> map = new HashMap<String, Object>();
	    map.put("month", month);
	    map.put("city", city);
	    return mybatis.selectList("AdminDAO.chartCity", map);
	}
	
}