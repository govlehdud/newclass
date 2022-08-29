package com.kh.pop.service.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class ScFileInfo {
	private int fileNo;
	private String fileName;
	private String changeName;
	private Date fileCreateDate;
	private int fileLevel;
	private String filePath;
	private String fileStatus;
	private int code;
}
