package com.rosena99.service;

import static org.junit.Assert.assertNotNull;

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
public class BoardServiceTests {

	@Setter(onMethod_ = @Autowired)
	private BoardService service;
	
	
	public void testExist() {
		assertNotNull(service);
	}
	

	
	public void testRegister() {
		BoardVO board = new BoardVO();
		board.setTitle("새로 작성하는 글");
		board.setContent("새로 작성하는 내용");
		board.setWriter("newble");
		
		service.register(board);
		log.info("생성된 게시물의 번호:" + board.getBno());
	}
	
	@Test
	public void testPaging() {//917478 = 917477
		Criteria cri = new Criteria(2, 10);
		
		service.getList(cri).forEach(board->log.info(board));
	}
	
	public void testGetList() {
		service.getList().forEach(board->log.info(board));
	}
	
	public void testGet() {
		BoardVO board = service.get(4L);
		log.info(board);
	}
	
	
	public void testModify() {
		BoardVO board = new BoardVO();
		board.setBno(4L);
		board.setTitle("수정 작성하는 글");
		board.setContent("수정 작성하는 내용");
		board.setWriter("newble");
		
		service.modify(board);
	}
	
	public void testRemove() {
		BoardVO board = new BoardVO();
		board.setBno(4L);
		service.remove(board);
	}
}





