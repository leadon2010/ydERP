package com.yedam.erp.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class Interceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		try {
			// admin이라는 세션key를 가진 정보가 널일경우 로그인페이지로 이동
			if (request.getSession().getAttribute("viewCustomer") == null) {
				response.sendRedirect("login");
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		// admin 세션key 존재시 main 페이지 이동
		return true;
	}

}
