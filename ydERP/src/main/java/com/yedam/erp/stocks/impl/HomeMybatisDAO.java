package com.yedam.erp.stocks.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yedam.erp.stocks.LookupCodesVO;

@Repository
public class HomeMybatisDAO {
	@Autowired
	SqlSessionTemplate sqlSession;

	public List<Map<String, String>> getMostSoldItem() {
		return sqlSession.selectList("stocks.getMostSoldItem");
	}

	public List<Map<String, String>> getMostBuyItem() {
		return sqlSession.selectList("stocks.getMostBuyItem");
	}

	public List<Map<String, Object>> getInOutQtyChart() {
		return sqlSession.selectList("stocks.getInOutQtyChart");
	}

	public List<Map<String, Object>> getInOutAmtChart() {
		return sqlSession.selectList("stocks.getInOutAmtChart");
	}

	// 기존
	public List<Map<String, Object>> getLookups(String str) {
		System.out.println("dao str========"+str);
		return sqlSession.selectList("stocks.getLookupsData", str);
	}

	// 변경
	public List<Map<String, Object>> getLookups2(LookupCodesVO vo) {
		return sqlSession.selectList("stocks.getLookupsData2", vo);
	}

	public List<Map<String, String>> getLookValues() {
		return sqlSession.selectList("stocks.getLookupValues");
	}

	public List<Map<String, String>> selectLookups(String str) {
		return sqlSession.selectList("stocks.selectLookups", str);
	}

	public void updateLookups(LookupCodesVO vo) {
		System.out.println("dao===="+vo);
		sqlSession.update("stocks.updateLookup", vo);
	}

	public void updateLookups2(Map str) {
		System.out.println("dao===="+str);
		sqlSession.update("stocks.updateLookup2", str);
	}

}
