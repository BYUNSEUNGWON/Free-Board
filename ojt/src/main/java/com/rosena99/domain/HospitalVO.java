package com.rosena99.domain;

import java.util.Date;

import lombok.Data;

@Data
public class HospitalVO {

	private Long bno;
	private String title;
	private String content;
	private String writer;
	private Date regdate;
	private Date updateDate;

	private Long replyCnt;
}
