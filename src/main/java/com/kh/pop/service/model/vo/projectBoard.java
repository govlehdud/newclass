package com.kh.pop.service.model.vo;

import lombok.Data;

@Data
public class projectBoard {
	private int pId;
	private int code;
	
//	프로젝트
	private String proName;				//	프로젝트 명
	private String proPeriod1;			//	참여기간1
	private	String proPeriod2;			//	참여기간2
	private	String proCustomer;			//	고객사
	private	String proCompany;			//	근무회사
	private	String proArea;				//	개별분야
	private	String proPart;				//	역할
	
//	개발환경
	private	String proProduct;			//	기종
	private String proOs;				//	OS
	private	String proLanguage;			//	언어
	private	String proDbms;				//	DBMS
	private	String proTool;				//	TOOL
	private	String proCommunication;	//	통신
	private	String proEtc;				//	기타
}
