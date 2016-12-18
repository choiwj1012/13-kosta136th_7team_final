package com.kosta136th.freeBoard;

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
import com.kosta136th.freeBoard.PageMaker;
import com.kosta136th.freeBoard.SearchCriteria;
import com.kosta136th.freeBoard.FreeBoardService;



@Controller
@RequestMapping("/freebaord/*")
public class SearchFreeBoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(SearchFreeBoardController.class);

	  @Inject
	  private FreeBoardService service;

	  @RequestMapping(value = "/sboard_list", method = RequestMethod.GET)
	  public void listPage(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {

	    logger.info(cri.toString());

	    // model.addAttribute("list", service.listCriteria(cri));
	    model.addAttribute("sboard_list", service.listSearchCriteria(cri));

	    PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);

	    // pageMaker.setTotalCount(service.listCountCriteria(cri));
	    pageMaker.setTotalCount(service.listSearchCount(cri));

	    model.addAttribute("pageMaker", pageMaker);
	  }

	  @RequestMapping(value = "/sboard_readPage", method = RequestMethod.GET)
	  public void read(@RequestParam("freeBoard_Num") int freeBoard_Num, @ModelAttribute("cri") SearchCriteria cri, Model model)
	      throws Exception {

	    model.addAttribute(service.read(freeBoard_Num));
	  }

//	  @RequestMapping(value = "/removePage", method = RequestMethod.POST)
//	  public String remove(@RequestParam("bno") int bno, SearchCriteria cri, RedirectAttributes rttr) throws Exception {
//
//	    service.remove(bno);
//
//	    rttr.addAttribute("page", cri.getPage());
//	    rttr.addAttribute("perPageNum", cri.getPerPageNum());
//	    rttr.addAttribute("searchType", cri.getSearchType());
//	    rttr.addAttribute("keyword", cri.getKeyword());
//
//	    rttr.addFlashAttribute("msg", "SUCCESS");
//
//	    return "redirect:/sboard/list";
//	  }

//	  @RequestMapping(value = "/modifyPage", method = RequestMethod.GET)
//	  public void modifyPagingGET(int bno, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
//
//	    model.addAttribute(service.read(bno));
//	  }
//
//	  @RequestMapping(value = "/modifyPage", method = RequestMethod.POST)
//	  public String modifyPagingPOST(FreeBoard freeBoard, SearchCriteria cri, RedirectAttributes rttr) throws Exception {
//
//	    logger.info(cri.toString());
//	    service.modify(freeBoard);
//
//	    rttr.addAttribute("page", cri.getPage());
//	    rttr.addAttribute("perPageNum", cri.getPerPageNum());
//	    rttr.addAttribute("searchType", cri.getSearchType());
//	    rttr.addAttribute("keyword", cri.getKeyword());
//
//	    rttr.addFlashAttribute("msg", "SUCCESS");
//
//	    logger.info(rttr.toString());
//
//	    return "redirect:/sboard/list";
//	  }

	  @RequestMapping(value = "/sboard_writer", method = RequestMethod.GET)
	  public void registGET() throws Exception {

	    logger.info("regist get ...........");
	  }

	  @RequestMapping(value = "/sboard_writer", method = RequestMethod.POST)
	  public String registPOST(FreeBoard freeBoard, RedirectAttributes rttr) throws Exception {

	    logger.info("regist post ...........");
	    logger.info(freeBoard.toString());

	    service.regist(freeBoard);

	    rttr.addFlashAttribute("msg", "SUCCESS");

	    return "redirect:/freeboard/sboard_list";
	  }
	
}
