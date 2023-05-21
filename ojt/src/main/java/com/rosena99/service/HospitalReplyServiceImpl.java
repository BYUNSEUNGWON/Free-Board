package com.rosena99.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rosena99.domain.HospitalReplyVO;
import com.rosena99.domain.Criteria;
import com.rosena99.domain.HospitalCriteria;
import com.rosena99.mapper.HospitalMapper;
import com.rosena99.mapper.HospitalReplyMapper;

import lombok.Setter;

@Service
public class HospitalReplyServiceImpl implements HospitalReplyService {
	
	@Setter(onMethod_ = @Autowired)
	private HospitalReplyMapper replyMapper;
	
	@Setter(onMethod_ = @Autowired)
	private HospitalMapper mapper;

	@Transactional
	@Override
	public int register(HospitalReplyVO vo) {
		
		int res = replyMapper.insert(vo);
		mapper.updateReplyCnt(vo.getBno());
		
		return res;
	}

	@Override
	public HospitalReplyVO get(Long rno) {
		
		return replyMapper.read(rno);
	}

	@Override
	public int modify(HospitalReplyVO vo) {
		
		return replyMapper.update(vo);
	}

	@Override
	public int remove(HospitalReplyVO vo) {
		int res = replyMapper.delete(vo.getRno());
		mapper.deleteReplyCnt(vo.getBno());
		
		return res;
	}

	@Override
	public List<HospitalReplyVO> getList(HospitalCriteria cri, Long bno) {
		
		return replyMapper.getListWithPaging(cri, bno);
	}

}
