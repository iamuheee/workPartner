package com.wp.workpartner.common.interceptor;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class LoginInterceptor implements HandlerInterceptor {
	
	@Override 
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		// return true  : 기존의 MVC흐름대로 Controller 실행
		// return false : Controller를 실행시키지 않음
		    
		HttpSession session = request.getSession();
		
		if(session.getAttribute("loginUser") != null) {
			return true;
		}else {
			session.setAttribute("alertMsg", "로그인 후 이용 가능한 서비스입니다.");
			response.sendRedirect(request.getContextPath());
			return false;
		}
		
	}

	
}
