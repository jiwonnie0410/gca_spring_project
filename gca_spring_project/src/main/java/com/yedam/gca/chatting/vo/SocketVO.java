package com.yedam.gca.chatting.vo;

import lombok.Data;

@Data
public class SocketVO {
	private String cmd;
	private String id;
	private String msg;
	private String character;
	private String nick;
	private int sg_num;
	private int bg_num;
	private int six_num;
}
