package kr.co.rudisfarm.model.product;

import java.util.List;
import java.util.Map;
import kr.co.rudisfarm.model.payment.PremiumVO;

public interface ProductService {
	public List<Object> getProductList(Map<String, Object> map);
	public List<ProductVO> getProductRandomList();
	public ProductVO getProduct(ProductVO vo);
	public int getProductListCount(Map<String, Object> map);
	public int updateProductViewCount(int product_id);
	public int insertProduct(ProductVO vo);
	public int updateProduct(ProductVO vo);
	public int updateProductCount(ProductVO vo);
	public int deleteProduct(ProductVO vo);
	public int updateProductImage(ProductVO vo);
	public int updateProductImageSumnail(ProductVO vo);
	public int updateProductImageFile(ProductVO vo);
	public int checkSellerStatus(String user_id);
	public int checkCol(Map<String, Object> map);
	public int updatePrimiumCount(String USER_ID);
	public List<PremiumVO> getPremiumList(String USER_ID);
	public int checkColUser(Map<String, Object> map);
	public int deleteCart(int PRODUCT_ID);
	public int adminIndexProduct(ProductVO productVO);
	public List<ProductVO> getProductOrderList(String user_id);
	public List<ProductVO> getProductRandomListSide();
}
