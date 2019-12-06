package com.yedam.gca.member.service;

import com.yedam.gca.member.vo.MembersVO;

public interface MemberService {
	
	// 회원가입
	public int insertMember(MembersVO vo);
	
	// 아이디 중복 확인
	public int checkId(String id);
}
