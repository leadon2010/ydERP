package com.yedam.erp.stocks;

public class PurchaseDetailTempVO {
	String tmpDetailCode;
	String tmpMasterCode;
	Integer tmpPurchaseQty;
	Integer tmpPurchasePrice;
	Integer tmpItemTax;
	String itemCode;
	String itemName;
	String uom;
	Integer inQty;
	Integer supplyPrice;
	Integer sellingPrice;
	Integer itemTax;
	String expireDate;
	Integer minQty;
	String vendorCode;
	String vendorName;
	String vendorOwner;
	String vendorLoc;
	String vendorPhone;
	String vendorBank;
	String vendorAccount;
	Integer reqQty;

	public Integer getReqQty() {
		return reqQty;
	}

	public void setReqQty(Integer reqQty) {
		this.reqQty = reqQty;
	}

	public String getTmpDetailCode() {
		return tmpDetailCode;
	}

	public void setTmpDetailCode(String tmpDetailCode) {
		this.tmpDetailCode = tmpDetailCode;
	}

	public String getTmpMasterCode() {
		return tmpMasterCode;
	}

	public void setTmpMasterCode(String tmpMasterCode) {
		this.tmpMasterCode = tmpMasterCode;
	}

	public Integer getTmpPurchaseQty() {
		return tmpPurchaseQty;
	}

	public void setTmpPurchaseQty(Integer tmpPurchaseQty) {
		this.tmpPurchaseQty = tmpPurchaseQty;
	}

	public Integer getTmpPurchasePrice() {
		return tmpPurchasePrice;
	}

	public void setTmpPurchasePrice(Integer tmpPurchasePrice) {
		this.tmpPurchasePrice = tmpPurchasePrice;
	}

	public Integer getTmpItemTax() {
		return tmpItemTax;
	}

	public void setTmpItemTax(Integer tmpItemTax) {
		this.tmpItemTax = tmpItemTax;
	}

	public String getItemCode() {
		return itemCode;
	}

	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
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

	public Integer getItemTax() {
		return itemTax;
	}

	public void setItemTax(Integer itemTax) {
		this.itemTax = itemTax;
	}

	public String getExpireDate() {
		return expireDate;
	}

	public void setExpireDate(String expireDate) {
		this.expireDate = expireDate;
	}

	public Integer getMinQty() {
		return minQty;
	}

	public void setMinQty(Integer minQty) {
		this.minQty = minQty;
	}

	public String getVendorCode() {
		return vendorCode;
	}

	public void setVendorCode(String vendorCode) {
		this.vendorCode = vendorCode;
	}

	public String getVendorName() {
		return vendorName;
	}

	public void setVendorName(String vendorName) {
		this.vendorName = vendorName;
	}

	public String getVendorOwner() {
		return vendorOwner;
	}

	public void setVendorOwner(String vendorOwner) {
		this.vendorOwner = vendorOwner;
	}

	public String getVendorLoc() {
		return vendorLoc;
	}

	public void setVendorLoc(String vendorLoc) {
		this.vendorLoc = vendorLoc;
	}

	public String getVendorPhone() {
		return vendorPhone;
	}

	public void setVendorPhone(String vendorPhone) {
		this.vendorPhone = vendorPhone;
	}

	public String getVendorBank() {
		return vendorBank;
	}

	public void setVendorBank(String vendorBank) {
		this.vendorBank = vendorBank;
	}

	public String getVendorAccount() {
		return vendorAccount;
	}

	public void setVendorAccount(String vendorAccount) {
		this.vendorAccount = vendorAccount;
	}

	@Override
	public String toString() {
		return "PurchaseDetailTempVO [tmpDetailCode=" + tmpDetailCode + ", tmpMasterCode=" + tmpMasterCode
				+ ", tmpPurchaseQty=" + tmpPurchaseQty + ", tmpPurchasePrice=" + tmpPurchasePrice + ", tmpItemTax="
				+ tmpItemTax + ", itemCode=" + itemCode + ", itemName=" + itemName + ", uom=" + uom + ", inQty=" + inQty
				+ ", supplyPrice=" + supplyPrice + ", sellingPrice=" + sellingPrice + ", itemTax=" + itemTax
				+ ", expireDate=" + expireDate + ", minQty=" + minQty + ", vendorCode=" + vendorCode + ", vendorName="
				+ vendorName + ", vendorOwner=" + vendorOwner + ", vendorLoc=" + vendorLoc + ", vendorPhone="
				+ vendorPhone + ", vendorBank=" + vendorBank + ", vendorAccount=" + vendorAccount + "]";
	}

}
