package com.rosena99.domain;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class MultipartFileVO {
	
	private MultipartFile img1;
	private MultipartFile img2;

}
