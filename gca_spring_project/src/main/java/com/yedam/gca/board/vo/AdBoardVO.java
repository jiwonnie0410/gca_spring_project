package com.yedam.gca.board.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class AdBoardVO {

	private int ad_num;			// *PK* // 홍보글 번호
	private String ad_city;				// 지역
	private String m_id;				// 회원 ID
	private String ad_title;			// 홍보글 제목
	private String ad_content;			// 홍보글 내용
	private Date ad_date;				// 작성 일자
	private int ad_count;				// 조회수
	private int ad_origin;				// 부모글
	private int recnt;					// 게시글 댓글의 수
}
