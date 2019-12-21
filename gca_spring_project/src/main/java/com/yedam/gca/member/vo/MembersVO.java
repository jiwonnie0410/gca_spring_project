package com.yedam.gca.member.vo;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.util.StringUtils;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;
import com.yedam.gca.member.service.NaverLoginApi;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
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
	private String m_notice1;			// 알림 설정1
	private String m_notice2;			// 알림 설정2
	private String m_notice3;			// 알림 설정3 
	private String m_notice4;			// 알림 설정4 
	private String m_email;
	
	private final static String CLIENT_ID = "BJ76vTS9xilyC5p9YXrY";								// 애플리케이션 아이디
	private final static String CLIENT_SECRET = "VIbOx5iXYy";									// 애플리케이션 비밀키
	private final static String REDIRECT_URI = "http://localhost/gca/login/naverCallback";		// 애플리케이션 등록할 때의 Callback uri
	private final static String SESSION_STATE = "oauth_state";  								// 애플리케이션이 생성한 상태 토큰
	private final static String PROFILE_API_URL = "https://openapi.naver.com/v1/nid/me"; 		// 프로필 조회 API URL
	
	@Override
	@JsonIgnore
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
	@JsonIgnore
	public boolean isAccountNonExpired() {
		return true;
	}
	@Override
	@JsonIgnore
	public boolean isAccountNonLocked() {
		return true;
	}
	@Override
	@JsonIgnore
	public boolean isCredentialsNonExpired() {
		return true;
	}
	@Override
	@JsonIgnore
	public boolean isEnabled() {
		return true;
	}

	
	
	// 네이버 아이디로 인증 URL 생성 Method
	public String getAuthorizationUrl(HttpSession session) {
		String state = generateRandomString(); 	//세션 유효성 검증을 위하여 난수를 생성
		setSession(session, state); 			//생성한 난수 값을 session에 저장
		
		// Scribe에서 제공하는 인증 URL 생성 기능을 이용하여 네아로 인증 URL 생성
		OAuth20Service oauthService = new ServiceBuilder().apiKey(CLIENT_ID).apiSecret(CLIENT_SECRET)
															.callback(REDIRECT_URI).state(state) // 앞서 생성한 난수값을 인증 URL생성시 사용함
															.build(NaverLoginApi.instance());
		return oauthService.getAuthorizationUrl();
	}

	// 네이버아이디로 Callback 처리 및 AccessToken 획득 Method
	public OAuth2AccessToken getAccessToken(HttpSession session, String code, String state) throws IOException {
		String sessionState = getSession(session); // Callback으로 전달받은 세선검증용 난수값과 세션에 저장되어있는 값이 일치하는지 확인
		if (StringUtils.pathEquals(sessionState, state)) {
			OAuth20Service oauthService = new ServiceBuilder().apiKey(CLIENT_ID).apiSecret(CLIENT_SECRET)
																	.callback(REDIRECT_URI).state(state).build(NaverLoginApi.instance());
			
			// Scribe에서 제공하는 AccessToken 획득 기능으로 네아로 Access Token을 획득
			OAuth2AccessToken accessToken = oauthService.getAccessToken(code); 
			return accessToken;
		}
		return null;
	}

	// 세션 유효성 검증을 위한 난수 생성기
	private String generateRandomString() {
		return UUID.randomUUID().toString();
	}

	// http session에 데이터 저장
	private void setSession(HttpSession session, String state) {
		session.setAttribute(SESSION_STATE, state);
	}

	// http session에서 데이터 가져오기
	private String getSession(HttpSession session) {
		return (String) session.getAttribute(SESSION_STATE);
	}

	// Access Token을 이용하여 네이버 사용자 프로필 API를 호출
	public String getUserProfile(OAuth2AccessToken oauthToken) throws IOException {
		OAuth20Service oauthService = new ServiceBuilder().apiKey(CLIENT_ID).apiSecret(CLIENT_SECRET)
																				.callback(REDIRECT_URI).build(NaverLoginApi.instance());
		OAuthRequest request = new OAuthRequest(Verb.GET, PROFILE_API_URL, oauthService);
		oauthService.signRequest(oauthToken, request);
		Response response = request.send();
		return response.getBody();
	}
}
