package com.yedam.erp.purchases;


import java.util.List;
import java.util.Map;

import com.yedam.erp.GPS.GpsVO;

public interface PurchasesService
{
	/* 구매 내역 조회 (단건) */
	public PurchasesVO getPurchases(PurchasesVO vo);	
	
	/* 구매 내역 조회 (전체) */
	public List<PurchasesVO> getPurchasesList(PurchasesVO vo);
	
	public List<Map<String, Object>> getPurchasesListMap();
	
	/* 구매 내역 등록 */
	public void insertPurchases(PurchasesVO purchasesVO);

	/* 구매 내역 수정 */
	public void updatePurchases(PurchasesVO purchasesVO);

	/* 구매 내역 수정 */
	public void deletePurchases(PurchasesVO purchasesVO);

	/*  GPS */
	public List<Map<String, Object>> getDeliveryListMap();
	
}
