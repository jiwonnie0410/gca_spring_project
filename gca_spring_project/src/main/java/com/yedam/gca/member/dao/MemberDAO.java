package com.yedam.gca.member.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yedam.gca.member.vo.MembersVO;

@Repository
public class MemberDAO {

	@Autowired
	SqlSessionTemplate mybatis;
	
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
}
