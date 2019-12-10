package com.yedam.gca.admin.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.gca.admin.dao.MembersDAO;
import com.yedam.gca.admin.service.MembersService;
import com.yedam.gca.member.vo.MembersVO;

@Service
public class MembersServiceImpl implements MembersService {
	@Autowired
	MembersDAO membersDAO;
	@Override
	public MembersVO getUser(MembersVO vo) {
		return membersDAO.getUser(vo);
	}
	@Override
	public List<MembersVO> getUserList(MembersVO vo) {
		return membersDAO.getUserList(vo);
	}
	@Override
	public List<Map> getUserListMap(MembersVO vo) {
		return membersDAO.getUserListMap(vo);
	}
	public int insertUser(MembersVO dto) {		
		return membersDAO.insertUser(dto);		
	}
	public int updateUser(MembersVO dto) {
		return membersDAO.updateUser(dto);
	}
	public int deleteUser(MembersVO dto) {
		return membersDAO.deleteUser(dto);
	}
}
