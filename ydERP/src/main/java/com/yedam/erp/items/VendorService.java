package com.yedam.erp.items;

import java.util.List;

public interface VendorService {
	public void insertVendor(VendorVO vo);
	public void updateVendor(VendorVO vo);
	public VendorVO getVendor(VendorVO vo);
	public List<VendorVO> getVendorList(VendorVO vo);
	public void deleteVendor(VendorVO vo);
}
