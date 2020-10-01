package com.yedam.erp.purchases;

public class PurchasesVO
{

	private String purchaseCode;			// 구매코드
	private String purchaseDate;			// 구매일자
	private String vendorCode;		// 구매처
	
	private String purchaseItem;			// 품목코드
	private Integer purchaseQty;			// 구매수량
	private Integer purchasePrice;			// 구매단가
	private double itemTax;			// 부가세
	private Integer purchaseCost;			// 결제금액	
	private String incomingFlag;
	private String purchaseDetailCode; //구매상세코드
	private String vendorName; //구매처명
	private String total;	 //총액
	private String itemCount; //아이템총갯수
	
	
	
	
	
	

	public String getTotal() {
		return total;
	}
	public void setTotal(String total) {
		this.total = total;
	}
	public String getItemCount() {
		return itemCount;
	}
	public void setItemCount(String itemCount) {
		this.itemCount = itemCount;
	}
	public String getVendorName() {
		return vendorName;
	}
	public void setVendorName(String vendorName) {
		this.vendorName = vendorName;
	}
	public String getPurchaseDetailCode() {
		return purchaseDetailCode;
	}
	public void setPurchaseDetailCode(String purchaseDetailCode) {
		this.purchaseDetailCode = purchaseDetailCode;
	}
	public String getIncomingFlag() {
		return incomingFlag;
	}
	public void setIncomingFlag(String incomingFlag) {
		this.incomingFlag = incomingFlag;
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
	public double getItemTax() {
		return itemTax;
	}
	public void setItemTax(double itemTax) {
		this.itemTax = itemTax;
	}
	public Integer getPurchaseCost() {
		return purchaseCost;
	}
	public void setPurchaseCost(Integer purchaseCost) {
		this.purchaseCost = purchaseCost;
	}
	@Override
	public String toString() {
		return "PurchasesVO [purchaseCode=" + purchaseCode + ", purchaseDate=" + purchaseDate + ", vendorCode="
				+ vendorCode + ", purchaseItem=" + purchaseItem + ", purchaseQty=" + purchaseQty + ", purchasePrice="
				+ purchasePrice + ", itemTax=" + itemTax + ", purchaseCost=" + purchaseCost + "]";
	}
	
}
