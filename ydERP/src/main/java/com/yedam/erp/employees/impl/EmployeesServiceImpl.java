package com.yedam.erp.employees.impl;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.erp.employees.EmployeesService;
import com.yedam.erp.employees.EmployeesVO;


@Service("employeesService")
public class EmployeesServiceImpl implements EmployeesService {

	@Autowired
	EmployeesMybatisDAO dao;

	@Override
	public void insertEmployees(EmployeesVO vo) {
		dao.insertEmployees(vo);
	}

	@Override
	public void updateEmployees(EmployeesVO vo) {
		dao.updateEmployees(vo);
	}

	@Override
	public void deleteEmployees(EmployeesVO vo) {
		dao.deleteEmployees(vo);
	}

	@Override
	public EmployeesVO getEmployees(EmployeesVO vo) {
		return dao.getEmployees(vo);
	}

	@Override
	public List<EmployeesVO> getEmployeesList(EmployeesVO vo) {
		return dao.getEmployeesList(vo);
	}

	@Override
	public void deleteEmployeesList(ArrayList<String> itemCode) {
		dao.deleteEmployeesList(itemCode);
		;
	}

	@Override
	public int getCount(EmployeesVO vo) {
		return dao.getCount(vo);
	}

}
