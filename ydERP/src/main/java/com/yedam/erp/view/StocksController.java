package com.yedam.erp.view;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.erp.common.Paging;
import com.yedam.erp.stocks.LookupCodesVO;
import com.yedam.erp.stocks.PurchaseDetailTempVO;
import com.yedam.erp.stocks.PurchaseDetailsVO;
import com.yedam.erp.stocks.PurchaseHeadersVO;
import com.yedam.erp.stocks.PurchaseRequestService;
import com.yedam.erp.stocks.PurchaseRequestVO;
import com.yedam.erp.stocks.StockInOutService;
import com.yedam.erp.stocks.StockInOutVO;
import com.yedam.erp.stocks.StockInOutViewVO;
import com.yedam.erp.stocks.StockOnhandService;
import com.yedam.erp.stocks.StockOnhandVO;
import com.yedam.erp.stocks.StockOnhandViewVO;

@Controller
public class StocksController {

	@Autowired
	StockInOutService stockInOutService;

	@Autowired
	StockOnhandService stockOnhandService;

	@Autowired
	PurchaseRequestService purchaseRequestService;

	@RequestMapping("getStockInOutList")
	public String getStockInOutList(Model model, StockInOutVO vo) {
		model.addAttribute("list", vo);
		return "stocks/getStockInOutList";
	}

	@RequestMapping("getStockInOutListData")
	@ResponseBody
	public List<StockInOutViewVO> getStockInOutListData(StockInOutViewVO vo) {
		System.out.println("--===================" + vo);
		return stockInOutService.getStockInOutList(vo);
	}

	@RequestMapping("getItemInOutList")
	public String getItemInOutList(Model model, StockInOutViewVO vo) {
		model.addAttribute("list", vo);
		return "stocks/getItemInOutList";
	}

	@RequestMapping("getItemInOutListData")
	@ResponseBody
	public List<StockInOutViewVO> getItemInOutListData(StockInOutViewVO vo) {
		return stockInOutService.getItemInOutList(vo);
	}

	@RequestMapping("getItemGroup2.do")
	@ResponseBody
	public List<Map<String, String>> getItemGroup2Data(@RequestParam String grp_code) {
		return stockOnhandService.getItemGroup2(grp_code);
	}

	@RequestMapping("getItemGroup3.do")
	@ResponseBody
	public List<Map<String, String>> getItemGroup3Data(@RequestParam String grp_code) {
		return stockOnhandService.getItemGroup3(grp_code);
	}

	@RequestMapping("getStockOnhandList")
	public String getStockOnhandList(Model model, StockOnhandViewVO vo, String str2, String str3) {
		model.addAttribute("list", vo);
		model.addAttribute("itemGroup1", stockOnhandService.getItemGroup1());
		model.addAttribute("itemGroup2", stockOnhandService.getItemGroup2(str2));
		model.addAttribute("itemGroup3", stockOnhandService.getItemGroup3(str3));
		model.addAttribute("vendorList", stockOnhandService.getVendorList(vo));
		return "stocks/getStockOnhandList";
	}

	@RequestMapping("getStockOnhandList2")
	public String getStockOnhandList2(Model model, StockOnhandVO vo) {
		model.addAttribute("list", vo);
		return "stocks/getStockOnhandList2";
	}

	@RequestMapping("getStockOnhandListData")
	@ResponseBody
	public List<StockOnhandViewVO> getStockOnhandListData(StockOnhandViewVO vo) {
		return stockOnhandService.getStockOnhandList(vo);

	}

	@RequestMapping(value = "getPurchaseRequestListData_jqgrid", method = RequestMethod.GET)
	@ResponseBody
	public List<PurchaseRequestVO> getPurchaseRequestListData_jqgrid(PurchaseRequestVO vo) {
		return purchaseRequestService.getPurchaseRequestList(vo);
	}

