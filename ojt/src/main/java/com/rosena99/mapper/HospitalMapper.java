package com.rosena99.mapper;

import java.util.List;

import com.rosena99.domain.HospitalVO;
import com.rosena99.domain.HospitalCriteria;

public interface HospitalMapper {

	public List<HospitalVO> getList();
	
	public List<HospitalVO> getListWithPaging(HospitalCriteria cri);
	
	public int getTotalCount(HospitalCriteria cri);
	
	public void insert(HospitalVO hospital);
	
	public void insertSelectKey(HospitalVO hospital);
	
	public void insertLastKey(HospitalVO hospital);//글등록후 A.I 값알아내기
	
	public HospitalVO read(Long bno);

	public boolean delete(Long bno);
	
	public boolean update(HospitalVO hospital);

	public void updateReplyCnt(Long bno);
	
	public void deleteReplyCnt(Long bno);
	
	
	
}
