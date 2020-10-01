package com.yedam.erp.sales.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yedam.erp.sales.SaleDetailsVO;
import com.yedam.erp.stocks.StockOnhandVO;

@Repository
public class SaleDetailsMybatisDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	/* 판매 상세 정보 조회 */
	public List<SaleDetailsVO> getSaleDetail(SaleDetailsVO saleDetailsVO) {
		return mybatis.selectList("sales.getSaleDetail", saleDetailsVO);
	}
	
	/* 승인대기 주문 상세 정보 조회 */
	public List<SaleDetailsVO> getOrderDetail(SaleDetailsVO saleDetailsVO) {
		return mybatis.selectList("sales.getOrderDetail", saleDetailsVO);
	}
	
	/* 승인 전 재고 체크 */
	public StockOnhandVO getStock(SaleDetailsVO saleDetailsVO) {
		return mybatis.selectOne("sales.getStock", saleDetailsVO);
	}
}