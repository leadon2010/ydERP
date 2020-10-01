package com.yedam.erp.items;

import java.util.List;


public interface Sales_tempService {

	public void insertSales_temp(Sales_tempVO vo);
	public void updateSales_temp(Sales_tempVO vo);
	public void deleteSales_temp(Sales_tempVO vo);
	public Sales_tempVO getSales_temp(Sales_tempVO vo);
	public List<Sales_tempVO> getSales_tempList(Sales_tempVO vo);
	public List<ItemsVO> getItemsList(ItemsVO vo);

	
	
	
	
}
