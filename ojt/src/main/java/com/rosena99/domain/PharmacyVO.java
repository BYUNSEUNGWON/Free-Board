package com.rosena99.domain;

import java.util.Date;

import lombok.Data;

@Data
public class PharmacyVO {

	private Long bno;
	private String title;
	private String content;
	private String postCode;
	private String address;
	private String detailAddress;
	private String extraAddress;
	private String writer;
	private Date regdate;
	private Date updateDate;

}
