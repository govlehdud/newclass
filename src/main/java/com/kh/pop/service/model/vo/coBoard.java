package com.kh.pop.service.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class coBoard {
	private int bNo; // 순번
	private Date bDate; // 사용일
	private String bHistory; // 사용내역
	private int bAmount; // 사용금액
	private int bRecognize; //승인금액
	private String bState; // 처리상태
	private String bStatus; // 처리상태
	private Date bRegistration; // 등록일
	private String note;	// 비고
	
}
