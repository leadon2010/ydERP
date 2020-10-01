package com.yedam.erp.items;

public class VendorVO {

	private String vendorCode;
	private String vendorName;
	private String vendorOwner;
	private String vendorLoc;
	private String locAddr;
	private String vendorPhone;
	private String vendorBank;
	private String vendorAccount;
	private String vendorBankowner;
	private String useFlag;
	private int first;
	private int last;

	public String getLocAddr() {
		return locAddr;
	}

	public void setLocAddr(String locAddr) {
		this.locAddr = locAddr;
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

	public String getUseFlag() {
		return useFlag;
	}

	public void setUseFlag(String useFlag) {
		this.useFlag = useFlag;
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

	public String getVendorBankowner() {
		return vendorBankowner;
	}

	public void setVendorBankowner(String vendorBankowner) {
		this.vendorBankowner = vendorBankowner;
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

	@Override
	public String toString() {
		return "VendorVO [vendorCode=" + vendorCode + ", vendorName=" + vendorName + ", vendorOwner=" + vendorOwner + ", vendorLoc=" + vendorLoc + ", vendorPhone=" + vendorPhone + ", vendorBank="
				+ vendorBank + ", vendorAccount=" + vendorAccount + ", vendorBankowner=" + vendorBankowner + ", useFlag=" + useFlag + ", first=" + first + ", last=" + last + "]";
	}

}
