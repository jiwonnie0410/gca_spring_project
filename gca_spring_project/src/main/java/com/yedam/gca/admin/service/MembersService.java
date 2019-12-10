package com.yedam.gca.admin.service;

import java.util.List;
import java.util.Map;

import com.yedam.gca.member.vo.MembersVO;

public interface MembersService {
	public MembersVO getUser(MembersVO vo);
	public List<MembersVO> getUserList(MembersVO vo);
	public List<Map> getUserListMap(MembersVO user);
	//등록
	public int insertUser(MembersVO vo);
	//수정
	public int updateUser(MembersVO vo);
	//삭제
	public int deleteUser(MembersVO vo);
}
