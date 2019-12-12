package com.yedam.gca.member.service.impl;

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

import org.springframework.stereotype.Service;

import com.yedam.gca.member.dao.MemberDAO;
import com.yedam.gca.member.service.MemberService;
import com.yedam.gca.member.service.SHA256Util;
import com.yedam.gca.member.vo.MembersVO;

@Service
public class MemberServiceImpl implements MemberService {
// 1. 회원가입 	2. 아이디 중복 확인 	3. 아이디 찾기 	4. 비밀번호 찾기
	
	@Resource MemberDAO dao;

	// 1. 회원가입
	@Override
	public int insertMember(MembersVO vo) {
		// 비밀번호 암호화
		String salt = SHA256Util.generateSalt();								// 1. 암호화 키 생성
		String newPassword = SHA256Util.getEncrypt(vo.getM_password(), salt);	// 2. 비밀번호 암호화
		vo.setM_salt(salt);														// 3. vo에 암호화 키 넣기
		vo.setM_password(newPassword);											// 4. vo에 암호화된 비밀번호 넣기
		
		return dao.insertMember(vo);
	}

	// 2. 아이디 중복 확인
	@Override
	public int checkId(String id) {
		return dao.checkId(id);
	}

	// 3. 이름이랑 이메일로 아이디 찾기 -> 이메일 보냄
	@Override
	public String forgotId(MembersVO vo) {
		String name = vo.getM_name();
		String email = vo.getM_email();
		String getId = null;

		// 아이디 가져옴
		getId = dao.forgotId(vo);

		// 입력받은 이름과 이메일에 해당하는 아이디가 없음
		if (getId == null) { 
			return "해당 정보에 등록된 아이디가 없습니다.";
			
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

			return "이메일로 아이디를 발송했습니다. 로그인 해 주세요.";
		}
	}

	// 4. 비밀번호 찾기 -> 이메일로 임시 비밀번호 보내고 디비에 정보 업데이트
	public String forgotPw(MembersVO vo) {
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
		String salt = SHA256Util.generateSalt();						// 1. 암호화 키 생성
		String newPassword = SHA256Util.getEncrypt(tempPw, salt);		// 2. 비밀번호 암호화
		vo.setM_salt(salt);												// 3. vo에 암호화 키 넣기
		vo.setM_password(newPassword);									// 4. vo에 암호화된 비밀번호 넣기
		
		int result = dao.forgotPw(vo); // 입력 받은 정보로 회원 있는지 확인
		
		// 해당하는 정보가 없음
		if (result == 0) { 
			return "해당 정보와 일치하는 회원이 없습니다.";
			
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

			return "이메일로 임시 비밀번호를 발송했습니다. 로그인 해 주세요.";
		}
	}
	
	// 비밀번호 변경
	@Override
	public String changePw(MembersVO vo) {
		// 비밀번호 암호화
		String salt = SHA256Util.generateSalt();						// 1. 암호화 키 생성
		String newPassword = SHA256Util.getEncrypt(vo.getM_password(), salt);		// 2. 비밀번호 암호화
		vo.setM_salt(salt);												// 3. vo에 암호화 키 넣기
		vo.setM_password(newPassword);									// 4. vo에 암호화된 비밀번호 넣기
		
		int result = dao.changePassword(vo);
		if(result == 0) {
			return "비밀번호 변경에 실패했습니다. 다시 시도해 주세요.";
		} else {
			return "비밀번호 변경 완료!";
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//진영
	 // 01. 회원 정보 상세 조회 
    @Override
    public MembersVO viewMember(String m_id) {
        return dao.viewMember(m_id);
    }
    // 02. 회원 정보 수정 처리
    @Override
    public void deleteMember(String m_id) {
    	dao.deleteMember(m_id);
    }
    // 03. 회원 정보 삭제 처리
    @Override
    public void updateMember(MembersVO vo) {
    	dao.updateMember(vo);
    }
    // 04. 회원 정보 수정 및 삭제를 위한 비밀번호 체크
    @Override
    public boolean checkPw(String m_id, String m_password) {
        return dao.checkPw(m_id, m_password);
    }

	

    
    // ***************** 수림 *********************** //
    
    //1. 1. 유저별 알람 정보 가져오기 
    @Override
    public MembersVO getAlarmInfo(MembersVO vo) {
    	return dao.getAlarmInfo(vo);
    }
    
    @Override
 // 2. 토글스위치 클릭시 알람 on/off 업데이트
 	public int updateSwitch(MembersVO vo) {
    	return dao.updateSwitch(vo);
    }
}
