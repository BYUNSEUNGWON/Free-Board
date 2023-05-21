package com.rosena99.service;

import java.util.List;

import com.rosena99.domain.Criteria;
import com.rosena99.domain.RecordVO;

public interface RecordService {

	public List<RecordVO> getList(Criteria cri);

	public void register(RecordVO record);

}
