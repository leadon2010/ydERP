package com.yedam.erp.items.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yedam.erp.items.VendorVO;


@Repository
public class VendorMybatisDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
public List<VendorVO> getVendorList(VendorVO vo) {
		
		return sqlSession.selectList("items.getVendorList",vo);
	}

	public void deleteVendor(VendorVO vo) {
		sqlSession.delete("items.deleteVendor",vo);
	}

	public void insertVendor(VendorVO vo) {
		sqlSession.insert("items.insertVendor",vo);
	}
	
	public void updateVendor(VendorVO vo) {
		sqlSession.update("items.updateVendor",vo);
	}
	
	public VendorVO getVendor(VendorVO vo) {
		return sqlSession.selectOne("items.getVendor",vo);
	}

}
