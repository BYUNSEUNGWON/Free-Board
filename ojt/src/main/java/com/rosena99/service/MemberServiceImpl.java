package com.rosena99.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rosena99.domain.AuthVO;
import com.rosena99.domain.BoardVO;
import com.rosena99.domain.Criteria;
import com.rosena99.domain.MemberVO;
import com.rosena99.mapper.MemberMapper;

import lombok.Setter;

@Service
public class MemberServiceImpl implements MemberService{

	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;

	@Transactional
	@Override
	public void register(MemberVO vo) {
		mapper.insert(vo);
		
		for(AuthVO auth : vo.getAuthList()) {
			mapper.insertAuth(auth);			
		}
		
	}

	@Override
	public void authRegister(AuthVO auth) {
		mapper.insertAuth(auth);
	}

	
	@Override
	public void forget(MemberVO vo) {
		mapper.forget(vo);
		
	}

	@Override
	public List<MemberVO> getList(Criteria cri) {
		return mapper.getListWithPaging(cri);

	}

	
	@Override
	public MemberVO getMemberById(String userid) {
		return mapper.read(userid);

	}

	@Override
	public MemberVO get(String userid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void modify(MemberVO vo) {
			mapper.update(vo);
	}


	
	
	


	


	

	
	 
	
}


