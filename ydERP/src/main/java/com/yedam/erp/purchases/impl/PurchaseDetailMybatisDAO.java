package com.yedam.erp.purchases.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yedam.erp.purchases.PurchaseDetailVO;
import com.yedam.erp.purchases.PurchasesVO;

@Repository
public class PurchaseDetailMybatisDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	public List<PurchaseDetailVO> getPurchaseDetailList(PurchasesVO vo) {
		return sqlSession.selectList("purchases.getPurchaseDetailList", vo);
	}

}
