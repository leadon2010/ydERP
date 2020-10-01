package com.yedam.erp.stocks;

import java.util.List;
import java.util.Map;

public interface PurchaseRequestService {

	public List<PurchaseRequestVO> getPurchaseRequestList(PurchaseRequestVO vo);

	public List<PurchaseDetailTempVO> getPurchaseRequestTempList(PurchaseDetailTempVO vo);

	public void insertPurchaseRequestTemp(List<PurchaseDetailTempVO> volist);

	public void insertPurchaseRequest(PurchaseRequestVO vo);

	public List<Map<String, Object>> getlookUpValueList(PurchaseRequestVO vo);

	public List<PurchaseHeadersVO> getReceiptHeaders(PurchaseHeadersVO vo);

	public List<PurchaseDetailsVO> getReceiptLines(PurchaseDetailsVO vo);

	public void insertPurchaseProc(PurchaseRequestVO vo);

	public List<PurchaseRequestVO> getSalesRequest(PurchaseRequestVO vo);

	public List<PurchaseRequestVO> getSalesRequestDetail(PurchaseRequestVO vo);

	public void insertSalesProc(PurchaseRequestVO vo);

	public int getCount(PurchaseRequestVO vo);

}
