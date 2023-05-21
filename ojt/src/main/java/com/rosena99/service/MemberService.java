package com.rosena99.service;

import java.util.List;

import com.rosena99.domain.AuthVO;
import com.rosena99.domain.BoardVO;
import com.rosena99.domain.Criteria;
import com.rosena99.domain.MemberVO;

public interface MemberService {
	
	public void register(MemberVO vo);

	public void authRegister(AuthVO auth);

	public void forget(MemberVO vo);


	public List<MemberVO> getList(Criteria cri);

	public MemberVO get(String userid);

	public MemberVO getMemberById(String userid);

	public void modify(MemberVO member);






	
	
}
