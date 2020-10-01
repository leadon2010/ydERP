package com.yedam.erp.view;

import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.erp.common.Paging;
import com.yedam.erp.employees.EmployeesService;
import com.yedam.erp.employees.EmployeesVO;
import com.yedam.erp.sales.SaleDetailsService;
import com.yedam.erp.sales.SaleDetailsVO;
import com.yedam.erp.sales.SalesService;
import com.yedam.erp.sales.SalesVO;
import com.yedam.erp.stocks.PurchaseRequestService;
import com.yedam.erp.stocks.PurchaseRequestVO;
import com.yedam.erp.stocks.StockOnhandService;
import com.yedam.erp.stocks.impl.HomeServiceImpl;

@Controller
public class SalesController {

	@Autowired SalesService salesService;
	@Autowired SaleDetailsService saleDetailsService;
	@Autowired EmployeesService employeesService;
	@Autowired PurchaseRequestService purchaseRequestService;
	@Autowired HomeServiceImpl homeServiceImpl;
	@Autowired StockOnhandService stockOnhandService;
	
	/* 판매 내역 페이지 폼 */
	@RequestMapping("/getSaleList")
	public String getSaleListForm(Model model) {
		List<Map<String, String>> lookupDeliveryList = homeServiceImpl.selectLookups("DELIVERY");
		List<Map<String, String>> lookupPaymentList = homeServiceImpl.selectLookups("PAYMENT");
		
		model.addAttribute("lookupDeliveryList", lookupDeliveryList);
		model.addAttribute("lookupPaymentList", lookupPaymentList);
		return "sales/getSaleList";
	}

	/* 판매 내역 기본 정보 조회 */
	@RequestMapping("/getSaleList.do")
	@ResponseBody
	public List<SalesVO> getSaleList(SalesVO salesVO, Paging page) {
		
		return salesService.getSaleList(salesVO);
	}

	/* 판매 내역 상세 정보 조회 */
	@RequestMapping(value = "/getSaleDetail.do")
	@ResponseBody
	public List<SaleDetailsVO> getSaleDetail(SaleDetailsVO saleDetailsVO, Paging page) {
		System.out.println(saleDetailsVO.getSaleCode());
		
		if(saleDetailsVO.getSaleCode() != null && !saleDetailsVO.getSaleCode().equals("")) {
			return saleDetailsService.getSaleDetail(saleDetailsVO);
			}
			return null;
	}
	
	/* 판매 내역 검색 처리 */
	@RequestMapping("/getSaleByCondition.do")
	@ResponseBody
	public List<SalesVO> getSaleByCondition(SalesVO salesVO) {
		return salesService.getSaleByCondition(salesVO);
	}

	/* 주문 등록 페이지 폼 */
	@RequestMapping("/insertOrder")
	public String insertOrderForm() {
		return "sales/insertOrder";
	}

	/* 주문 내역 페이지 폼 */
	@RequestMapping("/getOrderList")
	public String getOrderListForm(Model model, EmployeesVO employeesVO, PurchaseRequestVO vo) {
		
		List<EmployeesVO> empList = employeesService.getEmployeesList(employeesVO);
		List<Map<String, Object>> lookupList = purchaseRequestService.getlookUpValueList(vo);
		
		List<Map<String, String>> lookupDeliveryList = homeServiceImpl.selectLookups("DELIVERY");
		List<Map<String, String>> lookupPaymentList = homeServiceImpl.selectLookups("PAYMENT");
		
		model.addAttribute("lookupDeliveryList", lookupDeliveryList);
		model.addAttribute("lookupPaymentList", lookupPaymentList);
		
		String lookupStr = "";
		String empStr = "";
		EmployeesVO empNext = null;
		
		Iterator<EmployeesVO> iterator = empList.iterator();
		while (iterator.hasNext()) {
		    // empStr += iterator.next().getId() + ":" + iterator.next().getName() + ";";
			empNext = iterator.next();
			empStr += empNext.getId() + ":" + empNext.getName() + ";";
		}
		System.out.println(empStr);
		model.addAttribute("employeeList", empStr);

		for (Map<String, Object> lookup : lookupList) {
			// "FE:FedEx; IN:InTime; TN:TNT; AR:ARAMEX"
			lookupStr += lookup.get("LOOKUP_CODE") + ":" + lookup.get("LOOKUP_VALUES") + ";";
		}
		System.out.println(lookupStr);
		model.addAttribute("lookupValueList", lookupStr);
		return "sales/getOrderList";
	}

