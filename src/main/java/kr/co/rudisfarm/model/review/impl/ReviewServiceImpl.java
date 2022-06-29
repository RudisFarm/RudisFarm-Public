package kr.co.rudisfarm.model.review.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.rudisfarm.model.review.ReviewService;
import kr.co.rudisfarm.model.review.ReviewVO;

@Service("ReviewService")
public class ReviewServiceImpl implements ReviewService{
	@Autowired
	ReviewDAO ReviewDAO;
	@Override
	public List<ReviewVO> getReviewList(HashMap<String, Object> map) {
		return ReviewDAO.getReviewList(map);
	}
	@Override
	public int getReviewListCount(HashMap<String, Object> map) {
		return ReviewDAO.getReviewListCount(map);
	}
	@Override
	public List<ReviewVO> getReviewListSeller(HashMap<String, Object> map) {
		return ReviewDAO.getReviewListSeller(map);
	}
	@Override
	public int getReviewListCountSeller(HashMap<String, Object> map) {
		return ReviewDAO.getReviewListCountSeller(map);
	}
	@Override
	public List<ReviewVO> getReviewListUser(HashMap<String, Object> map) {
		return ReviewDAO.getReviewListUser(map);
	}
	@Override
	public int getReviewListCountUser(HashMap<String, Object> map) {
		return ReviewDAO.getReviewListCountUser(map);
	}
	@Override
	public ReviewVO getReview(ReviewVO vo) {
		return ReviewDAO.getReview(vo);
	}
	@Override
	public void deleteReview(ReviewVO vo) {
		ReviewDAO.deleteReview(vo);
	}
	@Override
	public List<ReviewVO> getReviewListSeller(ReviewVO vo) {
		return ReviewDAO.getReviewListSeller(vo);
	}
	@Override
	public void insertReview(ReviewVO vo) {
		ReviewDAO.insertReview(vo);
	}
	@Override
	public List<ReviewVO> getReviewListUser(ReviewVO vo) {
		return ReviewDAO.getReviewListUser(vo);
	}
	@Override
	public List<ReviewVO> getReviewListProduct(ReviewVO vo) {
		return ReviewDAO.getReviewListProduct(vo);
	}
	@Override
	public List<ReviewVO> checkReview(ReviewVO vo) {
		return ReviewDAO.checkReview(vo);
	}
	@Override
	public void updateReview(ReviewVO vo) {
		ReviewDAO.updateReview(vo);
	}
}
