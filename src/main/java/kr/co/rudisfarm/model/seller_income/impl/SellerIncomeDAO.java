package kr.co.rudisfarm.model.seller_income.impl;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.rudisfarm.model.seller_income.SellerIncomeVO;

@Repository("SellerIncomeDAO")
public class SellerIncomeDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int selectAdminSellerIncomeListCount(HashMap<String, Object> pageInfo) {
		
		return mybatis.selectOne("SellerIncomeDAO.selectAdminSellerIncomeListCount", pageInfo);
	}
	
	public List<SellerIncomeVO> selectAdminSellerIncomeList(HashMap<String, Object> pageInfo) {
		
		return mybatis.selectList("SellerIncomeDAO.selectAdminSellerIncomeList", pageInfo);
	}
	
	public int selectSellerSellerIncomeListCount(HashMap<String, Object> pageInfo) {
		
		return mybatis.selectOne("SellerIncomeDAO.selectSellerSellerIncomeListCount", pageInfo);
	}
	
	public List<SellerIncomeVO> selectSellerSellerIncomeList(HashMap<String, Object> pageInfo) {
		
		return mybatis.selectList("SellerIncomeDAO.selectSellerSellerIncomeList", pageInfo);
	}
	
	public SellerIncomeVO selectSellerIncome(SellerIncomeVO vo) {
		
		return mybatis.selectOne("SellerIncomeDAO.selectSellerIncome", vo);
	}

	public int insertSellerIncome(SellerIncomeVO vo) {
		
		return mybatis.insert("SellerIncomeDAO.insertSellerIncome", vo);
	}

	public int updateSellerIncome(SellerIncomeVO vo) {
		// TODO Auto-generated method stub
		return mybatis.update("SellerIncomeDAO.updateSellerIncome", vo);
	}

}
