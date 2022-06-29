package kr.co.rudisfarm.model.index.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.rudisfarm.model.index.IndexService;
import kr.co.rudisfarm.model.product.ProductVO;

@Service("IndexService")
public class IndexServiceImpl implements IndexService {
	
	@Autowired
	IndexDAO indexDAO;
	
	public List<ProductVO> getIndexPremiumProduct(){
		return indexDAO.getIndexPremiumProduct();
	}
	
	public List<ProductVO> getIndexNewProduct(){
		return indexDAO.getIndexNewProduct(); 
	}
	
	public List<ProductVO> getIndexRecommendProduct() {
		return indexDAO.getIndexRecommendProduct(); 
	}
	
}
