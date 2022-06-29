package kr.co.rudisfarm.model.review;

import java.util.HashMap;
import java.util.List;

public interface ReviewService {
	public List<ReviewVO> getReviewList(HashMap<String, Object> map);
	public int getReviewListCount(HashMap<String, Object> map);
	public List<ReviewVO> getReviewListSeller(HashMap<String, Object> map);
	public int getReviewListCountSeller(HashMap<String, Object> map);
	public List<ReviewVO> getReviewListUser(HashMap<String, Object> map);
	public int getReviewListCountUser(HashMap<String, Object> map);
	public ReviewVO getReview(ReviewVO vo);
	public void deleteReview(ReviewVO vo);
	public List<ReviewVO> getReviewListSeller(ReviewVO vo);
	public void insertReview(ReviewVO vo);
	public List<ReviewVO> getReviewListUser(ReviewVO vo);
	public List<ReviewVO> getReviewListProduct(ReviewVO vo);
	public List<ReviewVO> checkReview(ReviewVO vo);
	public void updateReview(ReviewVO vo);
}
