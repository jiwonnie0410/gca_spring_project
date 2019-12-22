package com.yedam.gca.member.service.impl;

import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Random;

import javax.annotation.Resource;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.yedam.gca.member.dao.MemberDAO;
import com.yedam.gca.member.service.MemberService;
import com.yedam.gca.member.vo.MembersVO;

@Service
public class MemberServiceImpl implements MemberService {
// 지
// 1. 회원가입 	2. 아이디 중복 확인 	3. 아이디 찾기 	4. 비밀번호 찾기 	5. 비밀번호 변경 	
// 6. 네이버로 로그인 시 이미 있는 회원인지 확인 후 Members 테이블에 데이터 등록 	7. 사용자가 현재까지 쓴 글의 갯
	
	@Resource MemberDAO dao;

	// 1. 회원가입
	@Override
	public Map<String, Object> insertMember(MembersVO vo) {
		// 비밀번호 암호화
		BCryptPasswordEncoder scpwd = new BCryptPasswordEncoder();
		String password = scpwd.encode(vo.getM_password());
		vo.setM_password(password);
		
		// 회원 테이블에 insert 후에 성공 및 실패에 따라 메시지와 리턴 페이지 다르게 넘김
		Map<String, Object> map = new HashMap<String, Object>();
		int result = dao.insertMember(vo);
		if(result == 0) {
			map.put("flag", false);
			map.put("message", "회원가입에 실패했습니다. 다시 시도해 주세요.");
			return map;
		}
		else {
			map.put("flag", true);
			map.put("message", "운동하자의 회원이 되신 것을 축하드립니다! 로그인 후 서비스를 이용해 주세요.");
			return map;
		}
	}

	// 2. 아이디 중복 확인
	@Override
	public int checkId(String id) {
		return dao.checkId(id);
	}

