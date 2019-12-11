package com.yedam.gca.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.yedam.gca.member.dao.MemberDAO;
import com.yedam.gca.member.vo.MembersVO;

public class CustomUserDetailsService implements UserDetailsService {
	
	@Autowired MemberDAO dao;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		MembersVO vo = new MembersVO();
		vo.setM_id(username);
		vo = dao.loginCheck(vo); // 로그인 체크

		// 회원이 없는 경우
		if(vo == null) {
			throw new UsernameNotFoundException("Login Denied");
		}
		// 회원이 있는 경우
		return vo;
	}

}
