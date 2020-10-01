package com.yedam.erp.sales;

import java.util.List;
import java.util.Map;

import com.yedam.erp.sales.SalesVO;

public interface SalesService {
	
	/* 판매 내역 조회 (한 건) */
	public SalesVO getSale(SalesVO salesVO);
	
	/* 판매 내역 조회 (전체 건) */
	public List<SalesVO> getSaleList(SalesVO salesVO);
	
	/* 판매 내역 검색 */
	public List<SalesVO> getSaleByCondition(SalesVO salesVO);

	/* 주문 수정 */
	// public void updateSale(SalesVO salesVO);
	
	/* 승인대기 주문 기본 정보 조회 */
	public List<SalesVO> getOrderList(SalesVO salesVO);
	
	/* 주문 승인 */
	public void updateOrderStatus(SalesVO salesVO);	
	
	/* 승인대기 주문취소 */
	public void deleteOrder(SalesVO salesVO);
	
	/* 승인대기 주문 내역 검색 */
	public List<SalesVO> getOrderByCondition(SalesVO salesVO);
	
	/* 승인 후 품목 재고 처리 */
	public void afterPermitOrder(String saleCode);
	
	/* 월별 매출 차트 처리 */
	public List<Map<String, Object>> getSaleChartYear(SalesVO salesVO);
	
	/* 일별 매출 차트 처리 */
	public List<Map<String, Object>> getSaleChartMonth(SalesVO salesVO);
	
	/* 월별 순이익 차트 처리 */
	public List<Map<String, Object>> getProfitChartYear(SalesVO salesVO);
	
	/* 일별 순이익 차트 처리 */
	public List<Map<String, Object>> getProfitChartMonth(SalesVO salesVO);
	
	/* 월별 품목별 판매량 TOP 차트 처리 */
	public List<Map<String, Object>> getTopItemChartYear(SalesVO salesVO);
	
	/* 일별 품목별 판매량 TOP 차트 처리 */
	public List<Map<String, Object>> getTopItemChartMonth(SalesVO salesVO);
	
	/* 월별 판매처별 판매량 TOP 차트 처리 */
	public List<Map<String, Object>> getTopCustomerChartYear(SalesVO salesVO);
	
	/* 일별 판매처별 판매량 TOP 차트 처리 */
	public List<Map<String, Object>> getTopCustomerChartMonth(SalesVO salesVO);
	
	/* 메인 화면 차트 처리 */
	public List<Map<String, Object>> getBubbleChart(SalesVO salesVO);
}