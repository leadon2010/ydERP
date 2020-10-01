package com.yedam.erp.stocks;

import java.util.List;

public interface StockInOutService {

	public List<StockInOutViewVO> getStockInOutList(StockInOutViewVO vo);

	public List<StockInOutViewVO> getItemInOutList(StockInOutVO vo);

	public List<LookupCodesVO> getTitle1(LookupCodesVO vo);

}
