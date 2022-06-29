package kr.co.rudisfarm.model.product;

import java.util.List;

public interface ProductTypeService {
	public List<ProductTypeVO> getProductType1();
	public List<ProductTypeVO> getProductType2(String Type1);
	public int addProductType(ProductTypeVO productTypeVO);
	public int checkType1(ProductTypeVO productTypeVO);
	public int checkType2(ProductTypeVO productTypeVO);
	public int deleteProductType(ProductTypeVO productTypeVO);
	public int deleteProductTypeAll(ProductTypeVO productTypeVO);
}
