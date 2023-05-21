package com.rosena99.service;

import java.util.List;

import com.rosena99.domain.PharmacyVO;
import com.rosena99.domain.PharmacyCriteria;

public interface PharmacyService {

	//글등록
	public void register(PharmacyVO pharmacy);
	
	//글상세내용
	public PharmacyVO get(Long bno);
	
	//글수정
	public boolean modify(PharmacyVO pharmacy);
	
	//글삭제
	public boolean remove(Long bno);
	
	//글목록	
	public List<PharmacyVO> getList(PharmacyCriteria cri);
	
	public int getTotal(PharmacyCriteria cri);
}
