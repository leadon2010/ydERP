package com.yedam.erp.items.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.erp.items.CustomerService;
import com.yedam.erp.items.CustomerVO;

@Service("customerService")
public class CustomerServiceImpl implements CustomerService {

	@Autowired
	CustomerMybatisDAO dao;

	@Override
	public List<CustomerVO> getCustomerList(CustomerVO vo) {
		return dao.getCustomerList(vo);

	}

	@Override
	public void deleteCustomer(CustomerVO vo) {
		dao.deleteCustomer(vo);

	}

	@Override
	public void insertCustomer(CustomerVO vo) {
		dao.insertCustomer(vo);
	}

	@Override
	public void updateCustomer(CustomerVO vo) {
		dao.updateCustomer(vo);
	}

	@Override
	public CustomerVO getCustomer(CustomerVO vo) {
		return dao.getCustomer(vo);
	}

}
