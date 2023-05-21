package com.rosena99.mapper;


import java.util.List;
import java.util.Map;

import com.rosena99.domain.AuthVO;
import com.rosena99.domain.BoardVO;
import com.rosena99.domain.Criteria;
import com.rosena99.domain.MemberVO;

public interface MemberMapper {
	
	public MemberVO read(String userid);

	public void insert(MemberVO vo);

	public void insertAuth(AuthVO auth);

	public void forget(MemberVO vo);

	public void memberList(MemberVO vo);

	public List<MemberVO> getListWithPaging(Criteria cri);

	public void update(MemberVO vo);




	


	
	
}
