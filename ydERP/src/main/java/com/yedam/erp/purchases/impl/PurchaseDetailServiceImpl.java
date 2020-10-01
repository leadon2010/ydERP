package com.yedam.erp.purchases.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.erp.purchases.PurchaseDetailService;
import com.yedam.erp.purchases.PurchaseDetailVO;
import com.yedam.erp.purchases.PurchasesVO;

@Service
public class PurchaseDetailServiceImpl implements PurchaseDetailService {

	@Autowired
	PurchaseDetailMybatisDAO dao;

	public List<PurchaseDetailVO> getPurchaseDetailList(PurchasesVO vo) {
		return dao.getPurchaseDetailList(vo);
	}

}
