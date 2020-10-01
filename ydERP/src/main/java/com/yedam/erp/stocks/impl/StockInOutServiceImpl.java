package com.yedam.erp.stocks.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.erp.stocks.StockInOutViewVO;
import com.yedam.erp.stocks.StockInOutVO;
import com.yedam.erp.stocks.LookupCodesVO;
import com.yedam.erp.stocks.StockInOutService;

@Service
public class StockInOutServiceImpl implements StockInOutService {

	@Autowired
	StockInOutMybatisDAO dao;

	public List<StockInOutViewVO> getStockInOutList(StockInOutViewVO vo) {
		return dao.getStockInOutList(vo);
	}

	public List<StockInOutViewVO> getItemInOutList(StockInOutVO vo) {
		return dao.getItemInOutList(vo);
	}

	public List<LookupCodesVO> getTitle1(LookupCodesVO vo) {
		return dao.getTitle1(vo);
	}

}
