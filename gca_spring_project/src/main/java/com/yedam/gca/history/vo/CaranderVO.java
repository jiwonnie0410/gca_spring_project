package com.yedam.gca.history.vo;


import java.sql.Date;

import lombok.Data;

//수림 캘린더용 VO; 디비X

@Data
public class CaranderVO {
	private String title;
	private Date start;
	private Date end;
	private String color;
}
