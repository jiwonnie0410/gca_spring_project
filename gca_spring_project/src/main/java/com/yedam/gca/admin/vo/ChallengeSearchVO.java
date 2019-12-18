package com.yedam.gca.admin.vo;

import com.yedam.gca.challenge.vo.ChallengeVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class ChallengeSearchVO extends ChallengeVO {

	private String keyword;
	private String searchCondition;
	private int start;
	private int end;
}
