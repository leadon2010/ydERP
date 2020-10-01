package com.yedam.erp.stocks;

import java.util.List;
import java.util.Map;

public interface StockOnhandService {

	public List<StockOnhandViewVO> getStockOnhandList(StockOnhandViewVO vo);

	public List<StockOnhandViewVO> getVendorList(StockOnhandViewVO vo);

	public List<Map<String, String>> getItemGroup1();

	public List<Map<String, String>> getItemGroup2(String str);

	public List<Map<String, String>> getItemGroup3(String str);

	public void updateLookups(String str);

}
