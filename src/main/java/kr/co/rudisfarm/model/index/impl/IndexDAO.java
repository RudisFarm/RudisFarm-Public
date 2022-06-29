package kr.co.rudisfarm.model.index.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.rudisfarm.model.product.ProductVO;

@Repository("IndexDAO")
public class IndexDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	//프리미엄 회원
	public List<ProductVO> getIndexPremiumProduct(){
		System.out.println("[DAO:인덱스 프리미엄 회원 상품]");
		return mybatis.selectList("indexDAO.getIndexPremiumProduct");
	}
	
	//신규 상품 4개
	public List<ProductVO> getIndexNewProduct(){
		System.out.println("[DAO:인덱스 신규 상품]");
		return mybatis.selectList("indexDAO.getIndexNewProduct");
	}
	
	//랜덤 상품 4개
	public List<ProductVO> getIndexRecommendProduct() {
		System.out.println("[DAO:인덱스 추천(랜덤) 상품]");
		return mybatis.selectList("indexDAO.getIndexRecommendProduct");
	}
}