	/* 주문 기본 정보 조회 */
	@RequestMapping("/getOrderList.do")
	@ResponseBody
	public List<SalesVO> getOrderList(SalesVO salesVO, Paging page) {
		return salesService.getOrderList(salesVO);
	}

	/* 주문 상세 정보 조회 */
	@RequestMapping(value = "/getOrderDetail.do")
	@ResponseBody
	public List<SaleDetailsVO> getOrderDetail(SaleDetailsVO saleDetailsVO, Paging page) {
		if(saleDetailsVO.getSaleCode() != null && !saleDetailsVO.getSaleCode().equals("")) {
		return saleDetailsService.getOrderDetail(saleDetailsVO);
		}
		return null;
	}

	/* 주문취소 처리 */
	@RequestMapping("/deleteOrderList.do")
	@ResponseBody
	public String deleteOrderList(SalesVO salesVO) {
		salesService.deleteOrder(salesVO);
		return "redirect:/getOrderList";
	}
	
	/* 주문 내역 검색 처리*/
	@RequestMapping("/getOrderByCondition.do")
	@ResponseBody
	public List<SalesVO> getOrderByCondition(SalesVO salesVO) {
		return salesService.getOrderByCondition(salesVO);
	}
	
	/* 승인대기 주문 그리드 편집 */
	@RequestMapping("/editOrderList.do")
	@ResponseBody
	public Map<String, Object> editOrderList(@RequestParam(value = "oper", required = false) String op, SalesVO salesVO, SaleDetailsVO saleDetailsVO,
			HttpServletResponse response) throws IOException {
		System.out.println("sdafasfda");
		int saleCnt = 0;
		int stockCnt = 0;
		String strNotEnoughItem = "";
		boolean flag = true;
		Map<String, Object> result = new HashMap<String, Object>();
		if (op.equals("edit")) {
			
			// saleDetails.itemQty > stockOnHandList.onhand_qty 이면
			// saleDetails.itemName을 alert에 표시하기
			
			// 주문 상세 목록 받아오기
			List<SaleDetailsVO> saleDetailList = saleDetailsService.getOrderDetail(saleDetailsVO);
			
			strNotEnoughItem = "[품목재고 부족으로 승인불가]\n";
			for(SaleDetailsVO saleDetail : saleDetailList) {
				saleCnt = saleDetail.getSaleQty();										// 각 품목 주문 수량 받아오기
				stockCnt = saleDetailsService.getStock(saleDetail).getOnhandQty();		// 각 품목 재고 수량 받아오기
				
				/* 품목 하나라도 충분하지 않으면 승인이 되지 않게 flag를 false로 설정 */
				if(saleCnt > stockCnt) {
					flag = false;
					strNotEnoughItem += saleDetail.getSaleItemName() + " " + (Math.abs(stockCnt-saleCnt) + "개, \n");
					System.out.println(strNotEnoughItem);
				}
			}
			strNotEnoughItem = strNotEnoughItem.substring(0, strNotEnoughItem.length()-3);
			System.out.println(strNotEnoughItem);
			/* 재고가 충분하면 */
			if(flag == true) {
				result.put("result",  "true");
				salesService.updateOrderStatus(salesVO);				// 주문을 승인하고
				salesService.afterPermitOrder(salesVO.getSaleCode());	// 재고를 감소시킨다.
			}
			else {	/* 재고가 충분하지 않으면 */
				result.put("result", "false");
				result.put("data", strNotEnoughItem);
				return result;
			}
		} else if (op.equals("del")) {
			salesService.deleteOrder(salesVO);
		}
		return result;
	}
	
	/* 차트 폼 */
	@RequestMapping("/getSaleChart")
	public String getSaleChartForm() {
		return "sales/getSaleChart";
	}	
	
	/* 월일별 판매액 차트 처리 */
	@RequestMapping("/getSaleChart.do")
	@ResponseBody
	public List<Map<String, Object>> getSaleChart(	@RequestParam String selectSaleYear,
													@RequestParam(required=false) String selectSaleMonth,
													SalesVO salesVO,
													Model model ) {
		// SPRING QUICK START p.382
		// Command객체(JavaBean)에 없는 Parameter를 Controller 클래스에서 사용하려면 @RequestParam을 사용해야 한다.
		// required : Parameter에 null이 들어갈 수도 있는 경우 생략여부
		
		System.out.println(selectSaleYear);
		System.out.println(selectSaleMonth);
		
		if(selectSaleMonth != null && selectSaleMonth != "") {
			/* 달이 선택되었을 때 그룹 기준을 일별로 처리 */
			if(Integer.parseInt(selectSaleMonth) < 10) {
				selectSaleMonth = "0" + selectSaleMonth;
			}
			salesVO.setSaleDate(selectSaleYear + "-" + selectSaleMonth);
			System.out.println(salesVO.getSaleDate());
			return salesService.getSaleChartMonth(salesVO);
		}
		else {
			/* 달이 선택되지 않았을 때 그룹 기준을 월별로 처리 */
			salesVO.setSaleDate(selectSaleYear);
			System.out.println(salesVO.getSaleDate());
			return salesService.getSaleChartYear(salesVO);
		}
	}
	
