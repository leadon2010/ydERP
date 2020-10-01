package com.yedam.erp.purchases;

public class PurchaseDetailVO {
	String purchaseCode;
	String purchaseDate;
	String vendorCode;
	String purchaseDetailCode;
	String purchaseItem;
	Integer purchaseQty;
	Integer purchasePrice;
	Integer itemTax;
	String incomingFlag;
	String itemName;
	String uom;
	Integer inQty;
	Integer supplyPrice;
	Integer sellingPrice;

	public String getPurchaseCode() {
		return purchaseCode;
	}

	public void setPurchaseCode(String purchaseCode) {
		this.purchaseCode = purchaseCode;
	}

	public String getPurchaseDate() {
		return purchaseDate;
	}

	public void setPurchaseDate(String purchaseDate) {
		this.purchaseDate = purchaseDate;
	}

	public String getVendorCode() {
		return vendorCode;
	}

	public void setVendorCode(String vendorCode) {
		this.vendorCode = vendorCode;
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

	public Integer getInQty() {
		return inQty;
	}

	public void setInQty(Integer inQty) {
		this.inQty = inQty;
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

	@Override
	public String toString() {
		return "PurchaseDetailsVO [purchaseCode=" + purchaseCode + ", purchaseDate=" + purchaseDate + ", vendorCode="
				+ vendorCode + ", purchaseDetailCode=" + purchaseDetailCode + ", purchaseItem=" + purchaseItem
				+ ", purchaseQty=" + purchaseQty + ", purchasePrice=" + purchasePrice + ", itemTax=" + itemTax
				+ ", incomingFlag=" + incomingFlag + ", itemName=" + itemName + ", uom=" + uom + ", inQty=" + inQty
				+ ", supplyPrice=" + supplyPrice + ", sellingPrice=" + sellingPrice + "]";
	}

}
