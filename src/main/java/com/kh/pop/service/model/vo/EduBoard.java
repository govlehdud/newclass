package com.kh.pop.service.model.vo;

import lombok.Data;

@Data
public class EduBoard {
	// Education 
	private int eId;
	private int code;
	
	// 고등학교
	private String eHigh;
	private String eHighClass;
	private String eHighYear;
	private String eHighMonth;
	
	// 전산원
	private String eCom;
	private String eComClass;
	private String eComYear;
	private String eComMonth;
	
	// 전문대학
	private String eCollege;
	private String eCollegeClass;
	private String eCollegeYear;
	private String eCollegeMonth;
	
	// 대학교
	private String eUniver;
	private String eUniverClass;
	private String eUniverYear;
	private String eUniverMonth;
	
	
	private String EDU_NAME1;
	private String EDU_START1;
	private String EDU_END1;
	private String EDU_period1; 

	private String EDU_NAME2;
	private String EDU_START2;
	private String EDU_END2;
	private String EDU_period2;

	private String EDU_NAME3;
	private String EDU_START3;
	private String EDU_END3;
	private String EDU_period3;
	
}
