package com.yedam.erp.stocks.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.erp.stocks.StockOnhandService;
import com.yedam.erp.stocks.StockOnhandViewVO;

@Service
public class StockOnhandServiceImpl implements StockOnhandService {

	@Autowired
	StockOnhandMybatisDAO dao;

	public List<StockOnhandViewVO> getStockOnhandList(StockOnhandViewVO vo) {
		return dao.getStockOnhandList(vo);
	}

	public List<StockOnhandViewVO> getVendorList(StockOnhandViewVO vo) {
		return dao.getVendorList(vo);
	}

	public List<Map<String, String>> getItemGroup1() {
		return dao.getItemGroup1();
	};

	public List<Map<String, String>> getItemGroup2(String str) {
		return dao.getItemGroup2(str);

	};

	public List<Map<String, String>> getItemGroup3(String str) {
		return dao.getItemGroup3(str);

	};

	public void updateLookups(String str) {
		dao.updateLookups(str);
	}

}
