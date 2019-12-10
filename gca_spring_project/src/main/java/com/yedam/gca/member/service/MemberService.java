package com.yedam.gca.member.service;

import com.yedam.gca.member.vo.MembersVO;

public interface MemberService {
	
	// 1. 회원가입
	public int insertMember(MembersVO vo);
	
	// 2. 아이디 중복 확인
	public int checkId(String id);
	
	// 3. 이름이랑 이메일로 아이디 찾기
	public String forgotId(MembersVO vo);
	
	// 4. 임시 비밀번호 보내고 디비에 정보 업데이트
	public String forgotPw(MembersVO vo);

	
	
	
//	
//	//진영
//	 // 01. 회원 정보 상세 조회 
//    @Override
//    public MemberVO viewMember(String userId) {
//        return memberDao.viewMember(userId);
//    }
//    // 02. 회원 정보 수정 처리
//    @Override
//    public void deleteMember(String userId) {
//        memberDao.deleteMember(userId);
//    }
//    // 03. 회원 정보 삭제 처리
//    @Override
//    public void updateMember(MemberVO vo) {
//        memberDao.updateMember(vo);
//    }
//    // 04. 회원 정보 수정 및 삭제를 위한 비밀번호 체크
//    @Override
//    public boolean checkPw(String userId, String userPw) {
//        return memberDao.checkPw(userId, userPw);
//    }
// 

}
