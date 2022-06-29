package kr.co.rudisfarm.model.product_type.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.rudisfarm.model.product.ProductTypeVO;

@Repository("ProductTypeDAO")
public class ProductTypeDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<ProductTypeVO> getProductType1() {
		return mybatis.selectList("Product_Type.getProductType1");
	}
	
	public List<ProductTypeVO> getProductType2(String Type1) {
		return mybatis.selectList("Product_Type.getProductType2", Type1);
	}
	
	public int addProductType(ProductTypeVO productTypeVO) {
		return mybatis.insert("Product_Type.addProductType", productTypeVO);
	}
	
	public int checkType1(ProductTypeVO productTypeVO) {
		return mybatis.selectOne("Product_Type.checkType1", productTypeVO);
	}
	
	public int checkType2(ProductTypeVO productTypeVO) {
		return mybatis.selectOne("Product_Type.checkType2", productTypeVO);
	}
	
	public int deleteProductType(ProductTypeVO productTypeVO) {
		return mybatis.delete("Product_Type.deleteProductType",productTypeVO);
	}
	
	public int deleteProductTypeAll(ProductTypeVO productTypeVO) {
		return mybatis.delete("Product_Type.deleteProductTypeAll",productTypeVO);
	}
}