package com.rosena99.mapper;

import java.util.List;

import com.rosena99.domain.PharmacyVO;
import com.rosena99.domain.PharmacyCriteria;

public interface PharmacyMapper {
	
	public List<PharmacyVO> getListWithPaging(PharmacyCriteria cri);
	
	public int getTotalCount(PharmacyCriteria cri);
	
	public void insertSelectKey(PharmacyVO pharmacy);
	
	public PharmacyVO read(Long bno);

	public boolean delete(Long bno);
	
	public boolean update(PharmacyVO pharmacy);
	
}
