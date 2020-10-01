package com.yedam.erp.employees.impl;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yedam.erp.employees.EmployeesVO;

@Repository
public class EmployeesMybatisDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public void insertEmployees(EmployeesVO vo) {
		sqlSession.insert("employees.insertEmployees", vo);
	}

	public void updateEmployees(EmployeesVO vo) {
		sqlSession.update("employees.updateEmployees", vo);
	}

	public void deleteEmployees(EmployeesVO vo) {
		sqlSession.delete("employees.deleteEmployees", vo);
	}

	public EmployeesVO getEmployees(EmployeesVO vo) {
		return sqlSession.selectOne("employees.getEmployees", vo);
	}

	public List<EmployeesVO> getEmployeesList(EmployeesVO vo) {
		return sqlSession.selectList("employees.getEmployeesList", vo);
	}

	public void deleteEmployeesList(ArrayList<String> seq) {
		sqlSession.delete("employees.deleteEmployeesList", seq);
	}

	public int getCount(EmployeesVO vo) {
		return sqlSession.selectOne("employees.getCount", vo);
	}
}
