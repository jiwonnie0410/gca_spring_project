package com.yedam.gca.chatting.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.yedam.gca.admin.service.AlertService;
import com.yedam.gca.admin.vo.AlertVO;
import com.yedam.gca.chatting.vo.SocketVO;
import com.yedam.gca.group_s.service.SGroupService;
import com.yedam.gca.history.dao.ActiveHistDAO;
import com.yedam.gca.history.service.ActiveHistService;
import com.yedam.gca.history.vo.ActiveHistVO;
import com.yedam.gca.member.vo.MembersVO;

public class SpringSocketHandler extends TextWebSocketHandler implements InitializingBean {
	Logger logger = LoggerFactory.getLogger(SpringSocketHandler.class);
	
	private Set<WebSocketSession> sessionSet = new HashSet<WebSocketSession>();
	private Map<String, WebSocketSession> sessionMap = new HashMap<String, WebSocketSession>();
	
	@Resource	private SGroupService sgroupService;
	@Resource	private ActiveHistService activeService;
	@Resource	private AlertService alertService;
	
	public SpringSocketHandler (){ 
		super();
		this.logger.info("create SocketHandler instance!");
	}

	@Override
//onClose
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		super.afterConnectionClosed(session, status);
		sessionSet.remove(session);
		this.logger.info("remove session!");
	}

	@Override
	//onOpen 
	public void afterConnectionEstablished(WebSocketSession session) throws Exception { //로그인 되었을 때 작동하는 웹소켓
		super.afterConnectionEstablished(session);
		
		//1. 로그인한 유저의 웹소켓 세션을 세션 셋(웹소켓 세션을 담는 셋)에 추가한다. -> 은영의 sendMessage()에서 사용함.
		sessionSet.add(session);
		
		//2. 웹소켓 세션의 요소를 map에 담는다. -> 미현의 joinSendMessage()에서 사용함.
		Map<String, Object> atriMap = session.getAttributes(); //attribute에 담긴 유저id(HandshakeInter~에서 구현함)를 map에 담음.
		sessionMap.put(atriMap.get("id").toString(), session); //맵에 담긴 로그인 유저id를 키값으로 로그인 유저의 웹소켓 세션을 불러올 수 있게 맵에 담음.
//		
//		//2-1. 안읽은 메시지 건수 읽어서 호출하기
//		AlertVO alvo = new AlertVO();
//		alvo.setM_id(atriMap.get("id").toString());
//		int alertCnt = alertService.getAlertCnt(alvo);
//		
//		SocketVO svo = new SocketVO();
//		svo.setCmd("alertCnt");
//		svo.setId(alvo.getM_id());
//		svo.setMsg(Integer.toString(alertCnt));
//		ObjectMapper mapper = new ObjectMapper();
//		session.sendMessage( new TextMessage(mapper.writeValueAsString(svo)) );
		
//		System.out.println(svo.getCmd() + ", " + svo.getId() + ", " + svo.getMsg());
		
		this.logger.info("add session!"); 
	}
	
	
	@Override
	//onMessage : 메시지 읽기
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception { super.handleMessage(session, message);
		
		//json 객체로 날아온 메시지를 vo에 담기 위해 스트링으로 바꿔줄 필요가 있음.
		ObjectMapper mapper = new ObjectMapper(); //단계 1) ObjectMapper는 잭슨에서 제공해주는 객체로 json 형태로 바꾸거나 json을 다른 형태로 바꿔줌
		
		
		SocketVO svo = null;
		try {
			System.out.println( "message.getPayload() :" + message.getPayload()); // message.getPayload() : 클라이언트에서 보내온 메세지 값
			if( message.getPayloadLength() > 0) {
				svo = mapper.readValue((String) message.getPayload(), SocketVO.class);
			} else return;
		} catch (Exception e) {
			e.printStackTrace();
			return;
		}
			//단계 2)readValue가 jsonParse와 같은 역할. json 객체 안에 있는 string 객체 paylaod()를 socketVo에 담기 위해 json 객체를 읽어 옴.
		
		MembersVO mvo = new MembersVO();
		String msg = "";
		
		//방 참여
		if(svo.getCmd().equals("join")) { //명령어에따라 다른 동작이 되도록 else if문으로 명령어 더 추가해서 할 수 있음.(jsp에도 같이 추가)
			msg = (String) message.getPayload();
			
			//클라이언트에서 보내온 id로 멤버 한명의 정보 가져옴.
			mvo.setM_id(svo.getId()); //멤버의 캐릭터,닉네임 등의 정보를 얻기 위한 과정1
			mvo = sgroupService.getOneMem(mvo); //멤버의 정보를 얻기 위한 과정2
			svo.setCharacter(sgroupService.returnImage(mvo)); //멤버의 캐릭터 소켓 vo에 담음
			svo.setNick(mvo.getM_nick()); //멤버의 닉네임 소켓vo에 담음
			
			joinSendMessage(svo);
			sendMessage(msg, session, svo);
		}
		
		//채팅
		else if(svo.getCmd().equals("msg")) {
			msg = (String) message.getPayload();
			System.out.println("보내는 메세지 : "+msg);
			
			sendMessage(msg, session, svo);
		}
		
		//참여 취소
		else if(svo.getCmd().equals("cancelJoin")) {
			System.out.println(svo.getId());
			msg = (String) message.getPayload();
			
			sendMessage(msg, session, svo);
		}
		
		//강퇴
		else if(svo.getCmd().equals("kickOut")) {
			System.out.println(svo.getId());
			msg = (String) message.getPayload();
			
			sendMessage(msg, session, svo);
		}
		
		//유저의 안읽은 메시지 카운트 보내기
		else if(svo.getCmd().equals("alertCnt")) {
			AlertVO alvo = new AlertVO();
			alvo.setM_id(svo.getId());
			int alertCnt = alertService.getAlertCnt(alvo);
			svo.setMsg(Integer.toString(alertCnt));
			
			session.sendMessage(new TextMessage(mapper.writeValueAsString(svo)));
		}
		
		//해당 그룹에 속한 회원에게 안 읽은 메시지 카운트 보내기
		else if(svo.getCmd().equals("groupAlert")) {
			groupSendMessage(svo);
		}
	}

	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		this.logger.error("web socket error!", exception);
	}

	@Override
	public boolean supportsPartialMessages() {
		this.logger.info("call method!"); 
		return super.supportsPartialMessages();
	}
	
	public void groupSendMessage(SocketVO svo) throws JsonProcessingException, IOException {
		//알림 그룹 별로 프로필 +1 하고자 함.
		List<AlertVO> list = alertService.getAlertGroupId(svo);
		for(AlertVO avo : list) {
			int alertCnt = alertService.getAlertCnt(avo);
			if(alertCnt != 0) {
				//4-1. 해당 멤버의 아이디로 웹소켓에서 세션 정보를 가져 옴. 
				WebSocketSession session = sessionMap.get(avo.getM_id());
				if(session != null) {
					//4-2. vo에 보낼 내용 담음
					svo.setCmd("alertCnt");
					svo.setId(avo.getM_id());
					svo.setMsg(Integer.toString(alertCnt));
					//4-3. vo의 형태를 json으로 바꿔서 보내기.
					ObjectMapper mapper = new ObjectMapper();
					session.sendMessage( new TextMessage(mapper.writeValueAsString(svo)) );
				}
			}
		}
	}
	
	public void joinSendMessage(SocketVO svo) throws JsonProcessingException, IOException {
		//어떤 사람이 방에 참가했는데 방이 꽉 찼을 경우 실시간으로 메시지를 보내고 프로필에 +1하고자 함
			//1. 해당 방에 있는 모든 멤버 아이디 찾기
			ActiveHistVO avo = new ActiveHistVO();
			avo.setSg_num(svo.getSg_num());
			List<MembersVO> list = activeService.getActMemList(avo);
			
			//2. 그 멤버 모두에게 메시지 보내기
			for(MembersVO mvo : list) {
				//3. 메시지 보내기 전에 멤버별로 안 읽은 메시지 숫자 조회
				AlertVO alvo = new AlertVO();
				alvo.setM_id(mvo.getM_id());
				int alertCnt = alertService.getAlertCnt(alvo);
				
				//4. 안 읽은 메시지가 있으면 표시됨
				if(alertCnt != 0) {
					//4-1. 해당 멤버의 아이디로 웹소켓에서 세션 정보를 가져 옴. 
					WebSocketSession session = sessionMap.get(mvo.getM_id());
					if(session != null) {
						//4-2. vo에 보낼 내용 담음
						svo.setCmd("alertCnt");
						svo.setId(mvo.getM_id());
						svo.setMsg(Integer.toString(alertCnt));
						//4-3. vo의 형태를 json으로 바꿔서 보내기.
						ObjectMapper mapper = new ObjectMapper();
						session.sendMessage( new TextMessage(mapper.writeValueAsString(svo)) );
					}
				}
			}
	}

	public void sendMessage(String message, WebSocketSession mySession, SocketVO vo) {
		System.out.println("String msg : "+message);
		for (WebSocketSession session : this.sessionSet) {
			if (session.isOpen()) { //session is Open이고 내 세션이 아닌것들한테만 응답을 보내준다.
				try {
					if(!(vo.getCmd().equals("join") && mySession==session)) {
						String canAddMsg = message.substring(0, message.length()-1);
						message = canAddMsg.concat(",\"character\":\""+vo.getCharacter()+"\""
								+ ",\"nick\":\""+vo.getNick()+"\"}");
						
						System.out.println("메세지 : "+message);
						
						session.sendMessage(new TextMessage(message));
						
						
					}
				} catch (Exception ignored) {
					this.logger.error("fail to send message!", ignored);
				}
			}
		}
	}
	
	//방 참여, 강퇴, 채팅전송, 참가취소 시 메세지 뿌리기 메서드
	public void sendMessage(SocketVO vo) {
		for (WebSocketSession session : this.sessionSet) {
			if (session.isOpen()) {
				try {
						String message = "{\"cmd\":\"join\", \"id\":\""+vo.getId()+"\", \"msg\":\""+vo.getMsg()+"\","
								+ "\"character\":\""+vo.getCharacter()+"\", \"nick\":\""+vo.getNick()+"\"}";
						
						System.out.println("메세지 : "+message);
						
						session.sendMessage(new TextMessage(message));
						
				} catch (Exception ignored) {
					this.logger.error("fail to send message!", ignored);
				}
			}
		}
	}

	@Override
	public void afterPropertiesSet() throws Exception {
		
	}
}
