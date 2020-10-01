package com.yedam.erp.sales.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.erp.sales.SalesService;
import com.yedam.erp.sales.SalesVO;

@Service
public class SalesServiceImpl implements SalesService {
	
	@Autowired
	private SalesMybatisDAO salesDAO;

	/* 판매 내역 조회 (한 건) */
	@Override	
	public SalesVO getSale(SalesVO salesVO) {
		return salesDAO.getSale(salesVO);
	}
	
	/* 판매 내역 조회 (전체 건) */
	@Override	
	public List<SalesVO> getSaleList(SalesVO salesVO) {
		return salesDAO.getSaleList(salesVO);
	}
	
	/* 판매 내역 검색 */
	@Override
	public List<SalesVO> getSaleByCondition(SalesVO salesVO) {
		return salesDAO.getSaleByCondition(salesVO);		
	}

	/* 승인대기 주문 기본 정보 조회 */
	@Override
	public List<SalesVO> getOrderList(SalesVO salesVO) {
		return salesDAO.getOrderList(salesVO);
	}
	
	/* 주문 승인 */
	@Override
	public void updateOrderStatus(SalesVO salesVO) {
		salesDAO.updateOrderStatus(salesVO);
	}

	/* 승인대기 주문취소 */
	@Override	
	public void deleteOrder(SalesVO salesVO) {
		salesDAO.deleteOrder(salesVO);
	}
	
	/* 승인대기 주문 내역 검색 */
	@Override
	public List<SalesVO> getOrderByCondition(SalesVO salesVO) {
		return salesDAO.getOrderByCondition(salesVO);
	}
	
	/* 승인 후 품목 재고 처리 */
	@Override
	public void afterPermitOrder(String saleCode) {
		salesDAO.afterPermitOrder(saleCode);
	}

	/* 월별 매출 차트 처리 */
	@Override
	public List<Map<String, Object>> getSaleChartYear(SalesVO salesVO) {
		return salesDAO.getSaleChartYear(salesVO);
	}
	
	/* 일별 매출 차트 처리 */
	@Override
	public List<Map<String, Object>> getSaleChartMonth(SalesVO salesVO) {
		return salesDAO.getSaleChartMonth(salesVO);
	}

	/* 월별 순이익 차트 처리 */
	@Override
	public List<Map<String, Object>> getProfitChartYear(SalesVO salesVO) {
		return salesDAO.getProfitChartYear(salesVO);
	}
	
	/* 일별 순이익 차트 처리 */
	@Override
	public List<Map<String, Object>> getProfitChartMonth(SalesVO salesVO) {
		return salesDAO.getProfitChartMonth(salesVO);
	}

	/* 월별 품목별 판매량 TOP 차트 처리 */
	@Override
	public List<Map<String, Object>> getTopItemChartYear(SalesVO salesVO) {
		return salesDAO.getTopItemChartYear(salesVO);
	}

	/* 일별 품목별 판매량 TOP 차트 처리 */
	@Override
	public List<Map<String, Object>> getTopItemChartMonth(SalesVO salesVO) {
		return salesDAO.getTopItemChartMonth(salesVO);
	}
	
	/* 월별 판매처별 판매량 TOP 처리 */
	@Override
	public List<Map<String, Object>> getTopCustomerChartYear(SalesVO salesVO) {
		return salesDAO.getTopCustomerChartYear(salesVO);
	}
	
	/* 일별 판매처별 판매량 TOP 처리 */
	@Override
	public List<Map<String, Object>> getTopCustomerChartMonth(SalesVO salesVO) {
		return salesDAO.getTopCustomerChartMonth(salesVO);
	}
	
	/* 메인 화면 차트 처리 */
	@Override
	public List<Map<String, Object>> getBubbleChart(SalesVO salesVO) {
		return salesDAO.getBubbleChart(salesVO);
	}
}