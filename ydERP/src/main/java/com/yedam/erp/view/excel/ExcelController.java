package com.yedam.erp.view.excel;

import java.awt.Font;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.record.cf.BorderFormatting;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yedam.erp.purchases.PurchasesService;

@Controller
public class ExcelController { 

	@Autowired
	PurchasesService purchasesService;

	// 엑셀출력
	@RequestMapping("/PurchaseView")
	public ModelAndView excelView(HttpServletResponse response) throws IOException {
		List<Map<String, Object>> list = purchasesService.getPurchasesListMap();
		Map<String, Object> map = new HashMap<String, Object>();
		String[] header = {"PURCHASE_DETAIL_CODE", "PURCHASE_CODE", "PURCHASE_ITEM", "ITEM_NAME", "PURCHASE_QTY", "PURCHASE_PRICE", "ITEM_TAX"};
		String[] headertitle = {"구매상세코드", "구매코드", "품목코드", "품목명", "품목수량", "품목단가", "부가세"};
		map.put("filenmame", "");
		map.put("datas", list);
		map.put("filename", "PurchaseView");
		map.put("headers", header);
		map.put("headertitle", headertitle);
		return new ModelAndView("commonExcelView", map);
		
	}	
}
