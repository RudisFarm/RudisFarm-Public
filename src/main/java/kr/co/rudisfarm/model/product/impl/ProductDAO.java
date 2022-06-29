package kr.co.rudisfarm.model.product.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.rudisfarm.model.payment.PremiumVO;
import kr.co.rudisfarm.model.product.ProductVO;

@Repository("ProductDAO")
public class ProductDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<Object> getProductList(Map<String, Object> map) {
		List<Object> list = mybatis.selectList("ProductDAO.getProductList", map);
		return list;
	}
	
	public int getProductListCount(Map<String, Object> map) {
		return mybatis.selectOne("ProductDAO.getProductListCount", map);
	}
	
	public List<ProductVO> getProductRandomList() {
		List<ProductVO> list = mybatis.selectList("ProductDAO.getProductRandomList"); 
		return list;
	}

	public ProductVO getProduct(ProductVO vo) {
		return mybatis.selectOne("ProductDAO.getProduct", vo);
	}
	
	public int updateProductViewCount(int product_id) {
		return mybatis.update("ProductDAO.updateProductViewCount", product_id);
	}
	
	public int insertProduct(ProductVO vo) {
		return mybatis.insert("ProductDAO.insertProduct", vo);
	}
	
	public int updateProduct(ProductVO vo) {
		return mybatis.insert("ProductDAO.updateProduct", vo);
	}
	
	public int updateProductCount(ProductVO vo) {
		return mybatis.insert("ProductDAO.updateProductCount", vo);
	}
	
	public int deleteProduct(ProductVO vo) {
		return mybatis.delete("ProductDAO.deleteProduct", vo);
	}
	
	public int updateProductImage(ProductVO vo) {
		return mybatis.update("ProductDAO.updateProductImage", vo);
	}
	
	public int deleteProductbyUserId(ProductVO vo) {
		return mybatis.update("ProductDAO.deleteProductbyUserId", vo);
	}
	
	public int updateProductImageSumnail(ProductVO vo) {
		return mybatis.update("ProductDAO.updateProductImageSumnail", vo);
	}
	
	public int updateProductImageFile(ProductVO vo) {
		return mybatis.update("ProductDAO.updateProductImageFile", vo);
	}
	
	public int checkSellerStatus(String USER_ID) {
		return mybatis.selectOne("ProductDAO.checkSellerStatus", USER_ID);
	}
	
	public int checkCol(Map<String, Object> map) {
		return mybatis.selectOne("ProductDAO.checkCol", map);
	}
	
	public int checkColUser(Map<String, Object> map) {
		return mybatis.selectOne("ProductDAO.checkColUser", map);
	}
	
	public int updatePrimiumCount(String USER_ID) {
		return mybatis.update("ProductDAO.updatePrimiumCount", USER_ID);
	}
	
	public List<PremiumVO> getPremiumList(String USER_ID) {
		return mybatis.selectList("ProductDAO.getPremiumList", USER_ID);
	}
	public int cartDelete(int PRODUCT_ID) {
		return mybatis.delete("ProductDAO.cartDelete", PRODUCT_ID);
	}
	
	public List<ProductVO> getProductOrderList(String user_id) {
		List<ProductVO> list = mybatis.selectList("ProductDAO.getProductOrderList", user_id); 
		return list;
	}
	// adminindex
	public int adminIndexProduct(ProductVO productVO) {
		return mybatis.selectOne("ProductDAO.adminIndexProduct", productVO);
	}
	
	public List<ProductVO> getProductRandomListSide() {
		return mybatis.selectList("ProductDAO.getProductRandomListSide");
	}
}