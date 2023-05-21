package com.rosena99.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rosena99.domain.PharmacyCriteria;
import com.rosena99.domain.PharmacyVO;
import com.rosena99.mapper.PharmacyMapper;

import lombok.Setter;

@Service
public class PharmacyServiceImpl implements PharmacyService {
	
	@Setter(onMethod_ = @Autowired)
	private PharmacyMapper mapper;

	@Override
	public void register(PharmacyVO pharmacy) {
		mapper.insertSelectKey(pharmacy);
	}

	@Override
	public PharmacyVO get(Long bno) {
		return mapper.read(bno);
	}

	@Override
	public boolean modify(PharmacyVO pharmacy) {
		return mapper.update(pharmacy);
	}

	@Override
	public boolean remove(Long bno) {
		return mapper.delete(bno);
	}

	@Override
	public List<PharmacyVO> getList(PharmacyCriteria cri) {
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(PharmacyCriteria cri) {
		
		return mapper.getTotalCount(cri);
	}

}
