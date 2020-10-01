package com.yedam.erp.stocks.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yedam.erp.stocks.StockOnhandViewVO;

@Repository
public class StockOnhandMybatisDAO {

	@Autowired
	SqlSessionTemplate sqlSession;

	public List<StockOnhandViewVO> getStockOnhandList(StockOnhandViewVO vo) {
		return sqlSession.selectList("stocks.getStockOnhandList", vo);
	}

	public List<StockOnhandViewVO> getVendorList(StockOnhandViewVO vo) {
		return sqlSession.selectList("stocks.getVendorList", vo);
	}

	public List<Map<String, String>> getItemGroup1() {
		return sqlSession.selectList("stocks.getItemGroup1");
	}

	public List<Map<String, String>> getItemGroup2(String str) {
		System.out.println(str);
		return sqlSession.selectList("stocks.getItemGroup2", str);
	}

	public List<Map<String, String>> getItemGroup3(String str) {
		return sqlSession.selectList("stocks.getItemGroup3", str);
	}

	public void updateLookups(String str) {
		sqlSession.update("stocks.updateLookups", str);
	}

}
