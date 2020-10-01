package com.yedam.erp.items.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.erp.items.VendorService;
import com.yedam.erp.items.VendorVO;

@Service("VendorService")
public class VendorServiceImpl implements VendorService {

	@Autowired
	VendorMybatisDAO dao;
	
	@Override
	public List<VendorVO> getVendorList(VendorVO vo) {
		return dao.getVendorList(vo);

	}

	@Override
	public void deleteVendor(VendorVO vo) {
		dao.deleteVendor(vo);

	}

	@Override
	public void insertVendor(VendorVO vo) {
		dao.insertVendor(vo);
	}

	@Override
	public void updateVendor(VendorVO vo) {
		dao.updateVendor(vo);
	}

	@Override
	public VendorVO getVendor(VendorVO vo) {
		return dao.getVendor(vo);
	}

	


}
