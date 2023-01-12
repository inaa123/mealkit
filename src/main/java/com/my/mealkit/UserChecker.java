package com.my.mealkit;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class UserChecker implements HandlerInterceptor {
	   @Override
	    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
	        HttpSession session = request.getSession();
	        if (session == null || session.getAttribute("userId") == null) {
	            response.sendRedirect("/");
	            return false;
	        }
	        return true;
	    }
}
