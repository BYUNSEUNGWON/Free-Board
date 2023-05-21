package com.rosena99.domain;

import java.util.Date;

import lombok.Data;

@Data
public class RecordVO {

	private long bno;
	private String content;
	private String writer;
	private Date regdate1;
	private Date regdate;
}
