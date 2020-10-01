package com.yedam.erp.sales.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.erp.items.ItemsVO;
import com.yedam.erp.items.Sales_tempService;
import com.yedam.erp.items.Sales_tempVO;
import com.yedam.erp.items.impl.ItemsMybatisDAO;

@Service
public class Sales_tempServiceimpl implements Sales_tempService {

	@Autowired
	Sales_tempMybatisDAO dao;
	
	@Autowired
	ItemsMybatisDAO dao2;
	
	@Override
	public void insertSales_temp(Sales_tempVO vo) {
		dao.insertSales_temp(vo);
		
	}

	@Override
	public void updateSales_temp(Sales_tempVO vo) {
		dao.updateSales_temp(vo);
		
	}

	@Override
	public Sales_tempVO getSales_temp(Sales_tempVO vo) {
		
		return dao.getSales_temp(vo);
	}

	@Override
	public List<Sales_tempVO> getSales_tempList(Sales_tempVO vo) {
		
		return dao.getSales_tempList(vo);
	}

	@Override
	public void deleteSales_temp(Sales_tempVO vo) {
		dao.deleteSales_temp(vo);
		
	}

	@Override
	public List<ItemsVO> getItemsList(ItemsVO vo) {
		
		return dao2.getItemsList(vo);
	}



	
	
}
