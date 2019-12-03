package com.yedam.gca.board.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class QnaBoardVO {

	private int qb_id;			// *PK* // 문의글 번호
	private String qb_title;			// 문의글 제목
	private String qb_content;			// 문의글 내용
	private Date qb_date;				// 작성일자
	private int qb_hit;					// 조회수
	private int qb_origin;				// 부모글
	private String m_id;				// 작성자 ID

}
