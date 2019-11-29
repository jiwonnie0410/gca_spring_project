package com.yedam.gca.member.vo;

import lombok.Data;

@Data
public class LevelsVO {

	private String level_name;		// *PK* // 레벨 이름
	private String level_icon;				// 아이콘
	private int level_standard;				// 승급 기준
	
}
