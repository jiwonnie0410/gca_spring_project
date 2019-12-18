package com.yedam.gca.admin.service;

import java.util.List;
import java.util.Map;

import com.yedam.gca.admin.vo.ChallengeSearchVO;
import com.yedam.gca.admin.vo.MoneyVO;
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
	public List<Map<String, Object>> chartDaily();
	
	// 9. 월별 수익 현황
	public List<Map<String, Object>> chartMonthly();
	

	
		//진영
		 // 1.회원 정보 상세보기
	    public MembersVO viewMember(String m_id);
	    //2.회원전체조회
		public List<MembersVO> getUserList(MembersVO vo);
		//3.회원강퇴
		public int deleteUser(MembersVO vo);

		int countArticle(String searchOption, String keyword) throws Exception;

		List<AdBoardVO> listAll(int start, int end, String searchOption, String keyword) throws Exception;
	
	
	
	
}
