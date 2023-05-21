package com.rosena99.mapper;

import java.util.stream.IntStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.rosena99.domain.BoardReplyVO;
import com.rosena99.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardReplyMapperTests {
	@Setter(onMethod_ = @Autowired)
	private BoardReplyMapper mapper;
	
	public void tesetMapper() {
		log.info(mapper);
	}
	
	
	public void testInsert() {
		IntStream.rangeClosed(1, 10).forEach(i -> {
			BoardReplyVO vo = new BoardReplyVO();
			vo.setBno(917487L);
			vo.setReply("댓글 테스트 " + i);
			vo.setReplyer("replyer" + i);
			
			mapper.insert(vo);
		});
	}
	
	public void testRead() {
		mapper.read(1L);
	}
	
	
	public void testDelete() {
		mapper.delete(10L);
	}
	
	
	public void testUpdate() {
		BoardReplyVO vo = new BoardReplyVO();
		vo.setRno(1L);
		vo.setReply("수정 댓글 테스트 ");
		
		mapper.update(vo);
	}
	@Test
	public void testList2() {
		Criteria cri = new Criteria(1, 10);
		
		mapper.getListWithPaging(0, 10, 917487L);
	}
	
	public void testList() {
		Criteria cri = new Criteria();
		
		//mapper.getListWithPaging(cri, 917487L);
	}
}
