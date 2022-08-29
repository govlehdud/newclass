package com.kh.pop.service.model.vo;

import java.sql.Date;
import lombok.Data;

@Data
public class workBoard {
	public int wId;
	public int code;
	
	public String projectName;
	public String workPlace;
	public Date workStart;
	public Date workEnd;
	public int sale;
	public Date payStart;
	public Date payDay;
	public String client;
	
}
