package com.rosena99.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rosena99.domain.HospitalVO;
import com.rosena99.domain.HospitalCriteria;
import com.rosena99.mapper.HospitalMapper;

import lombok.Setter;

@Service
public class HospitalServiceImpl implements HospitalService {
	
	//spring 4.3 이상에서 자동 처리
	@Setter(onMethod_ = @Autowired)
	private HospitalMapper mapper;
	
	@Override
	public void register(HospitalVO hospital) {
		mapper.insertSelectKey(hospital);
	}

	@Override
	public HospitalVO get(Long bno) {
		return mapper.read(bno);
	}

	@Override
	public boolean modify(HospitalVO hospital) {
		return mapper.update(hospital);
	}

	@Override
	public boolean remove(Long bno) {
		return mapper.delete(bno);
	}
	
	@Deprecated
	@Override
	public List<HospitalVO> getList() {
		return mapper.getList();
	}

	@Override
	public List<HospitalVO> getList(HospitalCriteria cri) {
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(HospitalCriteria cri) {		
		return mapper.getTotalCount(cri);
	}

}
