package freeboard;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kosta136th.freeBoard.FreeBoard;
import com.kosta136th.freeBoard.FreeBoardDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class FreeboardDAOTest {
	
	private static final Logger logger = LoggerFactory.getLogger(FreeboardDAOTest.class);
	
	@Inject
	private FreeBoardDAO dao;
	private FreeBoard freeBoard;

	@Test
	public void testCreate() throws Exception {
																																																																																																												
		freeBoard = new FreeBoard();
		
		freeBoard.setTitle("새글 타이틀 쓰기를 테스트 합니다.");
		freeBoard.setContent("새글 내용 쓰기를 테스트 합니다.");
		freeBoard.setWriter("user04");
		dao.create(freeBoard);
		logger.info("새로운 글을 등록 했습니다.");
	}
	
	@Test
	public void testRead() throws Exception{
		
		logger.info(dao.read(7).toString());
	}
	
	@Test
	public void testUpdate() throws Exception{
		
		logger.info("여긴오나요?.............");
		
		freeBoard = new FreeBoard();
		
		freeBoard.setFreeBoard_Num(7);
		freeBoard.setTitle("수정 제목 테스트 입니다.");
		freeBoard.setContent("수정 내용 테스트 입니다.");
		System.out.println(freeBoard.getTitle());
	 	dao.update(freeBoard);
	}
	
	@Test
	public void testDelete() throws Exception{
		dao.delete(1);
	}
}
