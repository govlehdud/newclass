package com.kh.pop.service.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class LicenseBoard {
	// license 
	private int lId;
	private int code;
	
	// 자격증
	private String license1;
	private String license2;
	private String license3;
	private String license4;
	
	// 취득일
	private Date ACQUISITION1;
	private Date ACQUISITION2;
	private Date ACQUISITION3;
	private Date ACQUISITION4;
	
	// 보유기술
	private String tech1;
	private String tech2;
	private String tech3;
	private String tech4;
	private String tech5;
	
	// 숙련도
	private String PROFICIENCY1;
	private String PROFICIENCY2;
	private String PROFICIENCY3;
	private String PROFICIENCY4;
	private String PROFICIENCY5;
}
