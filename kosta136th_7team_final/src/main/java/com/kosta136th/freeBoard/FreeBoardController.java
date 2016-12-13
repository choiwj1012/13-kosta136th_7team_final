package com.kosta136th.freeBoard;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.kosta136th.freeBoard.FreeBoard;
import com.kosta136th.freeBoard.FreeBoardService;

@Controller
@RequestMapping("/freeBoard/*")
public class FreeBoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(FreeBoardController.class);
	
	@Inject
	private FreeBoardService service;
	
	@RequestMapping(value = "/board_write", method = RequestMethod.GET)
	public void registerGET(FreeBoard board, Model model) throws Exception {
		
		logger.info("register get...");
	}
	
	@RequestMapping(value = "/board_write", method = RequestMethod.POST)
	  public String registPOST(FreeBoard board, RedirectAttributes rttr) throws Exception {

	    logger.info("regist post ...........");
	    logger.info(board.toString());

	    service.regist(board);

	    rttr.addFlashAttribute("msg", "success");
	    return "redirect:/freeboard/board_list";
	  }

	  @RequestMapping(value = "/board_list", method = RequestMethod.GET)
	  public void listAll(Model model) throws Exception {

	    logger.info("show all list......................");
	    model.addAttribute("board_list", service.listAll());
	  }

//	  @RequestMapping(value = "/read", method = RequestMethod.GET)
//	  public void read(@RequestParam("bno") int bno, Model model) throws Exception {
//
//	    model.addAttribute(service.read(bno));
//	  }
//
//	  @RequestMapping(value = "/remove", method = RequestMethod.POST)
//	  public String remove(@RequestParam("bno") int bno, RedirectAttributes rttr) throws Exception {
//
//	    service.remove(bno);
//
//	    rttr.addFlashAttribute("msg", "SUCCESS");
//
//	    return "redirect:/board/listAll";
//	  }
//
//	  @RequestMapping(value = "/modify", method = RequestMethod.GET)
//	  public void modifyGET(int bno, Model model) throws Exception {
//
//	    model.addAttribute(service.read(bno));
//	  }
//
//	  @RequestMapping(value = "/modify", method = RequestMethod.POST)
//	  public String modifyPOST(BoardVO board, RedirectAttributes rttr) throws Exception {
//
//	    logger.info("mod post............");
//
//	    service.modify(board);
//	    rttr.addFlashAttribute("msg", "SUCCESS");
//
//	    return "redirect:/board/listAll";
//	  }
//
//	  @RequestMapping(value = "/listCri", method = RequestMethod.GET)
//	  public void listAll(Criteria cri, Model model) throws Exception {
//
//	    logger.info("show list Page with Criteria......................");
//
//	    model.addAttribute("list", service.listCriteria(cri));
//	  }
//
//	  @RequestMapping(value = "/listPage", method = RequestMethod.GET)
//	  public void listPage(@ModelAttribute("cri") Criteria cri, Model model) throws Exception {
//
//	    logger.info(cri.toString());
//
//	    model.addAttribute("list", service.listCriteria(cri));
//	    PageMaker pageMaker = new PageMaker();
//	    pageMaker.setCri(cri);
//	    // pageMaker.setTotalCount(131);
//
//	    pageMaker.setTotalCount(service.listCountCriteria(cri));
//
//	    model.addAttribute("pageMaker", pageMaker);
//	  }
//
//	  @RequestMapping(value = "/readPage", method = RequestMethod.GET)
//	  public void read(@RequestParam("bno") int bno, @ModelAttribute("cri") Criteria cri, Model model) throws Exception {
//
//	    model.addAttribute(service.read(bno));
//	  }
//
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
//	  public void modifyPagingGET(@RequestParam("bno") int bno, @ModelAttribute("cri") Criteria cri, Model model)
//	      throws Exception {
//
//	    model.addAttribute(service.read(bno));
//	  }
}
