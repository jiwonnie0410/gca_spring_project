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

import com.fasterxml.jackson.databind.ObjectMapper;
import com.yedam.gca.chatting.vo.ChatVO;
import com.yedam.gca.chatting.vo.ChatVO2;

public class SpringSocketHandler extends TextWebSocketHandler implements InitializingBean {
	Logger logger = LoggerFactory.getLogger(SpringSocketHandler.class);
	private Set<WebSocketSession> sessionSet = new HashSet<WebSocketSession>();

//	@Resource
//	private BoardService boardService;

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
		System.out.println(session.getAttributes());
		this.logger.info("receive message:"+message.toString()); //json string을 vo로 변환
		ObjectMapper mapper = new ObjectMapper(); //잭슨?에서 제공해주는 객체.
		ChatVO2 chatvo = mapper.readValue((String) message.getPayload(), ChatVO2.class);
		
		//sendMessage((String) message.getPayload()); // message.getPayload() : 클라이언트에서 보내온 메세지 값
		
		String msg = "";
//		ChatVO2 result = new ChatVO2();
		if(chatvo.getCmd().equals("msg")) {
			msg = (String) message.getPayload();
		}
//			else if(chatvo.getCmd().equals("board")) { //board라고 치면?(board를 submit 받으면?) 게시글 내용 갖고오는 명령어.
//										//명령어에따라 다른 동작이 되도록 else문으로 명령어 더 추가해서 할 수 있음.(jsp에도 같이 추가)
//			String board = mapper.writeValueAsString(boardService.getBoardListMap()) ;
//			result.setCmd("board");
//			result.setMsg(board);
//			msg = mapper.writeValueAsString(result) ;			
//		}
		sendMessage(msg);
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

	public void sendMessage(String message) {
		for (WebSocketSession session : this.sessionSet) {
			if (session.isOpen()) {
				try {
					session.sendMessage(new TextMessage(message));
				} catch (Exception ignored) {
					this.logger.error("fail to send message!", ignored);
				}
			}
		}
	}

	@Override
	public void afterPropertiesSet() throws Exception {
		Thread thread = new Thread() {
			int i = 0;

			@Override
			public void run() {
				while (true) {
					try {
						sendMessage("send message index " + i++);
						Thread.sleep(1000);
					} catch (InterruptedException e) {
						e.printStackTrace();
						break;
					}
				}
			}
		};
		//thread.start();
	}
}
