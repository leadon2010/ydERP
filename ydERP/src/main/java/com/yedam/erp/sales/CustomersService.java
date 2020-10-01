package com.yedam.erp.sales;

import java.util.List;

public interface CustomersService {
	
	/* 판매처 조회 (단건) */
	public CustomersVO getCustomer(CustomersVO customersVO);
	
	/* 판매처 조회 (여러건) */
	public List<CustomersVO> getCustomerList(CustomersVO customersVO);

	/* 판매처 등록 */
	public void insertCustomer(CustomersVO customersVO);
	
	/* 판매처 수정 */
	public void updateCustomer(CustomersVO customersVO);
}
