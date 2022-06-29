package kr.co.rudisfarm.model.review.impl;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.rudisfarm.model.review.ReviewVO;

@Repository("ReviewDAO")
public class ReviewDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<ReviewVO> getReviewList(HashMap<String, Object> map) {
		System.out.println("ReviewList 가져오기");
		return mybatis.selectList("ReviewDAO.getReviewList", map);
	}
	public int getReviewListCount(HashMap<String, Object> map) {
		System.out.println("ReviewListCount 가져오기");
		return mybatis.selectOne("ReviewDAO.getReviewListCount", map);
	}
	public List<ReviewVO> getReviewListSeller(HashMap<String, Object> map) {
		System.out.println("ReviewListSeller 가져오기");
		return mybatis.selectList("ReviewDAO.getReviewListSeller", map);
	}
	public int getReviewListCountSeller(HashMap<String, Object> map) {
		System.out.println("ReviewListCountSeller 가져오기");
		return mybatis.selectOne("ReviewDAO.getReviewListCountSeller", map);
	}
	public List<ReviewVO> getReviewListUser(HashMap<String, Object> map) {
		System.out.println("ReviewListUser 가져오기");
		return mybatis.selectList("ReviewDAO.getReviewListUser", map);
	}
	public int getReviewListCountUser(HashMap<String, Object> map) {
		System.out.println("ReviewListCountUser 가져오기");
		return mybatis.selectOne("ReviewDAO.getReviewListCountUser", map);
	}
	public ReviewVO getReview(ReviewVO vo) {
		System.out.println("Review 가져오기");
		return mybatis.selectOne("ReviewDAO.getReview", vo);
	}
	public void deleteReview(ReviewVO vo) {
		System.out.println("Review 삭제하기");
		mybatis.delete("ReviewDAO.deleteReview", vo);
	}
	public List<ReviewVO> getReviewListSeller(ReviewVO vo) {
		System.out.println("Seller용 ReviewList 가져오기");
		return mybatis.selectList("ReviewDAO.getReviewListSeller", vo);
	}
	public void insertReview(ReviewVO vo) {
		System.out.println("Review 등록하기");
		mybatis.insert("ReviewDAO.insertReview", vo);
	}
	public List<ReviewVO> getReviewListUser(ReviewVO vo) {
		System.out.println("내가 작성한 ReviewList 가져오기");
		return mybatis.selectList("ReviewDAO.getReviewListUser", vo);
	}
	public List<ReviewVO> getReviewListProduct(ReviewVO vo) {
		System.out.println("상품의 ReviewList 가져오기");
		return mybatis.selectList("ReviewDAO.getReviewListProduct", vo);
	}
	public List<ReviewVO> checkReview(ReviewVO vo) {
		System.out.println("리뷰 썼는지 체크");
		return mybatis.selectList("ReviewDAO.checkReview", vo);
	}
	public void updateReview(ReviewVO vo) {
		System.out.println("Review 수정하기");
		mybatis.update("ReviewDAO.updateReview", vo);
	}
}
