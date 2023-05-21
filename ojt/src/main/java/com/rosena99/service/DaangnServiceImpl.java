package com.rosena99.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rosena99.domain.DaangnVO;
import com.rosena99.domain.Criteria;
import com.rosena99.mapper.DaangnMapper;

import lombok.Setter;

@Service
public class DaangnServiceImpl implements DaangnService {
	
	//spring 4.3 이상에서 자동 처리
	@Setter(onMethod_ = @Autowired)
	private DaangnMapper mapper;
	
	@Override
	public void register(DaangnVO daangn) {
		mapper.insertSelectKey(daangn);		
	}

	@Override
	public DaangnVO get(Long bno) {
		return mapper.read(bno);
	}

	@Override
	public boolean modify(DaangnVO daangn) {
		return mapper.update(daangn);
	}

	@Override
	public boolean remove(Long bno) {
		return mapper.delete(bno);
	}
	
	@Deprecated
	@Override
	public List<DaangnVO> getList() {
		return mapper.getList();
	}

	@Override
	public List<DaangnVO> getList(Criteria cri) {
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {		
		return mapper.getTotalCount(cri);
	}

}
