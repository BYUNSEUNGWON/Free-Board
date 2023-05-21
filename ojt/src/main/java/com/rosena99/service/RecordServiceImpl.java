package com.rosena99.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rosena99.domain.Criteria;
import com.rosena99.domain.RecordVO;
import com.rosena99.mapper.BoardMapper;
import com.rosena99.mapper.RecordMapper;

import lombok.Setter;

@Service
public class RecordServiceImpl implements RecordService{

	@Setter(onMethod_ = @Autowired)
	RecordMapper mapper;

	@Override
	public List<RecordVO> getList(Criteria cri) {
		return mapper.getListWithPaging(cri);

	}

	@Override
	public void register(RecordVO record) {
		mapper.insertSelectKey(record);
	
	}	
	

}
