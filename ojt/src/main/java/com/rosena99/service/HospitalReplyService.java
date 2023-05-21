package com.rosena99.service;

import java.util.List;

import com.rosena99.domain.HospitalReplyVO;
import com.rosena99.domain.Criteria;
import com.rosena99.domain.HospitalCriteria;

public interface HospitalReplyService {

	public int register(HospitalReplyVO vo);
	
	public HospitalReplyVO get(Long rno);
	
	public int modify(HospitalReplyVO vo);
	
	public int remove(HospitalReplyVO vo);
	
	public List<HospitalReplyVO> getList(HospitalCriteria cri, Long bno);
}
