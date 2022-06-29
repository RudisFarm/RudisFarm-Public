package kr.co.rudisfarm.model.index;

import java.util.List;

import kr.co.rudisfarm.model.product.ProductVO;

public interface IndexService {
	
	public List<ProductVO> getIndexPremiumProduct();
	public List<ProductVO> getIndexNewProduct();
	public List<ProductVO> getIndexRecommendProduct();
}
