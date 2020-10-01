package com.yedam.erp.login.impl;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.erp.items.CustomerVO;
import com.yedam.erp.login.LoginService;

@Service("loginService")
public class LoginServiceImpl implements LoginService {

	@Autowired
	LoginMybatisDAO dao;

	// 회원 로그인체크
	@Override
	public boolean loginCheckN(CustomerVO vo, HttpSession session) {
		System.out.println("before lochinChaeck === " + vo);
		boolean result = dao.loginCheckM(vo);
		if (result) { // true일 경우 세션에 등록
			CustomerVO vo2 = viewCustomer(vo);
			// 세션 변수 등록
			session.setAttribute("getCustomerCode", vo2.getCustomerCode());
			session.setAttribute("getCustomerName", vo2.getCustomerName());
		}
		System.out.println("before lochinChaeck end === " + vo);
		return result;

	}

	// 로그인 정보
	@Override
	public CustomerVO viewCustomer(CustomerVO vo) {
		System.out.println("viewcustomer === " + vo);
		return dao.viewCustomer(vo);
	}

	// 로그아웃
	@Override
	public void logout(HttpSession session) {
		session.invalidate();
	}

}
