package com.yedam.erp.sales.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yedam.erp.items.ItemsVO;
import com.yedam.erp.items.Sales_tempVO;

@Repository
public class Sales_tempMybatisDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<Sales_tempVO> getSales_tempList(Sales_tempVO vo) {
		return sqlSession.selectList("items.getSales_tempList",vo);
	}

	public void deleteSales_temp(Sales_tempVO vo) {
		sqlSession.delete("items.deleteSales_temp",vo);
	}

	public void insertSales_temp(Sales_tempVO vo) {
		sqlSession.insert("items.insertSales_temp",vo);
	}
	
	public void updateSales_temp(Sales_tempVO vo) {
		sqlSession.update("items.updateSales_temp",vo);
	}
	
	public Sales_tempVO getSales_temp(Sales_tempVO vo) {
		return sqlSession.selectOne("items.getSales_temp",vo);
	}
	
	public List<ItemsVO> getItemsList(ItemsVO vo) {
		return sqlSession.selectList("items.getItemsList",vo);
	}
		
	
}