	// 3. 이름이랑 이메일로 아이디 찾기 -> 이메일 보냄
	@Override
	public Map<String, Object> forgotId(MembersVO vo) {
		String name = vo.getM_name();
		String email = vo.getM_email();
		String getId = null;

		// 아이디 가져옴
		getId = dao.forgotId(vo);

		// 아이디 찾아서 이메일 보내기 성공 및 실패에 따라 메시지와 리턴 페이지 다르게 넘김
		Map<String, Object> map = new HashMap<String, Object>();
		
		// 입력받은 이름과 이메일에 해당하는 아이디가 없음
		if (getId == null) { 
			map.put("flag", false);
			map.put("message", "해당 정보에 등록된 아이디가 없습니다.");
			return map;
			
		// 해당하는 아이디를 찾았음
		} else {
			// 이메일 전송
			final String user = "undong.master@gmail.com"; 	// 보내는 사람 이메일 주소
			final String password = "iggezabqphyhqyph"; 	// 비밀번호

			Properties prop = new Properties();
			prop.put("mail.smtp.host", "smtp.gmail.com");
			prop.put("mail.smtp.port", "587");
			prop.put("mail.smtp.auth", "true");
			prop.put("mail.smtp.starttls.enable", "true");

			Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(user, password);
				}
			});

			try {
				MimeMessage message = new MimeMessage(session);
				message.setFrom(new InternetAddress(user));

				// 받는 사람의 이메일 주소
				message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
				// 메일 제목
				message.setSubject("운동하자에서 알려드립니다.");
				// 메일 내용
				message.setText("잊어버리신 " + name + "님의 아이디는 '" + getId + "'입니다. \n행복한 하루 되세요!");
				// 전송
				Transport.send(message);
				System.out.println("이메일 전송 완료");
			} catch (AddressException e) {	e.printStackTrace();	} 
			catch (MessagingException e) {	e.printStackTrace();	}

			map.put("flag", true);
			map.put("message", "이메일로 아이디를 발송했습니다. 로그인 해 주세요.");
			return map;
		}
	}

	// 4. 비밀번호 찾기 -> 이메일로 임시 비밀번호 보내고 디비에 정보 업데이트
	public Map<String, Object> forgotPw(MembersVO vo) {
		String name = vo.getM_name();
		String email = vo.getM_email();
		
		// 임시 비밀번호 생성
		StringBuffer temp = new StringBuffer();
		Random rnd = new Random();
		for (int i = 0; i < 20; i++) {
		    int rIndex = rnd.nextInt(3);
		    switch (rIndex) {
		    case 0:
		        // a-z
		        temp.append((char) ((int) (rnd.nextInt(26)) + 97));
		        break;
		    case 1:
		        // A-Z
		        temp.append((char) ((int) (rnd.nextInt(26)) + 65));
		        break;
		    case 2:
		        // 0-9
		        temp.append((rnd.nextInt(10)));
		        break;
		    }
		}
		String tempPw = temp.toString(); // 임시 비밀번호
		
		// 비밀번호 암호화
		BCryptPasswordEncoder scpwd = new BCryptPasswordEncoder();
		String pw = scpwd.encode(tempPw);
		vo.setM_password(pw);
		
		int result = dao.forgotPw(vo); // 입력 받은 정보로 회원 있는지 확인
		
		// 회원이 있는지 확인하고 이메일 보내기 성공 및 실패에 따라 메시지와 리턴 페이지 다르게 넘김
		Map<String, Object> map = new HashMap<String, Object>();
		
		// 해당하는 정보가 없음
		if (result == 0) {
			map.put("flag", false);
			map.put("message", "해당 정보와 일치하는 회원이 없습니다.");
			return map;
			
		// 해당하는 정보를 찾았음
		} else {
			// 임시 비밀번호로 디비 업데이트
			dao.updateTempPw(vo);
			
			// 이메일 전송
			final String user = "undong.master@gmail.com"; 	// 보내는 사람 이메일 주소
			final String password = "iggezabqphyhqyph"; 	// 비밀번호

			Properties prop = new Properties();
			prop.put("mail.smtp.host", "smtp.gmail.com");
			prop.put("mail.smtp.port", "587");
			prop.put("mail.smtp.auth", "true");
			prop.put("mail.smtp.starttls.enable", "true");

			Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(user, password);
				}
			});

			try {
				MimeMessage message = new MimeMessage(session);
				message.setFrom(new InternetAddress(user));

				// 받는 사람의 이메일 주소
				message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
				// 메일 제목
				message.setSubject("운동하자에서 알려드립니다.");
				// 메일 내용
				message.setText(name + "님의 임시 비밀번호는 '" + tempPw + "'입니다. 이 비밀번호로 로그인 후에 비밀번호 변경을 해 주세요. \n행복한 하루 되세요!");
				// 전송
				Transport.send(message);
				System.out.println("이메일 전송 완료");
			} catch (AddressException e) {	e.printStackTrace();	} 
			catch (MessagingException e) {	e.printStackTrace();	}

			map.put("flag", true);
			map.put("message", "이메일로 임시 비밀번호를 발송했습니다. 로그인 해 주세요.");
			return map;
		}
	}
	
	// 5. 비밀번호 변경
	@Override
	public Map<String, Object> changePw(MembersVO vo) {
		// 비밀번호 암호화
		BCryptPasswordEncoder scpwd = new BCryptPasswordEncoder();
		String password = scpwd.encode(vo.getM_password());
		vo.setM_password(password);
		
		int result = dao.changePassword(vo);
		
		// 비밀번호 변경 성공 및 실패에 따라 메시지와 리턴 페이지 다르게 넘김
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(result == 0) {
			map.put("flag", false);
			map.put("message", "비밀번호 변경에 실패했습니다. 다시 시도해 주세요.");
		} else {
			map.put("flag", true);
			map.put("message", "비밀번호 변경 완료!");
		}
		return map;
	}
	
	// 6. 네이버로 로그인 시 이미 있는 회원인지 확인 후 Members 테이블에 데이터 등록
	@Override
	public String insertNaver(MembersVO vo) {
		// 일단 등록된 회원인지 확인: 아이디 중복인지 체크
		int overlap = dao.checkId(vo.getM_id());
		
		// 등록된 회원이 없으면 회원가입
		if(overlap == 0) {
			dao.insertNaver(vo);
		}
		
		// 활동정지 상태인지 계정 상태 리턴
		return dao.memberStatus(vo.getM_id());
	}
	
	// 사용자 정보 받아오기
	@Override
	public int getScore(String mId) {
		return dao.getScore(mId);
	}
	
	// 7. 사용자가 현재까지 쓴 글의 갯수
	@Override
	public int getBoardCount(String mId) {
		return dao.getBoardCount(mId);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//진영
	 // 01. 회원 정보 상세 조회 
    @Override
    public MembersVO viewMember(String m_id) {
        return dao.viewMember(m_id);
    }
    // 02. 회원 정보 삭제 처리
    @Override
    public void deleteMember(String m_id) {
    	dao.deleteMember(m_id);
    }
    // 03. 회원 정보 수정 처리
    @Override
    public void updateMember(MembersVO vo) {
    	// 비밀번호 암호화
//		BCryptPasswordEncoder scpwd = new BCryptPasswordEncoder();
//		String password = scpwd.encode(vo.getM_password());
//		vo.setM_password(password);
    	dao.updateMember(vo);
    }
    // 04. 회원 정보 수정 및 삭제를 위한 비밀번호 체크
    @Override
    public boolean checkPw(String m_id, String m_password) {
    	// 비밀번호 암호화
//    			BCryptPasswordEncoder scpwd = new BCryptPasswordEncoder();
//    			String password = scpwd.encode(vo.getM_password());
//    			vo.setM_password(password);
    	
        return dao.checkPw(m_id, m_password);
    }
    
    
	/*
	 * public boolean checkPw(String m_id, String m_password, MembersVO vo) { //
	 * 비밀번호 암호화 BCryptPasswordEncoder scpwd = new BCryptPasswordEncoder(); String
	 * password = scpwd.encode(vo.getM_password()); vo.setM_password(password);
	 * 
	 * return dao.checkPw(m_id, m_password); }
	 */
	

    
    // ***************** 수림 *********************** //
    
    //1. 1. 유저별 알람 정보 가져오기 
    @Override
    public MembersVO getAlarmInfo(MembersVO vo) {
    	return dao.getAlarmInfo(vo);
    }
    
    // 2. 토글스위치 클릭시 알람 on/off 업데이트
    @Override
 	public int updateSwitch(MembersVO vo) {
    	return dao.updateSwitch(vo);
    }
    
    // 3. 범위슬라이더 변경시 범위 업데이트
    @Override
	public void updateRange(MembersVO vo) {
    	dao.updateRange(vo);
    }

	

	

	
}
