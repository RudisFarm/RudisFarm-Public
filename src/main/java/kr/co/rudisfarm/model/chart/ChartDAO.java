package kr.co.rudisfarm.model.chart;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("ChartDAO")
public class ChartDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<ChartVO> getType2List(ChartVO vo) {
		return mybatis.selectList("ChartDAO.getType2List", vo);
	}

	public List<ChartVO> getYearList() {
		return mybatis.selectList("ChartDAO.getUserYearList");
	}

	public int getUserCount() {
		return mybatis.selectOne("ChartDAO.getUserCount");
	}

	public int getProductCount() {
		return mybatis.selectOne("ChartDAO.getProductCount");
	}
	public List<ChartVO> getProductYearList() {
		return mybatis.selectList("ChartDAO.getProductYearList");
	}

	public int getOrderCount() {
		return mybatis.selectOne("ChartDAO.getOrderCount");
	}

	public List<ChartVO> getOrderYearList() {
		return mybatis.selectList("ChartDAO.getOrderYearList");
	}

	public int getTotalPrice() {
		Object result = mybatis.selectOne("ChartDAO.getTotalPrice");
		
		if(result == null) {
			return 0;
		} else {
			return (int)result;
		}
	}

	public List<ChartVO> getPriceYearList() {
		return mybatis.selectList("ChartDAO.getPriceYearList");
	}

	public List<ChartVO> getMinMax(ChartVO vo) {
		return mybatis.selectList("ChartDAO.getMinMax", vo);
	}

	public int getSellerPrice(String id) {
		Object result = mybatis.selectOne("ChartDAO.getSellerPrice", id);
		
		if(result == null) {
			return 0;
		} else {
			return (int)result;
		}
	}

	public int getSellerOrders(String id) {
		Object result = mybatis.selectOne("ChartDAO.getSellerOrders", id);
		
		if(result == null) {
			return 0;
		} else {
			return (int)result;
		}
	}

	public int getSellerCount(String id) {
		Object result = mybatis.selectOne("ChartDAO.getSellerCount", id);
		
		if(result == null) {
			return 0;
		} else {
			return (int)result;
		}
	}

	public int getSellerReview(String id) {
		Object result = mybatis.selectOne("ChartDAO.getSellerReview", id);
		if(result == null) {
			return 0;
		} else {
			return (int)result;
		}
	}

	public List<ChartVO> getSellerPriceList(String id) {
		return mybatis.selectList("ChartDAO.getSellerPriceList", id);
	}

	public List<ChartVO> getSellerOrderList(String id) {
		return mybatis.selectList("ChartDAO.getSellerOrderList", id);
	}

	public List<ChartVO> getSellerItemList(String id) {
		return mybatis.selectList("ChartDAO.getSellerItemList", id);
	}

	public List<ChartVO> getSellerReviewList(String id) {
		return mybatis.selectList("ChartDAO.getSellerReviewList", id);
	}
}
