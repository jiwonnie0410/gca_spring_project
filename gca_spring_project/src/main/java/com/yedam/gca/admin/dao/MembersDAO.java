package com.yedam.gca.admin.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yedam.gca.member.vo.MembersVO;

@Repository
public class MembersDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	public List<MembersVO> getUserList(MembersVO user) {
		return mybatis.selectList("MembersDAO.getUserList", user);
	}

	public MembersVO getUser(MembersVO user) {
		return mybatis.selectOne("MembersDAO.getUser", user);
	}

	public List<Map> getUserListMap(MembersVO user) {
		return mybatis.selectList("MembersDAO.getUserListMap", user);
	}

	// 등록
	public int insertUser(MembersVO dto) {
		System.out.println("mybatis 사용자 등록");
		return mybatis.insert("MembersDAO.insertUser", dto);
	}

	// 수정
	public int updateUser(MembersVO dto) {
		System.out.println("mybatis 사용자 수정");
		return mybatis.update("MembersDAO.updateUser", dto);
	}

	// 삭제
	public int deleteUser(MembersVO dto) {
		System.out.println("mybatis 사용자 삭제");
		return mybatis.delete("MembersDAO.deleteUser", dto);
	}
}
