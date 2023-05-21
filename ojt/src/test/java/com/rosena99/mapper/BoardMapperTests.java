package com.rosena99.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.rosena99.domain.BoardVO;
import com.rosena99.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {

	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
	
	
	
	
	public void testTotalCount() {
		
	}
	@Test
	public void testPaging() {//917478 = 917477
		Criteria cri = new Criteria(2, 10);
		cri.setKeyword("새로");
		cri.setType("TC");
		
		mapper.getListWithPaging(cri).forEach(board->log.info(board));
	}
	
	public void testGetList() {
		mapper.getList().forEach(board->log.info(board));
	}
	
	public void testRead() {
		BoardVO board = mapper.read(1L);
		log.info(board);
	}
	
	
	
	public void testDelete() {
		mapper.delete(2L);
	}
	
	public void testInsert() {
		BoardVO board = new BoardVO();
		board.setTitle("새로 작성하는 글");
		board.setContent("새로 작성하는 내용");
		board.setWriter("newble");
		
		mapper.insert(board);
	}
	
	
	public void testInsertSelectKey() {
		BoardVO board = new BoardVO();
		board.setTitle("새로 작성하는 글");
		board.setContent("새로 작성하는 내용");
		board.setWriter("newble");
		
		mapper.insertSelectKey(board);
	}
	
	
	public void testInsertLastKey() {
		BoardVO board = new BoardVO();
		board.setTitle("새로 작성하는 글");
		board.setContent("새로 작성하는 내용");
		board.setWriter("newble");
		
		mapper.insertLastKey(board);
		long res = board.getBno();
		log.info("[res:]"+res);
	}
	
	
	public void testUpdate() {
		BoardVO board = new BoardVO();
		board.setBno(3L);
		board.setTitle("수정 작성하는 글");
		board.setContent("수정 작성하는 내용");
		board.setWriter("newble");
		
		mapper.update(board);
	}
}

