package com.yedam.erp.items;

import java.util.Date;

public class Sales_tempVO {

	private String itemList;
	private String customerCode;
	private String customSeq;
	private String itemCode;
	private String itemName;
	private Integer requestQty;
	private Date needDate;
	private Date createDate;
	private String deliveryAddr;
	private String phone;
	private int first;
	private int last;
	
	
	
	public String getItemList() {
		return itemList;
	}
	public void setItemList(String itemList) {
		this.itemList = itemList;
	}
	public String getCustomerCode() {
		return customerCode;
	}
	public void setCustomerCode(String customerCode) {
		this.customerCode = customerCode;
	}
	public String getCustomSeq() {
		return customSeq;
	}
	public void setCustomSeq(String customSeq) {
		this.customSeq = customSeq;
	}
	public String getItemCode() {
		return itemCode;
	}
	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}
	public Integer getRequestQty() {
		return requestQty;
	}
	public void setRequestQty(Integer requestQty) {
		this.requestQty = requestQty;
	}
	public Date getNeedDate() {
		return needDate;
	}
	public void setNeedDate(Date needDate) {
		this.needDate = needDate;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
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
	public String getDeliveryAddr() {
		return deliveryAddr;
	}
	public void setDeliveryAddr(String deliveryAddr) {
		this.deliveryAddr = deliveryAddr;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	@Override
	public String toString() {
		return "Sales_tempVO [itemList=" + itemList + ", customerCode=" + customerCode + ", customSeq=" + customSeq
				+ ", itemCode=" + itemCode + ", itemName=" + itemName + ", requestQty=" + requestQty + ", needDate="
				+ needDate + ", createDate=" + createDate + ", deliveryAddr=" + deliveryAddr + ", phone=" + phone
				+ ", first=" + first + ", last=" + last + "]";
	}
	
	
	
	
}
