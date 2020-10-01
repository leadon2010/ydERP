package com.yedam.erp.stocks.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yedam.erp.stocks.PurchaseDetailTempVO;
import com.yedam.erp.stocks.PurchaseDetailsVO;
import com.yedam.erp.stocks.PurchaseHeadersVO;
import com.yedam.erp.stocks.PurchaseRequestVO;

@Repository
public class PurchaseRequestMybatisDAO {

	@Autowired
	SqlSessionTemplate sqlSession;

	public List<PurchaseRequestVO> getPurchaseRequestList(PurchaseRequestVO vo) {
		return sqlSession.selectList("stocks.getPurchaseRequestList", vo);
	}

	public void insertPurchaseRequest(PurchaseRequestVO vo) {
		sqlSession.insert("stocks.insertPurchaseRequest", vo);
	}

	public List<PurchaseDetailTempVO> getPurchaseRequestTempList(PurchaseDetailTempVO vo) {
		return sqlSession.selectList("stocks.getPurchaseRequestTempListData", vo);
	}

	public void insertPurchaseRequestTemp(PurchaseDetailTempVO vo) {
		sqlSession.insert("stocks.insertPurchaseRequestTemp", vo);
	}

	public List<Map<String, Object>> getlookUpValueList(PurchaseRequestVO vo) {
		return sqlSession.selectList("stocks.getlookUpValueList");
	}

	public List<PurchaseHeadersVO> getReceiptHeaders(PurchaseHeadersVO vo) {
		return sqlSession.selectList("stocks.getReceiptHeaders", vo);
	}

	public List<PurchaseDetailsVO> getReceiptLines(PurchaseDetailsVO vo) {
		return sqlSession.selectList("stocks.getReceiptLines", vo);
	}

	public void insertPurchaseProc(PurchaseRequestVO vo) {
		sqlSession.insert("stocks.insertPurchaseProc", vo);
	}

	public List<PurchaseRequestVO> getSalesRequest(PurchaseRequestVO vo) {
		return sqlSession.selectList("stocks.getSalesRequest", vo);
	}

	public List<PurchaseRequestVO> getSalesRequestDetail(PurchaseRequestVO vo) {
		return sqlSession.selectList("stocks.getSalesRequestDetail", vo);

	}

	public void insertSalesProc(PurchaseRequestVO vo) {
		sqlSession.insert("stocks.insertSalesProc", vo);
	}

	public int getCount(PurchaseRequestVO vo) {
		System.out.println("getCount=================" + sqlSession.selectOne("stocks.getCount", vo) + "...." + vo);
		return sqlSession.selectOne("stocks.getCount", vo);
	}
}
