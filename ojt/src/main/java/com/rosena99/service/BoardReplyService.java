package com.rosena99.service;

import java.util.List;

import com.rosena99.domain.BoardReplyPageDTO;
import com.rosena99.domain.BoardReplyVO;
import com.rosena99.domain.Criteria;

public interface BoardReplyService {

	public int register(BoardReplyVO vo);
	
	public BoardReplyVO get(Long rno);
	
	public int modify(BoardReplyVO vo);
	
	public int remove(Long rno);
	
	public BoardReplyPageDTO getList(int start, int amount, Long bno);
}
