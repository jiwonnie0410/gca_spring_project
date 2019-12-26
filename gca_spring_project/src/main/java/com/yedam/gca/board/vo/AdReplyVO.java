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
	private String m_image_cd;			// 캐릭터
	
	
	public Integer getAdr_num() {
		return adr_num;
	}
	public void setAdr_num(Integer adr_num) {
		this.adr_num = adr_num;
	}
	public Integer getAd_num() {
		return ad_num;
	}
	public void setAd_num(Integer ad_num) {
		this.ad_num = ad_num;
	}
	public String getAdr_content() {
		return adr_content;
	}
	public void setAdr_content(String adr_content) {
		this.adr_content = adr_content;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_nick() {
		return m_nick;
	}
	public void setM_nick(String m_nick) {
		this.m_nick = m_nick;
	}
	public Date getAdr_regdate() {
		return adr_regdate;
	}
	public void setAdr_regdate(Date adr_regdate) {
		this.adr_regdate = adr_regdate;
	}
	public Date getAdr_updatedate() {
		return adr_updatedate;
	}
	public void setAdr_updatedate(Date adr_updatedate) {
		this.adr_updatedate = adr_updatedate;
	}
	public String getAdr_hidden() {
		return adr_hidden;
	}
	public void setAdr_hidden(String adr_hidden) {
		this.adr_hidden = adr_hidden;
	}
	public String getM_image_cd() {
		return m_image_cd;
	}
	public void setM_image_cd(String m_image_cd) {
		this.m_image_cd = m_image_cd;
	}
	
	
	
}
