package com.yedam.erp.stocks.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.erp.stocks.LookupCodesVO;

@Service
public class HomeServiceImpl {

	@Autowired
	HomeMybatisDAO dao;

	public List<Map<String, String>> getMostSoldItem() {
		return dao.getMostSoldItem();
	}

	public List<Map<String, String>> getMostBuyItem() {
		return dao.getMostBuyItem();
	}

	public List<Map<String, Object>> getInOutQtyChart() {
		return dao.getInOutQtyChart();
	}

	public List<Map<String, Object>> getInOutAmtChart() {
		return dao.getInOutAmtChart();
	}

	public List<Map<String, Object>> getLookups(String str) {
		System.out.println("svc str========"+str);
		return dao.getLookups(str);
	}

	public List<Map<String, Object>> getLookups2(LookupCodesVO vo) {
		return dao.getLookups2(vo);
	}

	public List<Map<String, String>> getLookValues() {
		return dao.getLookValues();
	}

	public List<Map<String, String>> selectLookups(String str) {
		return dao.selectLookups(str);
	}

	public void updateLookups(LookupCodesVO vo) {
		System.out.println("service====" + vo);
		dao.updateLookups(vo);
	}

	public void updateLookups2(Map str) {
		System.out.println("service====" + str);
		dao.updateLookups2(str);
	}

}
