package com.kosta136th.freeBoard;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kosta136th.freeBoard.FreeBoard;
import com.kosta136th.freeBoard.Criteria;
import com.kosta136th.freeBoard.PageMaker;
import com.kosta136th.freeBoard.FreeBoardService;
@Controller("freeBoardController")
public class FreeBoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(FreeBoardController.class);
	
	@Inject
	private FreeBoardService service;

	@RequestMapping("/sub/freeboard/board_list")
	public String getFreeBoardList(Model model) throws Exception {
		System.out.println("TEST 123123");
		model.addAttribute("board_list", service.listAll());
		return "/sub/freeboard/board_list";
	}
	
	@RequestMapping("/sub/freeboard/write")
	public String getFreeBoardWrite() {
		return "/sub/freeboard/board_write";
	}
	
	@RequestMapping("/sub/freeboard/board_write")
	public String registerGET(FreeBoard freeBoard, Model model) throws Exception {
		System.out.println("여기까지오니 123");
		System.out.println(freeBoard.getTitle());
		System.out.println(freeBoard.getContent());

		try {
			service.regist(freeBoard);
		} catch(Exception e) {
			e.printStackTrace();
		}
		List<FreeBoard> fb  = service.listAll();
		
		if(fb != null) {
			System.out.println("data insert sc");
		}
		
		System.out.println("return setting1");
		model.addAttribute("board_list", fb);
		System.out.println("return setting2");
		return "/sub/freeboard/board_list";
		
	}
/*	@RequestMapping(value = "/free/board_write", method = RequestMethod.POST)*/
/*	@RequestMapping(value = "/free/board_write", method = RequestMethod.GET)
	  public String registPOST(FreeBoard freeBoard, RedirectAttributes rttr) throws Exception {

	    service.regist(freeBoard);
	    System.out.println("여기지오니");
	    rttr.addFlashAttribute("msg", "success");
	    return "redirect:/sub/freeboard/board_list";
	  }*/

	  @RequestMapping(value = "/sub/free/board_list", method = RequestMethod.GET)
	  public void listAll(Model model) throws Exception {

	    model.addAttribute("board_list", service.listAll());
	  }

	  @RequestMapping(value = "/free/board_read", method = RequestMethod.GET)
	  public void read(@RequestParam("freeBoard_Num") int freeBoard_Num, Model model) throws Exception {

	    model.addAttribute(service.read(freeBoard_Num));
	  }

//	  @RequestMapping(value = "/remove", method = RequestMethod.POST)
//	  public String remove(@RequestParam("bno") int bno, RedirectAttributes rttr) throws Exception {
//
//	    service.remove(bno);
//
//	    rttr.addFlashAttribute("msg", "SUCCESS");
//
//	    return "redirect:/board/listAll";
//	  }

//	  @RequestMapping(value = "/modify", method = RequestMethod.GET)
//	  public void modifyGET(int bno, Model model) throws Exception {
//
//	    model.addAttribute(service.read(bno));
//	  }

//	  @RequestMapping(value = "/modify", method = RequestMethod.POST)
//	  public String modifyPOST(FreeBoard board, RedirectAttributes rttr) throws Exception {
//
//	    logger.info("mod post............");
//
//	    service.modify(board);
//	    rttr.addFlashAttribute("msg", "SUCCESS");
//
//	    return "redirect:/board/listAll";
//	  }

	  @RequestMapping(value = "/board_listCri", method = RequestMethod.GET)
	  public void listAll(Criteria cri, Model model) throws Exception {


	    model.addAttribute("board_list", service.listCriteria(cri));
	  }

	  @RequestMapping(value = "/board_listPage", method = RequestMethod.GET)
	  public void listPage(@ModelAttribute("cri") Criteria cri, Model model) throws Exception {


	    model.addAttribute("list", service.listCriteria(cri));
	    PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);
	    // pageMaker.setTotalCount(131);

	    pageMaker.setTotalCount(service.listCountCriteria(cri));

	    model.addAttribute("pageMaker", pageMaker);
	  }

	  @RequestMapping(value = "/board_readPage", method = RequestMethod.GET)
	  public void read(@RequestParam("freeBoard_Num") int freeBoard_Num, @ModelAttribute("cri") Criteria cri, Model model) throws Exception {

	    model.addAttribute(service.read(freeBoard_Num));
	  }

//	  @RequestMapping(value = "/removePage", method = RequestMethod.POST)
//	  public String remove(@RequestParam("bno") int bno, Criteria cri, RedirectAttributes rttr) throws Exception {
//
//	    service.remove(bno);
//
//	    rttr.addAttribute("page", cri.getPage());
//	    rttr.addAttribute("perPageNum", cri.getPerPageNum());
//	    rttr.addFlashAttribute("msg", "SUCCESS");
//
//	    return "redirect:/board/listPage";
//	  }
//
//	  @RequestMapping(value = "/modifyPage", method = RequestMethod.GET)
//	  public void modifyPagingGET(@RequestParam("freeBoard_Num") int freeBoard_Num, @ModelAttribute("cri") Criteria cri, Model model)
//	      throws Exception {
//
//	    model.addAttribute(service.read(freeBoard_Num));
//	  }
}
