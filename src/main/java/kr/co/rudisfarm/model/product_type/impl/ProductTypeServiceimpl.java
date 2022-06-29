package kr.co.rudisfarm.model.product_type.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.rudisfarm.model.product.ProductTypeService;
import kr.co.rudisfarm.model.product.ProductTypeVO;

@Service("ProductTypeService")
public class ProductTypeServiceimpl implements ProductTypeService{
	
	@Autowired
	ProductTypeDAO productTypeDAO;

	@Override
	public List<ProductTypeVO> getProductType1() {
		return productTypeDAO.getProductType1();
	}
	
	public List<ProductTypeVO> getProductType2(String Type1){
		return productTypeDAO.getProductType2(Type1);
	}

	@Override
	public int addProductType(ProductTypeVO productTypeVO) {
		return productTypeDAO.addProductType(productTypeVO);
	}

	@Override
	public int checkType1(ProductTypeVO productTypeVO) {
		return productTypeDAO.checkType1(productTypeVO);
	}

	@Override
	public int checkType2(ProductTypeVO productTypeVO) {
		return productTypeDAO.checkType2(productTypeVO);
	}
	
	@Override
	public int deleteProductType(ProductTypeVO productTypeVO) {
		return productTypeDAO.deleteProductType(productTypeVO);
	}

	@Override
	public int deleteProductTypeAll(ProductTypeVO productTypeVO) {
		return productTypeDAO.deleteProductTypeAll(productTypeVO);
	}	
}
