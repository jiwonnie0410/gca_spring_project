package com.yedam.gca.admin.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yedam.gca.admin.vo.ChallengeSearchVO;
import com.yedam.gca.admin.vo.MoneyVO;
import com.yedam.gca.challenge.vo.ChallengeVO;
import com.yedam.gca.member.vo.MembersVO;

@Repository
public class AdminDAO {

	@Autowired
	SqlSessionTemplate mybatis;
	
	// 챌린지 목록
	public List<ChallengeVO> challengeList(ChallengeSearchVO svo) {
		return mybatis.selectList("AdminDAO.challengeList", svo);
	}
	
	// 챌린지 건수
	public int challengeCount(ChallengeSearchVO svo) {
		return mybatis.selectOne("AdminDAO.challengeCount", svo);
	}

	// 챌린지 생성
	public int createChallenge(ChallengeVO vo) {
		return mybatis.insert("AdminDAO.insertChallenge", vo);
	}
	
	// 챌린지 진행 현황 / 참여 인원
	public List<ChallengeVO> challengeCount(int cl_num) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cl_num", cl_num);
		return mybatis.selectList("AdminDAO.challenegeCount", map);
	}
	
	// 챌린지 진행 현황 / 챌린지 상세 내용
	public Map<String, Object> challengeDetail(int cl_num) {
		return mybatis.selectOne("AdminDAO.challengeDetail", cl_num);
	}
	
	// 챌린지 진행 현황 / 챌린지 참여한 사람들 목록
	public List<Map<String, Object>> challengePeople(int cl_num) {
		return mybatis.selectList("AdminDAO.challengePeople", cl_num);
	}
	
	// 반짝 운동별 통계
	public List<Map<String, Object>> chartSgroup(){
		return mybatis.selectList("AdminDAO.chartSgroup");
	}
	
	// 동호회 매치 운동별 통계
	public List<Map<String, Object>> chartBgroup(){
		return mybatis.selectList("AdminDAO.chartBgroup");
	}
	
	// 연령대 및 운동(반짝) 성별 통계
	public List<Map<String, Object>> chartGender(String gender){
		return mybatis.selectList("AdminDAO.chartGender", gender);
	}
	
	// 지역별 반짝 운동 통계
	public List<Map<String, Object>> chartCity(int start, int end){
		// 통계를 보기 원하는 기간을 map에 넣어서 mapper 쿼리에 동적으로 넘김
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
	    map.put("end", end);
	    return mybatis.selectList("AdminDAO.chartCity", map);
	}
	
	
	
	
	
	//*************** 수림 **********************//
	
	// 1. 스페셜챌린지 결제완료시 머니 테이블에 이력 남김
	public void insertMoney(MoneyVO vo) {
		mybatis.insert("AdminDAO.insertMoney", vo);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//진영
	@Inject
    // Inject애노테이션이 없으면 sqlSession은 null상태이지만
    // Inject애노테이션이 있으면 외부에서 객체를 주입시켜주게 된다. 
    // try catch문, finally문, 객체를 close할 필요가 없어졌다.
    SqlSession sqlSession;
	
	  // 회원 정보 상세보기
	  // 03. 회원 정보 상세 조회
    public MembersVO viewMember(String m_id) {
        return sqlSession.selectOne("AdminDAO.viewMember", m_id);
    }
    //2.전체조회
	public List<MembersVO> getUserList(MembersVO user) {
		return mybatis.selectList("AdminDAO.getUserList", user);
	}

	// 삭제
	public int deleteUser(MembersVO dto) {
		System.out.println("mybatis 사용자 삭제");
		return mybatis.delete("AdminDAO.deleteUser", dto);
	}
	
	
	
	
	
}


