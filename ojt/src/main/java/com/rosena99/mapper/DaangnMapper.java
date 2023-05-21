package com.rosena99.mapper;

import java.util.List;

import com.rosena99.domain.DaangnVO;
import com.rosena99.domain.Criteria;

public interface DaangnMapper {

	public List<DaangnVO> getList();
	
	public List<DaangnVO> getListWithPaging(Criteria cri);
	
	public int getTotalCount(Criteria cri);
	
	public void insert(DaangnVO daangn);
	
	public void insertSelectKey(DaangnVO daangn);
	
	public void insertLastKey(DaangnVO daangn);//글등록후 A.I 값알아내기
	
	public DaangnVO read(Long bno);

	public boolean delete(Long bno);
	
	public boolean update(DaangnVO daangn);
	
}
