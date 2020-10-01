package com.yedam.erp.stocks;

public class PurchaseRequestVO {
	String itemCode;
	String itemName;
	String uom;
	Integer inQty;
	Integer supplyPrice;
	Integer sellingPrice;
	String vendorCode;
	Integer minQty;
	Integer itemTax;
	Integer onhandQty;
	Integer reqQty;
	String expireDate;
	String vendorName;
	String vendorOwner;
	String vendorLoc;
	String vendorPhone;
	String vendorBank;
	String vendorAccount;
	String pMsg;
	String pTxnNo;
	String group1;
	String group2;
	String group3;
	Integer saleReqQty;
	String customerCode;
	String customerName;
	String needDate;
	Integer requestQty;
	Integer customSeq;
	String pVendorCode;
	int first;
	int last;
	int cnt;

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public int getFirst() {
		return first;
	}

	public void setFirst(int first) {
		this.first = first;
	}

	public int getLast() {
		return last;
	}

	public void setLast(int last) {
		this.last = last;
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

	public Integer getItemTax() {
		return itemTax;
	}

	public void setItemTax(Integer itemTax) {
		this.itemTax = itemTax;
	}

	public Integer getOnhandQty() {
		return onhandQty;
	}

	public void setOnhandQty(Integer onhandQty) {
		this.onhandQty = onhandQty;
	}

	public Integer getReqQty() {
		return reqQty;
	}

	public void setReqQty(Integer reqQty) {
		this.reqQty = reqQty;
	}

	public String getExpireDate() {
		return expireDate;
	}

	public void setExpireDate(String expireDate) {
		this.expireDate = expireDate;
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

	public String getpMsg() {
		return pMsg;
	}

	public void setpMsg(String pMsg) {
		this.pMsg = pMsg;
	}

	public String getpTxnNo() {
		return pTxnNo;
	}

	public void setpTxnNo(String pTxnNo) {
		this.pTxnNo = pTxnNo;
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

	public Integer getSaleReqQty() {
		return saleReqQty;
	}

	public void setSaleReqQty(Integer saleReqQty) {
		this.saleReqQty = saleReqQty;
	}

	public String getCustomerCode() {
		return customerCode;
	}

	public void setCustomerCode(String customerCode) {
		this.customerCode = customerCode;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getNeedDate() {
		return needDate;
	}

	public void setNeedDate(String needDate) {
		this.needDate = needDate;
	}

	public Integer getRequestQty() {
		return requestQty;
	}

	public void setRequestQty(Integer requestQty) {
		this.requestQty = requestQty;
	}

	public Integer getCustomSeq() {
		return customSeq;
	}

	public void setCustomSeq(Integer customSeq) {
		this.customSeq = customSeq;
	}

	public String getpVendorCode() {
		return pVendorCode;
	}

	public void setpVendorCode(String pVendorCode) {
		this.pVendorCode = pVendorCode;
	}

	@Override
	public String toString() {
		return "PurchaseRequestVO [itemCode=" + itemCode + ", itemName=" + itemName + ", uom=" + uom + ", inQty=" + inQty + ", supplyPrice=" + supplyPrice + ", sellingPrice=" + sellingPrice
				+ ", vendorCode=" + vendorCode + ", minQty=" + minQty + ", itemTax=" + itemTax + ", onhandQty=" + onhandQty + ", reqQty=" + reqQty + ", expireDate=" + expireDate + ", vendorName="
				+ vendorName + ", vendorOwner=" + vendorOwner + ", vendorLoc=" + vendorLoc + ", vendorPhone=" + vendorPhone + ", vendorBank=" + vendorBank + ", vendorAccount=" + vendorAccount
				+ ", pMsg=" + pMsg + ", pTxnNo=" + pTxnNo + ", group1=" + group1 + ", group2=" + group2 + ", group3=" + group3 + ", saleReqQty=" + saleReqQty + ", customerCode=" + customerCode
				+ ", customerName=" + customerName + ", needDate=" + needDate + ", requestQty=" + requestQty + ", customSeq=" + customSeq + ", pVendorCode=" + pVendorCode + "]";
	}

}
