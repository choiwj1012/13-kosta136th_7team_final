package com.kosta136th.freeBoard;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kosta136th.freeBoard.FreeBoardReply;
import com.kosta136th.freeBoard.Criteria;
import com.kosta136th.freeBoard.PageMaker;
import com.kosta136th.freeBoard.FreeBoardReplyService;

@RestController
@RequestMapping("/replies")
public class FreeBoardReplyController {
	
	@Inject
	  private FreeBoardReplyService service;

	  @RequestMapping(value = "", method = RequestMethod.POST)
	  public ResponseEntity<String> register(@RequestBody FreeBoardReply vo) {

	    ResponseEntity<String> entity = null;
	    try {
	      service.addReply(vo);
	      entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
	    } catch (Exception e) {
	      e.printStackTrace();
	      entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
	    }
	    return entity;
	  }

	  @RequestMapping(value = "/all/{freeBoard_Num}", method = RequestMethod.GET)
	  public ResponseEntity<List<FreeBoardReply>> list(@PathVariable("freeBoard_Num") Integer freeBoard_Num) {

	    ResponseEntity<List<FreeBoardReply>> entity = null;
	    try {
	      entity = new ResponseEntity<>(service.listReply(freeBoard_Num), HttpStatus.OK);

	    } catch (Exception e) {
	      e.printStackTrace();
	      entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
	    }

	    return entity;
	  }

	  /*@RequestMapping(value = "/{reply_Num}", method = { RequestMethod.PUT, RequestMethod.PATCH })
	  public ResponseEntity<String> update(@PathVariable("reply_Num") Integer reply_Num, @RequestBody FreeBoardReply vo) {

	    ResponseEntity<String> entity = null;
	    try {
	      vo.setRno(reply_Num);
	      service.modifyReply(vo);

	      entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
	    } catch (Exception e) {
	      e.printStackTrace();
	      entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
	    }
	    return entity;
	  }

	  @RequestMapping(value = "/{reply_Num}", method = RequestMethod.DELETE)
	  public ResponseEntity<String> remove(@PathVariable("reply_Num") Integer reply_Num) {

	    ResponseEntity<String> entity = null;
	    try {
	      service.removeReply(reply_Num);
	      entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
	    } catch (Exception e) {
	      e.printStackTrace();
	      entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
	    }
	    return entity;
	  }*/

	  @RequestMapping(value = "/{freeBoard_Num}/{page}", method = RequestMethod.GET)
	  public ResponseEntity<Map<String, Object>> listPage(
	      @PathVariable("freeBoard_Num") Integer freeBoard_Num,
	      @PathVariable("page") Integer page) {

	    ResponseEntity<Map<String, Object>> entity = null;
	    
	    try {
	      Criteria cri = new Criteria();
	      cri.setPage(page);

	      PageMaker pageMaker = new PageMaker();
	      pageMaker.setCri(cri);

	      Map<String, Object> map = new HashMap<String, Object>();
	      List<FreeBoardReply> list = service.listReplyPage(freeBoard_Num, cri);

	      map.put("list", list);

	      int replyCount = service.count(freeBoard_Num);
	      pageMaker.setTotalCount(replyCount);

	      map.put("pageMaker", pageMaker);

	      entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);

	    } catch (Exception e) {
	      e.printStackTrace();
	      entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
	    }
	    return entity;
	  }
}
