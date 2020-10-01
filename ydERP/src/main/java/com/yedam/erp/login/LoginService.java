package com.yedam.erp.login;

import javax.servlet.http.HttpSession;

import com.yedam.erp.items.CustomerVO;

public interface LoginService {
	// 로그인 체크
	public boolean loginCheckN(CustomerVO vo, HttpSession session);

	// 회원 로그인 정보
	public CustomerVO viewCustomer(CustomerVO vo);

	// 로그아웃
	public void logout(HttpSession session);

}
