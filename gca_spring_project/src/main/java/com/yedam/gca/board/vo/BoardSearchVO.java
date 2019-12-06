package com.yedam.gca.board.vo;

import lombok.Data;

@Data
public class BoardSearchVO extends QnaBoardVO {
	private String keyword;
	private String searchCondition;
	private int start;
	private int end;

}
