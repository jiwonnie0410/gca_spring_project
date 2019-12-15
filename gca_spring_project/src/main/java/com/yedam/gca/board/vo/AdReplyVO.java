package com.yedam.gca.board.vo;

import java.util.Date;

import lombok.Data;

@Data
public class AdReplyVO {
	private Integer adr_num;		// 댓글 번호
	private Integer ad_num;			// 게시글 번호
	private String adr_content;	// 댓글 내용
	private String m_id;
	private String m_nick;    // 댓글 작성자 닉네임
	
	private Date adr_regdate;		// 댓글 작성일자
	private Date adr_updatedate;	// 댓글 수정일자
	private String adr_hidden;		// **댓글 숨김 유무 추가
}
