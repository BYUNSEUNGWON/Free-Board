package com.rosena99.domain;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageDTO {

	private int startPage;//시작번호
	private int endPage;//끝번호
	private boolean prev, next;//이전, 다음 여부
	
	private int pageCount;//페이징에 보여줄 숫자수
	
	private int total;//전체글수
	private int realEnd;//전체 페이지수
	
	private Criteria cri;//현재페이지번호, 한페이지에 보여줄 개수
	
	public PageDTO(Criteria cri, int total) {
		this.cri = cri;
		this.total = total;
		this.pageCount = 5;
		
		
		//endPage 구하는 공식
		this.endPage = (int)(Math.ceil(cri.getPageNum() / (pageCount*1.0)))*pageCount;
		//startPage 구하는 공식
		this.startPage = this.endPage - (pageCount-1);
		//전체 페이지수
		this.realEnd = (int)(Math.ceil((total*1.) / cri.getAmount()));
		
		if(this.realEnd < this.endPage) {
			this.endPage = this.realEnd;
		}
		
		this.prev = this.startPage > 1;
		this.next = this.endPage < this.realEnd;
	}
	
}
