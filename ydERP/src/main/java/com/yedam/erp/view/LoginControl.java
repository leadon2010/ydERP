package com.yedam.erp.view;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yedam.erp.items.CustomerService;
import com.yedam.erp.items.CustomerVO;
import com.yedam.erp.login.LoginService;

@Controller
public class LoginControl {

	// 판매업체 정보 인터페이스.
	@Autowired
	CustomerService customerService;

	@Autowired
	LoginService loginService;

	// 로그인 기능부분

	// 로그인 폼
	@RequestMapping("login")
	public String login() {
		return "items/login"; // views/items/login.jsp로 이동
	}

	// 로그인 처리
	@RequestMapping("loginCheck")
	public ModelAndView loginCheck(@ModelAttribute CustomerVO vo, HttpSession session, Model model) {

		boolean result = loginService.loginCheckN(vo, session);
		ModelAndView mav = new ModelAndView();

		if (result == true) { // 로그인 성공시

			// jqgrid 클릭 이벤트시 가져올 판매업체 한 개의 정보값을 저장한다.
			vo = customerService.getCustomer(vo);

			// session에 로그인정보값을 저장한다.
			session.setAttribute("viewCustomer", vo);
			// getPurchaseRequest.jsp로 이동
			if (vo.getCustomerCode().equals("admin12345") && vo.getCustomerPw().equals("pw")) {
				mav.setViewName("/home");
			} else {
				mav.setViewName("items/getPurchaseRequest");
			}
			mav.addObject("msg", "success");

		} else { // 로그인 실패시
			// login.jsp로 이동
			mav.setViewName("items/login");
			mav.addObject("msg", "failure");
		}
		return mav;
	}

	// 로그아웃 처리
	@RequestMapping("logout")
	public ModelAndView logout(HttpSession session) {
		loginService.logout(session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("items/login");
		mav.addObject("msg", "logout");
		return mav;
	}

}
