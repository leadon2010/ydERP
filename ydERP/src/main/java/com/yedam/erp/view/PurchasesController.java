package com.yedam.erp.view;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.erp.purchases.PurchaseDetailService;
import com.yedam.erp.purchases.PurchaseDetailVO;
import com.yedam.erp.purchases.PurchasesService;
import com.yedam.erp.purchases.PurchasesVO;


@Controller
public class PurchasesController
{
	//서비스 injection
	@Autowired
	PurchasesService purchasesService;
	
	@Autowired
	PurchaseDetailService purchaseDetailService;
	
	@RequestMapping("/getPurchasesPage")
	public String getPurchasesList(Model model, PurchasesVO vo) {
		 return "purchases/getPurchasesList";
	}
	
	//등록
	@RequestMapping("insertPurchases")
	@ResponseBody
	public PurchasesVO insertPurchases(PurchasesVO vo) {
		purchasesService.insertPurchases(vo);
		return purchasesService.getPurchases(vo);
	}
	
	//수정
	@RequestMapping("updatePurchases")
	@ResponseBody
	public PurchasesVO updatePurchases(PurchasesVO vo) {
		purchasesService.updatePurchases(vo);
		return vo;
	}
	
	//삭제
	@RequestMapping("deletePurchases")
	public PurchasesVO deletePurchases(PurchasesVO vo) {
		purchasesService.deletePurchases(vo);
		return purchasesService.getPurchases(vo);
	}
		
	//전체목록
	@RequestMapping("getPurchasesList") 
	@ResponseBody
	public List<PurchasesVO> getPurchasesList(PurchasesVO vo) {			
		
		return purchasesService.getPurchasesList(vo);											
	}
	
	//상세목록
	@RequestMapping("getPurchaseDetailList") 
	@ResponseBody
	public List<PurchaseDetailVO> getPurchaseDetailList(PurchasesVO vo) {			
			
		return purchaseDetailService.getPurchaseDetailList(vo);											
	}	
		
	//GPS
	@RequestMapping("getDeliveryListMap") 
	@ResponseBody
	public List<Map<String, Object>> getDeliveryListMap() {			
		
		return purchasesService.getDeliveryListMap();											
	
	
	}
	
	//GPS view
	@RequestMapping("/getDeliveryMap")
	public String getDeliveryList(Model model, PurchasesVO vo) {
		 return "purchases/GPSiframe";
	}
	
	
	
}
