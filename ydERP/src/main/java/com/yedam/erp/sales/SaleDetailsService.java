package com.yedam.erp.sales;

import java.util.List;

import com.yedam.erp.stocks.StockOnhandVO;

public interface SaleDetailsService {
	/* 판매 상세 정보 조회 */
	public List<SaleDetailsVO> getSaleDetail(SaleDetailsVO saleDetailsVO);
	
	/* 승인대기 주문 상세 정보 조회 */
	public List<SaleDetailsVO> getOrderDetail(SaleDetailsVO saleDetailsVO);
	
	/* 승인 전 재고 확인 */
	public StockOnhandVO getStock(SaleDetailsVO saleDetailsVO);
}