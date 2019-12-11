package com.yedam.gca.member.vo;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.Data;

@Data
public class MembersVO implements UserDetails {

	private String m_id;		// *PK* // 회원 ID
	private String m_salt;				// 비밀번호 암호화 키
	private String m_password;			// 비밀번호 (암호화됨)
	private String m_name;				// 회원 이름
	private String m_nick;				// 닉네임
	private String m_image_cd;			// 캐릭터
	private String m_xy;				// xy 좌표
	private String m_location;			// 주소
	private String m_age;				// 연령대  ------------------>>>>>>>>>>>> 얘는 int로 바꿔야 하지 않나 생각합니동
	private String gender_cd;			// 성별
	private String m_level_cd;			// 레벨
	private String m_grant;				// 회원구분 (기본/관리자)
	private String m_status_cd;			// 계정상태 (활동중/활동정지/탈퇴/강퇴)
	private int m_radius;				// 반짝이나 매치 띄울 위치반경
	private String m_notice;			// 알림 설정
	private String m_email;
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		// 인가
		List<GrantedAuthority> auth = new ArrayList<>();
		auth.add(new SimpleGrantedAuthority(this.getM_grant()));
		return auth;
	}
	@Override
	public String getPassword() {
		return m_password;
	}
	@Override
	public String getUsername() {
		return m_id;
	}
	@Override
	public boolean isAccountNonExpired() {
		return true;
	}
	@Override
	public boolean isAccountNonLocked() {
		return true;
	}
	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}
	@Override
	public boolean isEnabled() {
		return true;
	}

}
