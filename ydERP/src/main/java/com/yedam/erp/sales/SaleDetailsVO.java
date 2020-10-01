package com.yedam.erp.sales;

public class SaleDetailsVO {
	
	private String saleDetailCode;		// 판매상세코드
	private String saleCode;			// 판매코드
	private String saleItemCode;		// 판매품목코드
	private String saleItemName;		// 판매품목명
	private Integer salePrice;			// 판매가	
	private double itemTax;				// 부가세
	private Integer saleQty;			// 판매수량
	private Integer expireDate;			// 사용연한
	private String vendorCode;			// 생산처 코드
	private String vendorName;			// 생산처 이름
	
	public String getSaleItemName() {
		return saleItemName;
	}
	public void setSaleItemName(String saleItemName) {
		this.saleItemName = saleItemName;
	}
	public double getItemTax() {
		return itemTax;
	}
	public void setItemTax(double itemTax) {
		this.itemTax = itemTax;
	}
	public Integer getExpireDate() {
		return expireDate;
	}
	public void setExpireDate(Integer expireDate) {
		this.expireDate = expireDate;
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
	public String getSaleDetailCode() {
		return saleDetailCode;
	}
	public void setSaleDetailCode(String saleDetailCode) {
		this.saleDetailCode = saleDetailCode;
	}
	public String getSaleCode() {
		return saleCode;
	}
	public void setSaleCode(String saleCode) {
		this.saleCode = saleCode;
	}
	public String getSaleItemCode() {
		return saleItemCode;
	}
	public void setSaleItemCode(String saleItemCode) {
		this.saleItemCode = saleItemCode;
	}
		
	public Integer getSalePrice() {
		return salePrice;
	}
	public void setSalePrice(Integer salePrice) {
		this.salePrice = salePrice;
	}
	public Integer getSaleQty() {
		return saleQty;
	}
	public void setSaleQty(Integer saleQty) {
		this.saleQty = saleQty;
	}
}