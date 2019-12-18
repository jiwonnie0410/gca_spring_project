package com.yedam.gca.board.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class BoardSearchVO extends QnaBoardVO {
	private String keyword;
	private String searchCondition;
	private int start;
	private int end;

}
