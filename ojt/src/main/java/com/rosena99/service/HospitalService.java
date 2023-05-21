package com.rosena99.service;

import java.util.List;

import com.rosena99.domain.HospitalVO;
import com.rosena99.domain.HospitalCriteria;

public interface HospitalService {

	//글등록
	public void register(HospitalVO hospital);
	
	//글상세내용
	public HospitalVO get(Long bno);
	
	//글수정
	public boolean modify(HospitalVO hospital);
	
	//글삭제
	public boolean remove(Long bno);
	
	//글목록
	public List<HospitalVO> getList();
	
	public List<HospitalVO> getList(HospitalCriteria cri);
	
	public int getTotal(HospitalCriteria cri);
}
