package com.yedam.gca.admin.service;

import java.util.List;
import java.util.Map;

import com.yedam.gca.admin.vo.ChallengeSearchVO;
import com.yedam.gca.admin.vo.MoneyVO;
import com.yedam.gca.admin.vo.TroubleVO;
import com.yedam.gca.board.vo.AdBoardVO;
import com.yedam.gca.challenge.vo.ChallengeVO;
import com.yedam.gca.common.Paging;
import com.yedam.gca.member.vo.MembersVO;

public interface AdminService {

	// 지원 1-7번
	// 1. 챌린지 생성
	public int createChallenge(ChallengeVO vo);
	
	// 2. 반짝 운동별 통계
	public List<Map<String, Object>> chartSgroup();
	
	// 3. 동호회 매치 운동별 통계
	public List<Map<String, Object>> chartBgroup();
	
	// 4. 연령대 및 운동(반짝) 성별 통계
	public Map<String, List<Map<String, Object>>> chartGender();

	// 5. 지역별 반짝 운동 통계
	public List<Map<String, Object>> chartCity();
	
	// 6. 챌린지 목록
	public List<ChallengeVO> challengeList(ChallengeSearchVO svo, Paging p);
	
	// 7. 챌린지 진행 현황
	public Map<String, Object> challengeGoing(int cl_id);
	
	// 8. 일별 수익 현황
	public List<Map<String, Object>> chartDaily(String start, String end);
	
	// 9. 월별 수익 현황
	public List<Map<String, Object>> chartMonthly(String start, String end);
	

	
		//진영
		 // 1.회원 정보 상세보기
	    public MembersVO viewMember(String m_id);
	    //2.회원전체조회
		public List<MembersVO> getUserList(MembersVO vo);
		//3.회원강퇴
		public int deleteUser(MembersVO vo);

		
		
		
		public int countArticle(String searchOption, String keyword) throws Exception;

		public List<TroubleVO> listAll(int start, int end, String searchOption, String keyword) throws Exception;
	
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		// ****************** 수림  ************************//
	
	//1. 부분환불용 고유번호 리스트 조회
	public List<Map<String, Object>> getPartialRefundList();
	
	// 2. 부분환불 완료후 환불정보를 Money 테이블에 업데이트
	public void updatePartialRefundList();
	
	// 3. 전액환불용 고유번호 리스트 조회
	public List<Map<String, Object>> getFullRefundList();
	
	// 4. 전액환불 완료 후 환불정보를 Money 테이블에 업데이트
	public void updateFullRefundList();
	
	// 5. 부트페이 App Id, Private key 조회
	public Map<String, String> getBootpayInfo();
	
	
}
