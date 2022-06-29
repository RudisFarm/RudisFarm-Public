package kr.co.rudisfarm.model.chart;

import java.util.List;

import kr.co.rudisfarm.model.cart.CartVO;

public interface ChartService {
	public List<ChartVO> getType2List(ChartVO vo);
	public List<ChartVO> getYearList();
	public int getUserCount();
	public int getProductCount();
	public List<ChartVO> getProductYearList();
	public int getOrderCount();
	public List<ChartVO> getOrderYearList();
	public int getTotalPrice();
	public List<ChartVO> getPriceYearList();
	public List<ChartVO> getMinMax(ChartVO vo);
	public int getSellerPrice(String id);
	public int getSellerOrders(String id);
	public int getSellerCount(String id);
	public int getSellerReview(String id);
	public List<ChartVO> getSellerPriceList(String id);
	public List<ChartVO> getSellerOrderList(String id);
	public List<ChartVO> getSellerItemList(String id);
	public List<ChartVO> getSellerReviewList(String id);

}