	@RequestMapping(value = "/getPurchaseRequestListData", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getPurchaseRequestListData(Model model, PurchaseRequestVO vo, Paging paging) {
		Map<String, Object> map = new HashMap<String, Object>();
		paging.setPageUnit(10);
		paging.setTotalRecord(purchaseRequestService.getCount(vo));
		// vo 의 first, last setting
		vo.setFirst(paging.getFirst());
		vo.setLast(paging.getLast());
		System.out.println(vo.getFirst() + "====" + paging.getTotalRecord() + "......" + purchaseRequestService.getCount(vo));
		model.addAttribute("paging", paging);

		List<PurchaseRequestVO> requestlist = purchaseRequestService.getPurchaseRequestList(vo);
		map.put("data", requestlist);
		map.put("paging", paging);
		return map;
	}

	@RequestMapping("/getPurchaseRequestList")
	public String getPurchaseRequestList(Model model, StockOnhandViewVO vo, String str2, String str3) {
		model.addAttribute("itemGroup1", stockOnhandService.getItemGroup1());
		model.addAttribute("itemGroup2", stockOnhandService.getItemGroup2(str2));
		model.addAttribute("itemGroup3", stockOnhandService.getItemGroup3(str3));
		model.addAttribute("vendorList", stockOnhandService.getVendorList(vo));

		return "stocks/getPurchaseRequestList";
	}

	@RequestMapping("getStockInOutListTest")
	public String getStockInOutListTest(StockInOutVO vo) {
		return "stocks/jqgridTest";
	}

	@RequestMapping("insertPurchaseRequestTemp")
	@ResponseBody
	public Map<String, String> insertPurchaseRequestTemp(@RequestBody List<PurchaseDetailTempVO> vo) {
		purchaseRequestService.insertPurchaseRequestTemp(vo);
		Map<String, String> map = new HashMap<String, String>();
		return map;
	}

	// getPurchaseRequestTempListData
	@RequestMapping(value = "/getPurchaseRequestTempListData", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getPurchaseRequestTempListData(PurchaseDetailTempVO vo) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<PurchaseDetailTempVO> requestlist = purchaseRequestService.getPurchaseRequestTempList(vo);
		map.put("data", requestlist);
		return map;
	}

	@RequestMapping("getPurchaseRequesting")
	public String getPurchaseRequesting(Model model, PurchaseRequestVO vo) {
		System.out.println(purchaseRequestService.getlookUpValueList(vo));
		model.addAttribute("lookUpValue", purchaseRequestService.getlookUpValueList(vo));
		return "stocks/getPurchaseRequesting";
	}

	@RequestMapping("insertPurchaseRequest")
	@ResponseBody
	public Map<String, String> insertPurchaseRequest(PurchaseRequestVO vo) {
		purchaseRequestService.insertPurchaseRequest(vo);

		Map<String, String> map = new HashMap<String, String>();
		map.put("msg", vo.getpMsg());
		return map;
	}

	@RequestMapping("getPurchaseReceipting")
	public String getPurchaseReceipting(Model model, PurchaseRequestVO vo) {
		System.out.println(purchaseRequestService.getlookUpValueList(vo));
		// model.addAttribute("lookUpValue",
		// purchaseRequestService.getlookUpValueList(vo));
		return "stocks/getPurchaseReceipting";
	}

	@RequestMapping("getReceiptHeadersData")
	@ResponseBody
	public List<PurchaseHeadersVO> getReceiptHeadersData(PurchaseHeadersVO vo) {
		return purchaseRequestService.getReceiptHeaders(vo);
	}

	@RequestMapping("getReceiptLinesData")
	@ResponseBody
	public List<PurchaseDetailsVO> getReceiptLinesData(PurchaseDetailsVO vo) {
		return purchaseRequestService.getReceiptLines(vo);
	}

	@RequestMapping("insertPurchaseProc")
	@ResponseBody
	public String insertPurchaseProc(PurchaseRequestVO vo) {
		purchaseRequestService.insertPurchaseProc(vo);
		return "success";
	}

	@RequestMapping("getSalesRequesting")
	public String getSalesRequesting() {
		return "stocks/getSalesRequesting";
	}

	@RequestMapping("getSalesRequest.do")
	@ResponseBody
	public List<PurchaseRequestVO> getSalesRequest(PurchaseRequestVO vo) {
		return purchaseRequestService.getSalesRequest(vo);
	}

	@RequestMapping("getSalesRequestDetail.do")
	@ResponseBody
	public List<PurchaseRequestVO> getSalesRequestDetail(PurchaseRequestVO vo) {
		return purchaseRequestService.getSalesRequestDetail(vo);
	}

	@RequestMapping("insertSalesProc")
	@ResponseBody
	public String insertSalesProc(PurchaseRequestVO vo) {
		purchaseRequestService.insertSalesProc(vo);
		return "success";
	}

	@RequestMapping("getTitle1.do")
	@ResponseBody
	public List<LookupCodesVO> getTitle1(LookupCodesVO vo) {
		return stockInOutService.getTitle1(vo);
	}

}
