package com.yedam.erp.sales.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.erp.sales.SaleDetailsService;
import com.yedam.erp.sales.SaleDetailsVO;
import com.yedam.erp.stocks.StockOnhandVO;

@Service
public class SaleDetailsServiceImpl implements SaleDetailsService {

	@Autowired
	private SaleDetailsMybatisDAO saleDetailsDAO;
	
	/* 판매 상세 정보 조회 */
	@Override
	public List<SaleDetailsVO> getSaleDetail(SaleDetailsVO saleDetailsVO) {
		return saleDetailsDAO.getSaleDetail(saleDetailsVO);
	}
	
	/* 승인대기 주문 상세 정보 조회 */
	@Override
	public List<SaleDetailsVO> getOrderDetail(SaleDetailsVO saleDetailsVO) {
		return saleDetailsDAO.getOrderDetail(saleDetailsVO);	
	}
	
	/* 승인 전 재고 확인 */
	@Override
	public StockOnhandVO getStock(SaleDetailsVO saleDetailsVO) {
		return saleDetailsDAO.getStock(saleDetailsVO);
	}
}