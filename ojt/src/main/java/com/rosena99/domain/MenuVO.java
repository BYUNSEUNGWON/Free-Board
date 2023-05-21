package com.rosena99.domain;

import lombok.Data;

@Data
public class MenuVO {
	private int brand;
	private int cno;
	
	private String name;
	private String price;
	private String content;
	private String info;
	private String img;
	
	private boolean enabled;
	
}
