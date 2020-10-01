package com.yedam.erp.stocks;

public class StockInOutViewVO extends StockInOutVO {
	String itemName;
	String uom;
	Integer quantities;
	Integer supplyPrice;
	Integer sellingPrice;
	String itemTax;
	String expireDate;
	String vendorCode;
	Integer minQty;
	String poSoNumber;
	String fromDate;
	String toDate;
	String txnDate;

	public String getTxnDate() {
		return txnDate;
	}

	public void setTxnDate(String txnDate) {
		this.txnDate = txnDate;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public String getUom() {
		return uom;
	}

	public void setUom(String uom) {
		this.uom = uom;
	}

	public Integer getQuantities() {
		return quantities;
	}

	public void setQuantities(Integer quantities) {
		this.quantities = quantities;
	}

	public Integer getSupplyPrice() {
		return supplyPrice;
	}

	public void setSupplyPrice(Integer supplyPrice) {
		this.supplyPrice = supplyPrice;
	}

	public Integer getSellingPrice() {
		return sellingPrice;
	}

	public void setSellingPrice(Integer sellingPrice) {
		this.sellingPrice = sellingPrice;
	}

	public String getItemTax() {
		return itemTax;
	}

	public void setItemTax(String itemTax) {
		this.itemTax = itemTax;
	}

	public String getExpireDate() {
		return expireDate;
	}

	public void setExpireDate(String expireDate) {
		this.expireDate = expireDate;
	}

	public String getVendorCode() {
		return vendorCode;
	}

	public void setVendorCode(String vendorCode) {
		this.vendorCode = vendorCode;
	}

	public Integer getMinQty() {
		return minQty;
	}

	public void setMinQty(Integer minQty) {
		this.minQty = minQty;
	}

	public String getPoSoNumber() {
		return poSoNumber;
	}

	public void setPoSoNumber(String poSoNumber) {
		this.poSoNumber = poSoNumber;
	}

	public String getFromDate() {
		return fromDate;
	}

	public void setFromDate(String fromDate) {
		this.fromDate = fromDate;
	}

	public String getToDate() {
		return toDate;
	}

	public void setToDate(String toDate) {
		this.toDate = toDate;
	}

	@Override
	public String toString() {
		return "StockInOutViewVO [itemName=" + itemName + ", uom=" + uom + ", quantities=" + quantities + ", supplyPrice=" + supplyPrice + ", sellingPrice=" + sellingPrice + ", itemTax=" + itemTax
				+ ", expireDate=" + expireDate + ", vendorCode=" + vendorCode + ", minQty=" + minQty + ", poSoNumber=" + poSoNumber + ", fromDate=" + fromDate + ", toDate=" + toDate + "]";
	}

}
