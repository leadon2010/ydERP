package com.yedam.erp.stocks.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.erp.stocks.PurchaseRequestVO;
import com.yedam.erp.stocks.PurchaseDetailTempVO;
import com.yedam.erp.stocks.PurchaseDetailsVO;
import com.yedam.erp.stocks.PurchaseHeadersVO;
import com.yedam.erp.stocks.PurchaseRequestService;

@Service
public class PurchaseRequestImpl implements PurchaseRequestService {

	@Autowired
	PurchaseRequestMybatisDAO dao;

	@Override
	public List<PurchaseRequestVO> getPurchaseRequestList(PurchaseRequestVO vo) {
		return dao.getPurchaseRequestList(vo);
	}

	@Override
	public void insertPurchaseRequest(PurchaseRequestVO vo) {
		dao.insertPurchaseRequest(vo);
	}

	@Override
	public void insertPurchaseRequestTemp(List<PurchaseDetailTempVO> volist) {
		for (PurchaseDetailTempVO vo : volist)
			dao.insertPurchaseRequestTemp(vo);
	}

	@Override
	public List<PurchaseDetailTempVO> getPurchaseRequestTempList(PurchaseDetailTempVO vo) {
		// TODO Auto-generated method stub
		return dao.getPurchaseRequestTempList(vo);
	}

	public List<Map<String, Object>> getlookUpValueList(PurchaseRequestVO vo) {
		return dao.getlookUpValueList(vo);
	}

	public List<PurchaseHeadersVO> getReceiptHeaders(PurchaseHeadersVO vo) {
		return dao.getReceiptHeaders(vo);
	}

	public List<PurchaseDetailsVO> getReceiptLines(PurchaseDetailsVO vo) {
		return dao.getReceiptLines(vo);
	}

	public void insertPurchaseProc(PurchaseRequestVO vo) {
		dao.insertPurchaseProc(vo);
	}

	public List<PurchaseRequestVO> getSalesRequest(PurchaseRequestVO vo) {
		return dao.getSalesRequest(vo);
	}

	public List<PurchaseRequestVO> getSalesRequestDetail(PurchaseRequestVO vo) {
		return dao.getSalesRequestDetail(vo);
	}

	public void insertSalesProc(PurchaseRequestVO vo) {
		dao.insertSalesProc(vo);
	}

	public int getCount(PurchaseRequestVO vo) {
		return dao.getCount(vo);
	}
}
