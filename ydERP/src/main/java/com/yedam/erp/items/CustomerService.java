package com.yedam.erp.items;

import java.util.List;

public interface CustomerService {

	public void insertCustomer(CustomerVO vo);

	public void updateCustomer(CustomerVO vo);

	public CustomerVO getCustomer(CustomerVO vo);

	public List<CustomerVO> getCustomerList(CustomerVO vo);

	public void deleteCustomer(CustomerVO vo);

}
