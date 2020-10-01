package com.yedam.erp.view;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.erp.employees.EmployeesService;
import com.yedam.erp.employees.EmployeesVO;

@Controller
public class EmployeeController {

	@Autowired
	EmployeesService employeesService;

	@RequestMapping("getEmployeeList")
	public String getEmployeeList(Model model, EmployeesVO vo) {
		model.addAttribute("list", employeesService.getEmployeesList(vo));
		return "employees/getEmployeeList";
	}

	@RequestMapping("getEmployeeListData")
	@ResponseBody
	public List<EmployeesVO> getEmployeeListData(EmployeesVO vo) {
		return employeesService.getEmployeesList(vo);
	}

}
