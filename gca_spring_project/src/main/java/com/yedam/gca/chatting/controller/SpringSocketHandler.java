package com.yedam.gca.chatting.controller;

import java.util.HashSet;
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

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonObjectFormatVisitor;
import com.yedam.gca.chatting.vo.ChatVO;
import com.yedam.gca.chatting.vo.SocketVO;
import com.yedam.gca.group_s.service.SGroupService;
import com.yedam.gca.member.service.MemberService;
import com.yedam.gca.member.vo.MembersVO;

public class SpringSocketHandler extends TextWebSocketHandler implements InitializingBean {
	Logger logger = LoggerFactory.getLogger(SpringSocketHandler.class);
	private Set<WebSocketSession> sessionSet = new HashSet<WebSocketSession>();

	@Resource
	private SGroupService sgroupService;

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
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		super.afterConnectionEstablished(session);
		sessionSet.add(session);
		this.logger.info("add session!"); 
} 
	@Override
	//onMessage 
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception { super.handleMessage(session, message);
		ObjectMapper mapper = new ObjectMapper(); //제이슨?에서 제공해주는 객체.
		SocketVO svo = mapper.readValue((String) message.getPayload(), SocketVO.class);//메세지 전송을 위한 VO
		MembersVO mvo = new MembersVO();
		
		
		System.out.println("message.getPayload() : "+message.getPayload());
		
		// message.getPayload() : 클라이언트에서 보내온 메세지 값
		
		String msg = "join";
		if(svo.getCmd().equals("join")) {
			msg = (String) message.getPayload();
			
			//클라이언트에서 보내온 id로 멤버 한명의 정보 가져옴.
			mvo.setM_id(svo.getId());
			mvo = sgroupService.getOneMem(mvo);
			
			svo.setCharacter(sgroupService.returnImage(mvo));
			svo.setNick(mvo.getM_nick());
		}
		//명령어에따라 다른 동작이 되도록 else if문으로 명령어 더 추가해서 할 수 있음.(jsp에도 같이 추가)
		else if(svo.getCmd().equals("msg")) {
			msg = (String) message.getPayload();
			System.out.println("보내는 메세지 : "+msg);
		}
		else if(svo.getCmd().equals("cancelJoin")) {
										
			System.out.println(svo.getId());
			msg = (String) message.getPayload();
		}
		sendMessage(msg, session, svo);
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

	@Override
	public void afterPropertiesSet() throws Exception {
		
	}
}
