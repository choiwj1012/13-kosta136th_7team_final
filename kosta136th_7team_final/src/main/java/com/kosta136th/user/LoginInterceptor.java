package com.kosta136th.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	
	private static final String LOGIN = "login";
	
	@Override
	  public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		System.out.println("플헨들러실행");
		Object userVO = request.getSession().getAttribute("userVO");
		HttpSession session = request.getSession();

	    if (userVO != null) {
	      System.out.println("clear login data before");
	      session.removeAttribute(LOGIN);
	      session.invalidate();
	    }

	    return true;
	  }
	
	@Override
	  public void postHandle(HttpServletRequest request, 
	      HttpServletResponse response, Object handler,
	      ModelAndView modelAndView) throws Exception {
		System.out.println("포스트핸들실행");
		Object userVO = request.getSession().getAttribute("userVO");
		HttpSession session = request.getSession();
	    if (userVO != null) {
	      System.out.println("new login success");
	      session.setAttribute(LOGIN, userVO);
	      System.out.println(session.getAttribute(LOGIN));
	    }
	  }

}
