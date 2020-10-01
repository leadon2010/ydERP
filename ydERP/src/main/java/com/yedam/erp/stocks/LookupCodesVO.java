package com.yedam.erp.stocks;

public class LookupCodesVO {
	String lookupCode;
	String lookup;
	String lookupValues;
	String descriptions;
	String flag;
	String dff;
	String reflag;
	Integer lookupIdx;
	String title;
	String detailView;
	String cnt;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDetailView() {
		return detailView;
	}

	public void setDetailView(String detailView) {
		this.detailView = detailView;
	}

	public String getCnt() {
		return cnt;
	}

	public void setCnt(String cnt) {
		this.cnt = cnt;
	}

	public Integer getLookupIdx() {
		return lookupIdx;
	}

	public void setLookupIdx(Integer lookupIdx) {
		this.lookupIdx = lookupIdx;
	}

	public String getLookupCode() {
		return lookupCode;
	}

	public void setLookupCode(String lookupCode) {
		this.lookupCode = lookupCode;
	}

	public String getLookup() {
		return lookup;
	}

	public void setLookup(String lookup) {
		this.lookup = lookup;
	}

	public String getLookupValues() {
		return lookupValues;
	}

	public void setLookupValues(String lookupValues) {
		this.lookupValues = lookupValues;
	}

	public String getDescriptions() {
		return descriptions;
	}

	public void setDescriptions(String descriptions) {
		this.descriptions = descriptions;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public String getDff() {
		return dff;
	}

	public void setDff(String dff) {
		this.dff = dff;
	}

	public String getReflag() {
		return reflag;
	}

	public void setReflag(String reflag) {
		this.reflag = reflag;
	}

	@Override
	public String toString() {
		return "LookupCodes [lookupCode=" + lookupCode + ", lookup=" + lookup + ", lookupValues=" + lookupValues + ", descriptions=" + descriptions + ", flag=" + flag + ", dff=" + dff + ", reflag="
				+ reflag + ", lookupIdx=" + lookupIdx + "]";
	}

}
