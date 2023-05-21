package com.rosena99.mapper;

import java.util.List;

import com.rosena99.domain.Criteria;
import com.rosena99.domain.RecordVO;

public interface RecordMapper {

	public List<RecordVO> getListWithPaging(Criteria cri);

	public void insertSelectKey(RecordVO record);

}
