package com.kosta136th.dealer;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kosta136th.user.User;

@RestController
public class DealerController {

	@Inject
	DealerService service;
	
	@RequestMapping(value = "/DealerPageSave", method = RequestMethod.GET)
	public void DealerPageSave(HttpSession session) {
		User user = (User)(session.getAttribute("signinSessionDTO"));
		System.out.println(user.toString());
			
	}
	
	
	
}
