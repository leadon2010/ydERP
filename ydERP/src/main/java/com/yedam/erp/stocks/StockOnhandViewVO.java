package com.yedam.erp.stocks;

public class StockOnhandViewVO extends StockOnhandVO {
	String itemName;
	String uom;
	Integer quantities;
	Integer supplyPrice;
	Integer sellingPrice;
	String itemTax;
	String expireDate;
	String vendorCode;
	Integer minQty;
	String vendorName;
	String group1;
	String group2;
	String group3;
	String zeroFlag;

	public String getZeroFlag() {
		return zeroFlag;
	}

	public void setZeroFlag(String zeroFlag) {
		this.zeroFlag = zeroFlag;
	}

	public String getGroup1() {
		return group1;
	}

	public void setGroup1(String group1) {
		this.group1 = group1;
	}

	public String getGroup2() {
		return group2;
	}

	public void setGroup2(String group2) {
		this.group2 = group2;
	}

	public String getGroup3() {
		return group3;
	}

	public void setGroup3(String group3) {
		this.group3 = group3;
	}

	public String getVendorName() {
		return vendorName;
	}

	public void setVendorName(String vendorName) {
		this.vendorName = vendorName;
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

	@Override
	public String toString() {
		return "StockOnhandViewVO [itemName=" + itemName + ", uom=" + uom + ", quantities=" + quantities
				+ ", supplyPrice=" + supplyPrice + ", sellingPrice=" + sellingPrice + ", itemTax=" + itemTax
				+ ", expireDate=" + expireDate + ", vendorCode=" + vendorCode + ", minQty=" + minQty + ", vendorName="
				+ vendorName + "]";
	}

}
