package com.rosena99.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class BoardVO {

	private final String TABLE_ID = "board";
	private Long bno;
	private String title;
	private String content;
	private String writer;
	private Date regdate;
	private Date updateDate;

	private Long replyCnt;
	private Long hit;
	
	private List<BoardAttachVO> attachList;
	
}
