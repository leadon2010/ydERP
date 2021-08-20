package com.yedam.erp.login.impl;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yedam.erp.items.CustomerVO;

@Repository
public class LoginMybatisDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	// 회원 로그인체크
	public boolean loginCheckM(CustomerVO vo) {
		System.out.println("loginCheckVO ======= " + vo);
		String name = sqlSession.selectOne("items.loginCheck", vo);
		System.out.println("loginCheck ======= ");
//		return (name == null) ? false : true;
		return true;
	}

	// 회원 로그인 정보
	public CustomerVO viewCustomer(CustomerVO vo) {
		System.out.println("viewCustomer = = " + vo);
		return sqlSession.selectOne("items.viewCustomer", vo);
	}

	// 회원 로그아웃
	public void logout(HttpSession sessin) {

	}

}
