package com.yedam.gca.member.dao;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yedam.gca.member.vo.MembersVO;

@Repository
public class MemberDAO {

	@Autowired
	SqlSessionTemplate mybatis;
	
	@Inject
    // Inject애노테이션이 없으면 sqlSession은 null상태이지만
    // Inject애노테이션이 있으면 외부에서 객체를 주입시켜주게 된다. 
    // try catch문, finally문, 객체를 close할 필요가 없어졌다.
    SqlSession sqlSession;
	
	// 1. 회원가입
	public int insertMember(MembersVO vo) {
		return mybatis.insert("MemberDAO.insertMember", vo);
	}
	
	// 2. 아이디 중복 확인
	public int checkId(String id) {
		return mybatis.selectOne("MemberDAO.checkId", id);
	}
	
	// 3. 이름이랑 이메일로 아이디 찾기
	public String forgotId(MembersVO vo) {
		return mybatis.selectOne("MemberDAO.forgotId", vo);
	}
	
	// 4-1. 비밀번호 찾기에 입력 받은 정보로 회원 확인하기
	public int forgotPw(MembersVO vo) {
		return mybatis.selectOne("MemberDAO.forgotPw", vo);
	}
	
	// 4-2. 임시 비밀번호로 업데이트 하기
	public int updateTempPw(MembersVO vo) {
		return mybatis.update("MemberDAO.updateTempPw", vo);
	}
	
	// 5. 로그인 체크 (회원 한명 조회)
	public MembersVO loginCheck(MembersVO vo) {
		return mybatis.selectOne("MemberDAO.loginCheck", vo);
	}
	
	// 6. 비밀번호 변경
	public int changePassword(MembersVO vo) {
		return mybatis.update("MemberDAO.changePassword", vo);
	}
	
	
	
	// **************** 수림 *******************//
	// 1. 유저별 알람 정보 가져오기
	public MembersVO getAlarmInfo(MembersVO vo) {
		return mybatis.selectOne("MemberDAO.getAlarmInfo", vo);
	}
	
	// 2. 토글스위치 클릭시 알람 on/off 업데이트
	public int updateSwitch(MembersVO vo) {
		return mybatis.update("MemberDAO.updateSwitch", vo);
	}
	
	// 3. 범위슬라이더 변경시 범위 업데이트
	
	
	
	
	
	
	
	
	//진영
	
	
	  // 회원 정보 상세보기
	  // 03. 회원 정보 상세 조회
    public MembersVO viewMember(String m_id) {
        return sqlSession.selectOne("MemberDAO.viewMember", m_id);
    }
    // 04. 회원 정보 수정 처리
    public void deleteMember(String m_id) {
        sqlSession.delete("MemberDAO.deleteMember",m_id);
    }
    // 05. 회원 정보 삭제 처리
    public void updateMember(MembersVO vo) {
        sqlSession.update("MemberDAO.updateMember", vo);
 
    }
    // 06. 회원 정보 수정 및 삭제를 위한 비밀번호 체크
    public boolean checkPw(String m_id, String m_password) {
        boolean result = false;
        Map<String, String> map = new HashMap<String, String>();
        map.put("m_id", m_id);
        map.put("m_password", m_password);
        int count = sqlSession.selectOne("MemberDAO.checkPw", map);
        if(count == 1) result= true;
        return result;
    };
}
