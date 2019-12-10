package com.yedam.gca.admin.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yedam.gca.admin.dao.AdminDAO;
import com.yedam.gca.admin.service.AdminService;
import com.yedam.gca.challenge.vo.ChallengeVO;
import com.yedam.gca.member.vo.MembersVO;

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
		return dao.chartSgroup();
	}

	// 3. 동호회 매치 운동별 통계
	@Override
	public List<Map<String, Object>> chartBgroup() {
		return dao.chartBgroup();
	}
	
	// 4. 연령대 및 운동(반짝) 성별 통계
	@Override
	public List<Map<String, Object>> chartGender(String gender, int startAge, int endAge) {
		return dao.chartGender(gender, startAge, endAge);
	}

	// 5. 지역별 반짝 운동 통계
	@Override
	public List<Map<String, Object>> chartCity(String month, String city) {
		return dao.chartCity(month, city);
	}


	
	
	
	
	
	
	
	
	
	
	
	//진영
		 // 01. 회원 정보 상세 조회 
	    @Override
	    public MembersVO viewMember(String m_id) {
	        return dao.viewMember(m_id);
	    }
		//전체조회
		@Override
		public List<MembersVO> getUserList(MembersVO vo) {
			return dao.getUserList(vo);
		}
		//회원삭제
		public int deleteUser(MembersVO dto) {
			return dao.deleteUser(dto);
		}
}
