package com.yedam.erp.items.impl;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yedam.erp.items.ItemsVO;


@Repository
public class ItemsMybatisDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public void insertItems(ItemsVO vo) {
		sqlSession.insert("items.insertItems", vo);
	}

	public void updateItems(ItemsVO vo) {
		sqlSession.update("items.updateItems", vo);
	}

	public void deleteItems(ItemsVO vo) {
		sqlSession.delete("items.deleteItems", vo);
	}

	public ItemsVO getItems(ItemsVO vo) {
		System.out.println("mybatis");
		return sqlSession.selectOne("items.getItems", vo);
	}

	public List<ItemsVO> getItemsList(ItemsVO vo) {
		System.out.println("mybatis list");
		return sqlSession.selectList("items.getItemsList", vo);
	}

	public void deleteItemsList(ArrayList<String> itemCode) {
		sqlSession.delete("items.deleteItemsList", itemCode);
	}

	public int getCount(ItemsVO vo) {
		return sqlSession.selectOne("items.getCount", vo);
	}

	public List<ItemsVO> getVendorList2(ItemsVO vo) {
		System.out.println(sqlSession.selectList("items.getVendorList2", vo));
		return sqlSession.selectList("items.getVendorList2", vo);
	}

	// getItemGroup2
	public List<ItemsVO> getItemGroup2(ItemsVO vo) {
		return sqlSession.selectList("items.getItemGroup2", vo);
	}

	public List<ItemsVO> getItemGroup3(ItemsVO vo) {
		return sqlSession.selectList("items.getItemGroup3", vo);
	}
}
