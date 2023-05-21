package com.rosena99.mapper;

import java.util.List;

import com.rosena99.domain.BoardAttachVO;
import com.rosena99.domain.BoardVO;

public interface BoardAttachMapper {
	public void insert(BoardAttachVO vo);
	
	public void delete(String uuid);
	
	public List<BoardAttachVO> findByBno(BoardVO vo);
	
	public void deleteAll(BoardVO vo);

	public List<BoardAttachVO> getOldFiles();
}
