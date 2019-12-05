package com.yedam.gca.member.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yedam.gca.member.dao.MemberDAO;
import com.yedam.gca.member.service.MemberService;
import com.yedam.gca.member.service.SHA256Util;
import com.yedam.gca.member.vo.MembersVO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Resource MemberDAO dao;

	// 회원가입
	@Override
	public int insertMember(MembersVO vo) {
		// 비밀번호 암호화
		String salt = SHA256Util.generateSalt();								// 1. 암호화 키 생성
		String newPassword = SHA256Util.getEncrypt(vo.getM_password(), salt);	// 2. 비밀번호 암호화
		vo.setM_salt(salt);														// 3. vo에 암호화 키 넣기
		vo.setM_password(newPassword);											// 4. vo에 암호화된 비밀번호 넣기
		
		return dao.insertMember(vo);
	}

	// 아이디 중복 확인
	@Override
	public int checkId(String id) {
		return dao.checkId(id);
	}

}