	/* 월일별 순이익 차트 처리 */
	@RequestMapping("/getProfitChart.do")
	@ResponseBody
	public List<Map<String, Object>> getProfitChart(HttpServletRequest request,
													SalesVO salesVO,
													Model model) {
		String selectProfitYear = request.getParameter("selectProfitYear");
		String selectProfitMonth = request.getParameter("selectProfitMonth");
		
		if(selectProfitMonth != null && selectProfitMonth != "") {
			/* 달이 선택되었을 때 그룹 기준을 일별로 처리 */
			if(Integer.parseInt(selectProfitMonth) < 10) {
				selectProfitMonth = "0" + selectProfitMonth;
			}
			salesVO.setSaleDate(selectProfitYear + "-" + selectProfitMonth);
			System.out.println(salesVO.getSaleDate());
			return salesService.getProfitChartMonth(salesVO);
		}
		else {
			/* 달이 선택되지 않았을 때 그룹 기준을 월별로 처리 */
			salesVO.setSaleDate(selectProfitYear);
			System.out.println(salesVO.getSaleDate());
			return salesService.getProfitChartYear(salesVO);
		}
	}
	
	/* 월일별 품목별 판매량 Top 차트 처리 */
	@RequestMapping("/getTopItemChart.do")
	@ResponseBody
	public List<Map<String, Object>> getTopItemChart(HttpServletRequest request,
													SalesVO salesVO,
													Model model) {
		String selectTopItemYear = request.getParameter("selectTopItemYear");
		String selectTopItemMonth = request.getParameter("selectTopItemMonth");
		
		if(selectTopItemMonth != null && selectTopItemMonth != "") {
			/* 달이 선택되었을 때 그룹 기준을 일별로 처리 */
			if(Integer.parseInt(selectTopItemMonth) < 10) {
				selectTopItemMonth = "0" + selectTopItemMonth;
			}
			salesVO.setSaleDate(selectTopItemYear + "-" + selectTopItemMonth);
			System.out.println(salesVO.getSaleDate());
			return salesService.getTopItemChartMonth(salesVO);
		}
		else {
			/* 달이 선택되지 않았을 때 그룹 기준을 월별로 처리 */
			salesVO.setSaleDate(selectTopItemYear);
			System.out.println(salesVO.getSaleDate());
			return salesService.getTopItemChartYear(salesVO);
		}
	}
	
	/* 월일별 판매처별 판매량 Top 차트 처리 */
	@RequestMapping("/getTopCustomerChart.do")
	@ResponseBody
	public List<Map<String, Object>> getTopCustomerChart(HttpServletRequest request,
													SalesVO salesVO,
													Model model) {
		String selectTopCustomerYear = request.getParameter("selectTopCustomerYear");
		String selectTopCustomerMonth = request.getParameter("selectTopCustomerMonth");
		
		if(selectTopCustomerMonth != null && selectTopCustomerMonth != "") {
			/* 달이 선택되었을 때 그룹 기준을 일별로 처리 */
			if(Integer.parseInt(selectTopCustomerMonth) < 10) {
				selectTopCustomerMonth = "0" + selectTopCustomerMonth;
			}
			salesVO.setSaleDate(selectTopCustomerYear + "-" + selectTopCustomerMonth);
			System.out.println(salesVO.getSaleDate());
			return salesService.getTopCustomerChartMonth(salesVO);
		}
		else {
			/* 달이 선택되지 않았을 때 그룹 기준을 월별로 처리 */
			salesVO.setSaleDate(selectTopCustomerYear);
			System.out.println(salesVO.getSaleDate());
			return salesService.getTopCustomerChartYear(salesVO);
		}
	}
	
	/* 메인화면 버블차트 처리 */
	@RequestMapping("/getBubbleChart.do")
	@ResponseBody
	public List<Map<String, Object>> getBubbleChart(SalesVO salesVO) {
		return salesService.getBubbleChart(salesVO);
	}
}