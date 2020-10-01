package com.yedam.erp.stocks;

public class StockOnhandVO {
	String itemCode;
	Integer onhandQty;
	String txnDate;

	public String getItemCode() {
		return itemCode;
	}

	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}

	public Integer getOnhandQty() {
		return onhandQty;
	}

	public void setOnhandQty(Integer onhandQty) {
		this.onhandQty = onhandQty;
	}

	public String getTxnDate() {
		return txnDate;
	}

	public void setTxnDate(String txnDate) {
		this.txnDate = txnDate;
	}

	@Override
	public String toString() {
		return "StockOnhandsVO [itemCode=" + itemCode + ", onhandQty=" + onhandQty + ", txnDate=" + txnDate + "]";
	}

}
