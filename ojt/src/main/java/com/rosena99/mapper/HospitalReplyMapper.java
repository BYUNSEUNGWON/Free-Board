package com.rosena99.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.rosena99.domain.HospitalReplyVO;
import com.rosena99.domain.Criteria;
import com.rosena99.domain.HospitalCriteria;

public interface HospitalReplyMapper {

	public int insert(HospitalReplyVO vo);
	
	public HospitalReplyVO read(Long rno);//특정 댓글읽기
	
	public int delete(Long rno);
	
	public int update(HospitalReplyVO vo);
	
	public List<HospitalReplyVO> getListWithPaging(@Param("cri") HospitalCriteria cri, 
												@Param("bno")Long bno);
}
