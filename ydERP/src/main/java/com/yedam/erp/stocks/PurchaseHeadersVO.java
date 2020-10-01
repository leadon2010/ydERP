package com.yedam.erp.stocks;

public class PurchaseHeadersVO {
	String purchaseCode;
	String purchaseDate;
	String vendorCode;
	String vendorName;
	Integer purchaseQty;
	Integer purchaseCost;
	String purchaseItem;
	Integer itemTax;

	public String getVendorName() {
		return vendorName;
	}

	public void setVendorName(String vendorName) {
		this.vendorName = vendorName;
	}

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

	public Integer getPurchaseQty() {
		return purchaseQty;
	}

	public void setPurchaseQty(Integer purchaseQty) {
		this.purchaseQty = purchaseQty;
	}

	public Integer getPurchaseCost() {
		return purchaseCost;
	}

	public void setPurchaseCost(Integer purchaseCost) {
		this.purchaseCost = purchaseCost;
	}

	public String getPurchaseItem() {
		return purchaseItem;
	}

	public void setPurchaseItem(String purchaseItem) {
		this.purchaseItem = purchaseItem;
	}

	public Integer getItemTax() {
		return itemTax;
	}

	public void setItemTax(Integer itemTax) {
		this.itemTax = itemTax;
	}

	@Override
	public String toString() {
		return "PurchaseHeadersVO [purchaseCode=" + purchaseCode + ", purchaseDate=" + purchaseDate + ", vendorCode="
				+ vendorCode + ", purchaseQty=" + purchaseQty + ", purchaseCost=" + purchaseCost + ", purchaseItem="
				+ purchaseItem + ", itemTax=" + itemTax + "]";
	}

}
