package kr.co.rudisfarm.model.chart.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.rudisfarm.model.chart.ChartDAO;
import kr.co.rudisfarm.model.chart.ChartService;
import kr.co.rudisfarm.model.chart.ChartVO;

@Service("ChartService")
public class ChartImpl implements ChartService{

	@Autowired
	ChartDAO chartDAO;	
	
	@Override
	public List<ChartVO> getType2List(ChartVO vo) {
		return chartDAO.getType2List(vo);
	}

	@Override
	public List<ChartVO> getYearList() {
		return chartDAO.getYearList();
	}

	@Override
	public int getUserCount() {
		return chartDAO.getUserCount();
	}

	@Override
	public int getProductCount() {
		return chartDAO.getProductCount();
	}

	@Override
	public List<ChartVO> getProductYearList() {
		return chartDAO.getProductYearList();
	}

	@Override
	public int getOrderCount() {
		return chartDAO.getOrderCount();
	}

	@Override
	public List<ChartVO> getOrderYearList() {
		return chartDAO.getOrderYearList();
	}

	@Override
	public int getTotalPrice() {
		return chartDAO.getTotalPrice();
	}

	@Override
	public List<ChartVO> getPriceYearList() {
		return chartDAO.getPriceYearList();
	}

	@Override
	public List<ChartVO> getMinMax(ChartVO vo) {
		return chartDAO.getMinMax(vo);
	}

	@Override
	public int getSellerPrice(String id) {
		return chartDAO.getSellerPrice(id);
	}

	@Override
	public int getSellerOrders(String id) {
		return chartDAO.getSellerOrders(id);
	}

	@Override
	public int getSellerCount(String id) {
		return chartDAO.getSellerCount(id);
	}

	@Override
	public int getSellerReview(String id) {
		return chartDAO.getSellerReview(id);
	}

	@Override
	public List<ChartVO> getSellerPriceList(String id) {
		return chartDAO.getSellerPriceList(id);
	}

	@Override
	public List<ChartVO> getSellerOrderList(String id) {
		return chartDAO.getSellerOrderList(id);
	}

	@Override
	public List<ChartVO> getSellerItemList(String id) {
		return chartDAO.getSellerItemList(id);
	}

	@Override
	public List<ChartVO> getSellerReviewList(String id) {
		return chartDAO.getSellerReviewList(id);
	}
}
