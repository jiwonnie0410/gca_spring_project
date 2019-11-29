package com.yedam.gca.board.vo;

import java.util.Date;

import lombok.Data;
@Data
public class ReplyVO {
	private Integer adr_number;		// 댓글 번호
	private Integer ad_number;		// 게시글 번호
	private String adr_contents;	// 댓글 내용
	private String m_id;		// 댓글 작성자
	private String userName;	// 댓글 작성자의 이름(회원의 이름)
	private Date adr_regdate;		// 댓글 작성일자
	private Date adr_updatedate;	// 댓글 수정일자
	private String adr_hidden;	// **댓글 숨김 유무 추가
	private String writer;		// **게시글의 작성자 추가
	
}
