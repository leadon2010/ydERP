package com.yedam.erp.employees;

import java.util.ArrayList;
import java.util.List;

public interface EmployeesService {

	public void insertEmployees(EmployeesVO vo);

	public void updateEmployees(EmployeesVO vo);

	public void deleteEmployees(EmployeesVO vo);

	public EmployeesVO getEmployees(EmployeesVO vo);

	public List<EmployeesVO> getEmployeesList(EmployeesVO vo);

	public void deleteEmployeesList(ArrayList<String> id);

	public int getCount(EmployeesVO vo);
}
