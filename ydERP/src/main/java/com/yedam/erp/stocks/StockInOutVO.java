package com.yedam.erp.stocks;

public class StockInOutVO {
	Integer stockId;
	String itemCode;
	String dealDate;
	String dealerCode;
	Integer inQty;
	Integer outQty;
	String txnDate;

	public Integer getStockId() {
		return stockId;
	}

	public void setStockId(Integer stockId) {
		this.stockId = stockId;
	}

	public String getItemCode() {
		return itemCode;
	}

	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}

	public String getDealDate() {
		return dealDate;
	}

	public void setDealDate(String dealDate) {
		this.dealDate = dealDate;
	}

	public String getDealerCode() {
		return dealerCode;
	}

	public void setDealerCode(String dealerCode) {
		this.dealerCode = dealerCode;
	}

	public Integer getInQty() {
		return inQty;
	}

	public void setInQty(Integer inQty) {
		this.inQty = inQty;
	}

	public Integer getOutQty() {
		return outQty;
	}

	public void setOutQty(Integer outQty) {
		this.outQty = outQty;
	}

	public String getTxnDate() {
		return txnDate;
	}

	public void setTxnDate(String txnDate) {
		this.txnDate = txnDate;
	}

	@Override
	public String toString() {
		return "StocksVO [itemCode=" + itemCode + ", dealDate=" + dealDate + ", dealerCode=" + dealerCode + ", inQty="
				+ inQty + ", outQty=" + outQty + ", txnDate=" + txnDate + "]";
	}

}
