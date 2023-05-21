package com.rosena99.service;

import java.util.List;

import com.rosena99.domain.DaangnVO;
import com.rosena99.domain.Criteria;

public interface DaangnService {

	//글등록
	public void register(DaangnVO daangn);
	
	//글상세내용
	public DaangnVO get(Long bno);
	
	//글수정
	public boolean modify(DaangnVO daangn);
	
	//글삭제
	public boolean remove(Long bno);
	
	//글목록
	public List<DaangnVO> getList();
	
	public List<DaangnVO> getList(Criteria cri);
	
	public int getTotal(Criteria cri);
}
