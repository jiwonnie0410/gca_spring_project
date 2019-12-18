package com.yedam.gca.member.service;

import java.util.Map;

import com.yedam.gca.member.vo.MembersVO;

public interface MemberService {
	
	// 1. 운동하자에서 회원가입
	public Map<String, Object> insertMember(MembersVO vo);
	
	// 2. 아이디 중복 확인
	public int checkId(String id);
	
	// 3. 이름이랑 이메일로 아이디 찾기
	public Map<String, Object> forgotId(MembersVO vo);
	
	// 4. 임시 비밀번호 보내고 디비에 정보 업데이트
	public Map<String, Object> forgotPw(MembersVO vo);
	
	// 5. 비밀번호 변경
	public Map<String, Object> changePw(MembersVO vo);

	// 6. 네이버로 로그인 시 이미 있는 회원인지 확인 후 회원가입
	public String insertNaver(MembersVO vo);
	
	
	
	//진영
	 // 1.회원 정보 상세보기
    public MembersVO viewMember(String m_id);
    //2. 회원삭제
    public void deleteMember(String m_id);
    // 3.회원정보 수정
    public void updateMember(MembersVO vo);
    //비밀번호 확인
	boolean checkPw(String m_id, String m_password);
	//    boolean checkPw(String m_id, String m_password, MembersVO vo);
	
	
	
	
	
	// ************* 수림 ***************** //
	
	// 1. 유저별 알람 정보 가져오기 
	public MembersVO getAlarmInfo(MembersVO vo);
	
	//2. 토글스위치 클릭시 알람 on/off 업데이트	
	public int updateSwitch(MembersVO vo);
	
	// 3. 범위슬라이더 변경시 범위 업데이트
	public void updateRange(MembersVO vo);
}
 

