package com.yedam.gca.admin.service.impl;

import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yedam.gca.admin.dao.AdminDAO;
import com.yedam.gca.admin.service.AdminService;
import com.yedam.gca.admin.vo.ChallengeSearchVO;
import com.yedam.gca.admin.vo.MoneyVO;
import com.yedam.gca.admin.vo.TroubleVO;
import com.yedam.gca.board.vo.AdBoardVO;
import com.yedam.gca.challenge.vo.ChallengeVO;
import com.yedam.gca.common.Paging;
import com.yedam.gca.member.vo.MembersVO;

@Service
public class AdminServiceImpl implements AdminService {

	@Resource
	AdminDAO dao;

	// 지원 1-7번
	// 1. 페이징 처리를 한 챌린지 목록
	@Override
	public List<ChallengeVO> challengeList(ChallengeSearchVO svo, Paging paging) {
		//출력건수
		paging.setPageUnit(5);
		// 페이지번호 파라미터
		if( paging.getPage() == null) {
			paging.setPage(1); 
		}		
		// 시작/마지막 레코드 번호
		svo.setStart(paging.getFirst());
		svo.setEnd(paging.getLast());		
		// 전체 건수
		paging.setTotalRecord(dao.challengeCount(svo));
		return dao.challengeList(svo);
	}

	// 2. 챌린지 생성
	@Override
	public int createChallenge(ChallengeVO vo) {
		int result = dao.createChallenge(vo);
		return result;
	}

	// 3. 반짝 운동별 통계
	@Override
	public List<Map<String, Object>> chartSgroup() {
		return dao.chartSgroup();
	}

	// 4. 동호회 매치 운동별 통계
	@Override
	public List<Map<String, Object>> chartBgroup() {
		return dao.chartBgroup();
	}

	// 5. 연령대 및 운동(반짝) 성별 통계
	@Override
	public Map<String, List<Map<String, Object>>> chartGender() {
		Map<String, List<Map<String, Object>>> map = new HashMap<String, List<Map<String, Object>>>();
		map.put("female", dao.chartGender("G01"));
		map.put("male", dao.chartGender("G02"));
		return map;
	}

	// 6. 지역별 반짝 운동 통계
	@Override
	public List<Map<String, Object>> chartCity() {
		Calendar calendar = new GregorianCalendar(Locale.KOREA);
		int endMonth = calendar.get(Calendar.MONTH) + 1; 	// 현재 달   	12월
		int startMonth = endMonth - 3;						// 3개월 전  	9월
		return dao.chartCity(startMonth, endMonth);
	}

	// 7. 챌린지 진행 현황
	@Override
	public Map<String, Object> challengeGoing(int cl_id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("count", dao.challengeCount(cl_id));
		map.put("detail", dao.challengeDetail(cl_id));
		map.put("people", dao.challengePeople(cl_id));
		return map;
	}
	
	// 8. 일별 수익 현황
	@Override
	public List<Map<String, Object>> chartDaily(String start, String end) {
		return dao.chartDaily(start, end);
	}

	// 9. 월별 수익 현황
	@Override
	public List<Map<String, Object>> chartMonthly(String start, String end) {
		return dao.chartMonthly(start, end);
	}

	

	
	
	
	
	
	
	
	
	
	
	

	// 진영
			// 01. 회원 정보 상세 조회
			@Override
			public MembersVO viewMember(String m_id) {
				return dao.viewMember(m_id);
			}

			// 전체조회
			@Override
			public List<MembersVO> getUserList(MembersVO vo) {
				return dao.getUserList(vo);
			}

			// 회원삭제
			public int deleteUser(MembersVO dto) {
				return dao.deleteUser(dto);
			}

			// trouble 전체 목록
			@Override
			public List<TroubleVO> listAll(int start, int end, String searchOption, String keyword) throws Exception {
				return dao.listAll(start, end, searchOption, keyword);
			}

			// trouble 레코드 갯수
			@Override
			public int countArticle(String searchOption, String keyword) throws Exception {
				return dao.countArticle(searchOption, keyword);
			}

		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// ****************** 수림  ************************//
	
	//1. 부분환불용 고유번호 리스트 조회
	@Override
	public List<Map<String, Object>> getPartialRefundList() {
		return dao.getPartialRefundList();
	}
	
	// 2. 부분환불 완료후 환불정보를 Money 테이블에 업데이트
	@Override
	public void updatePartialRefundList() {
		dao.updatePartialRefundList();
	}
		
	// 3. 전액환불용 고유번호 리스트 조회
	public List<Map<String, Object>> getFullRefundList() {
		return dao.getFullRefundList();
	}
	
	// 4. 전액환불 완료 후 환불정보를 Money 테이블에 업데이트
	public void updateFullRefundList() {
		dao.updateFullRefundList();
	}

	@Override
	// 5. 부트페이 App Id, Private key 조회
	public Map<String, String> getBootpayInfo() {
		return dao.getBootpayInfo();
	}
	
	// 2020.01.27 추가
	// 6. 사용자 실패한 챌린지 상태 '실패'로 변경 (성공은 인증시 디비단에서 적용)
	public void updateFailChallengeStatus() {
		dao.updateFailChallengeStatus();
	}
}
