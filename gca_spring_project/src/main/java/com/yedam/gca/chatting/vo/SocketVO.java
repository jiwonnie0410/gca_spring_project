package com.yedam.gca.chatting.vo;

import lombok.Data;

@Data
public class SocketVO {
	private String cmd;
	private String id;
	private String msg;
	private String character;
	private String nick;
	private String sg_num;
}
