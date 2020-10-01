package com.yedam.erp.items;

public class CustomerVO {

	private String customerCode;
	private String customerName;
	private String customerOwner;
	private String customerLoc;
	private String customerPhone;
	private String customerPw;
	private String customerBank;
	private String customerAccount;
	private String customerBankowner;
	private String locAddr;
	private int first;
	private int last;
	private String useFlag;

	public String getUseFlag() {
		return useFlag;
	}

	public void setUseFlag(String useFlag) {
		this.useFlag = useFlag;
	}

	public String getLocAddr() {
		return locAddr;
	}

	public void setLocAddr(String locAddr) {
		this.locAddr = locAddr;
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

	public String getCustomerOwner() {
		return customerOwner;
	}

	public void setCustomerOwner(String customerOwner) {
		this.customerOwner = customerOwner;
	}

	public String getCustomerLoc() {
		return customerLoc;
	}

	public void setCustomerLoc(String customerLoc) {
		this.customerLoc = customerLoc;
	}

	public String getCustomerPhone() {
		return customerPhone;
	}

	public void setCustomerPhone(String customerPhone) {
		this.customerPhone = customerPhone;
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

	public String getCustomerPw() {
		return customerPw;
	}

	public void setCustomerPw(String customerPw) {
		this.customerPw = customerPw;
	}

	public String getCustomerBank() {
		return customerBank;
	}

	public void setCustomerBank(String customerBank) {
		this.customerBank = customerBank;
	}

	public String getCustomerAccount() {
		return customerAccount;
	}

	public void setCustomerAccount(String customerAccount) {
		this.customerAccount = customerAccount;
	}

	public String getCustomerBankowner() {
		return customerBankowner;
	}

	public void setCustomerBankowner(String customerBankowner) {
		this.customerBankowner = customerBankowner;
	}

	@Override
	public String toString() {
		return "CustomerVO [customerCode=" + customerCode + ", customerName=" + customerName + ", customerOwner="
				+ customerOwner + ", customerLoc=" + customerLoc + ", customerPhone=" + customerPhone + ", customerPw="
				+ customerPw + ", customerBank=" + customerBank + ", customerAccount=" + customerAccount
				+ ", customerBankowner=" + customerBankowner + ", first=" + first + ", last=" + last + "]";
	}

}
