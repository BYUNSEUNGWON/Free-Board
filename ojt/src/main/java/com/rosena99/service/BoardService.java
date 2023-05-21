package com.rosena99.service;

import java.util.List;

import com.rosena99.domain.BoardAttachVO;
import com.rosena99.domain.BoardVO;
import com.rosena99.domain.Criteria;

public interface BoardService {

	//글등록
	public void register(BoardVO board);
	
	//글상세내용
	public BoardVO get(Long bno);
	
	//글수정
	public boolean modify(BoardVO board);
	
	//글삭제
	public boolean remove(BoardVO board);
	
	//글목록
	public List<BoardVO> getList();
	
	public List<BoardVO> getList(Criteria cri);
	
	public int getTotal(Criteria cri);
	
	public List<BoardAttachVO> getAttachList(BoardVO vo);
}
