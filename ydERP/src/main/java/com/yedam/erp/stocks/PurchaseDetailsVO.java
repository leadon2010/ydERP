package com.yedam.erp.stocks;

public class PurchaseDetailsVO extends PurchaseHeadersVO {
	String purchaseDetailCode;
	String purchaseItem;
	Integer purchaseQty;
	Integer purchasePrice;
	Integer itemTax;
	String incomingFlag;
	String itemName;

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public String getPurchaseDetailCode() {
		return purchaseDetailCode;
	}

	public void setPurchaseDetailCode(String purchaseDetailCode) {
		this.purchaseDetailCode = purchaseDetailCode;
	}

	public String getPurchaseItem() {
		return purchaseItem;
	}

	public void setPurchaseItem(String purchaseItem) {
		this.purchaseItem = purchaseItem;
	}

	public Integer getPurchaseQty() {
		return purchaseQty;
	}

	public void setPurchaseQty(Integer purchaseQty) {
		this.purchaseQty = purchaseQty;
	}

	public Integer getPurchasePrice() {
		return purchasePrice;
	}

	public void setPurchasePrice(Integer purchasePrice) {
		this.purchasePrice = purchasePrice;
	}

	public Integer getItemTax() {
		return itemTax;
	}

	public void setItemTax(Integer itemTax) {
		this.itemTax = itemTax;
	}

	public String getIncomingFlag() {
		return incomingFlag;
	}

	public void setIncomingFlag(String incomingFlag) {
		this.incomingFlag = incomingFlag;
	}

	@Override
	public String toString() {
		return "PurchaseDetailsVO [purchaseDetailCode=" + purchaseDetailCode + ", purchaseItem=" + purchaseItem
				+ ", purchaseQty=" + purchaseQty + ", purchasePrice=" + purchasePrice + ", itemTax=" + itemTax
				+ ", incomingFlag=" + incomingFlag + "]";
	}

}
