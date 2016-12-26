package freeboard;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kosta136th.freeBoard.FreeBoard;
import com.kosta136th.freeBoard.FreeBoardService;

@Controller
@RequestMapping("/board/*")
public class FreeBoardControllerTest {

	private static final Logger logger = 
			LoggerFactory.getLogger(FreeBoardControllerTest.class);
	
	@Inject
	private FreeBoardService service;
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registerGET(FreeBoard board, Model model) throws Exception {
		
		logger.info("register get...........");
		
	}
}
