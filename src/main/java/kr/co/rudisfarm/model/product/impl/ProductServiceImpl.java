package kr.co.rudisfarm.model.product.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.rudisfarm.model.payment.PremiumVO;
import kr.co.rudisfarm.model.product.ProductService;
import kr.co.rudisfarm.model.product.ProductVO;

@Service("ProductService")
public class ProductServiceImpl implements ProductService {

	@Autowired
	ProductDAO productDAO;

	@Override
	public List<Object> getProductList(Map<String, Object> map) {
		return productDAO.getProductList(map);
	}

	@Override
	public int updateProductViewCount(int product_id) {
		return productDAO.updateProductViewCount(product_id);
	}

	@Override
	public int updateProductImage(ProductVO vo) {
		return productDAO.updateProductImage(vo);
	}

	@Override
	public int checkCol(Map<String, Object> map) {
		return productDAO.checkCol(map);
	}

	@Override
	public List<ProductVO> getProductRandomListSide() {
		return productDAO.getProductRandomListSide();
	}

	@Override
	public int checkSellerStatus(String user_id) {
		return productDAO.checkSellerStatus(user_id);
	}

	@Override
	public List<ProductVO> getProductOrderList(String user_id) {
		return productDAO.getProductOrderList(user_id);
	}

	@Override
	public int updateProduct(ProductVO vo) {
		// TODO Auto-generated method stub
		return productDAO.updateProduct(vo);
	}
	
	@Override
	public int updateProductCount(ProductVO vo) {
		return productDAO.updateProductCount(vo);
	}

	@Override
	public List<ProductVO> getProductRandomList() {
		return productDAO.getProductRandomList();
	}

	@Override
	public int getProductListCount(Map<String, Object> map) {
		return productDAO.getProductListCount(map);
	}

	@Override
	public ProductVO getProduct(ProductVO vo) {
		return productDAO.getProduct(vo);
	}

	@Override
	public int insertProduct(ProductVO vo) {
		return productDAO.insertProduct(vo);
	}

	@Override
	public int deleteProduct(ProductVO vo) {
		return productDAO.deleteProduct(vo);
	}

	@Override
	public int updateProductImageSumnail(ProductVO vo) {
		return productDAO.updateProductImageSumnail(vo);
	}

	@Override
	public int updateProductImageFile(ProductVO vo) {
		return productDAO.updateProductImageFile(vo);
	}

	@Override
	public int updatePrimiumCount(String USER_ID) {
		return productDAO.updatePrimiumCount(USER_ID);
	}
	
	//adminindex
	@Override
	public int adminIndexProduct(ProductVO productVO) {
		return productDAO.adminIndexProduct(productVO);
	}

	@Override
	public List<PremiumVO> getPremiumList(String USER_ID) {
		return productDAO.getPremiumList(USER_ID);
	}
	
	@Override
	public int checkColUser(Map<String, Object> map) {
		return productDAO.checkColUser(map);
	}

	@Override
	public int deleteCart(int PRODUCT_ID) {
		return productDAO.cartDelete(PRODUCT_ID);
	}

	
}
