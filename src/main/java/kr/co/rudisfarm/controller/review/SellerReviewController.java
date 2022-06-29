package kr.co.rudisfarm.controller.review;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.rudisfarm.model.commons.pagenation.ReviewPagenation;
import kr.co.rudisfarm.model.product.ProductService;
import kr.co.rudisfarm.model.product.ProductVO;
import kr.co.rudisfarm.model.review.ReviewService;
import kr.co.rudisfarm.model.review.ReviewVO;

@Controller

public class SellerReviewController {
	@Autowired
	ReviewService reviewService;
	@Autowired
	ProductService productService;
	
	@RequestMapping(value="/seller/seller-reviewlist-manage", method=RequestMethod.GET)
//	public String sellerReviewList(Model model, HttpSession session) {
//		System.out.println("id는"+session.getAttribute("USER_ID"));
//		ReviewVO vo = new ReviewVO();
//		vo.setUSER_ID((String)session.getAttribute("USER_ID"));
//		List<ReviewVO> list = reviewService.getReviewListSeller(vo);
//		System.out.println(list);
//		model.addAttribute("reviewList", list);
//		return "/seller/review/seller-reviewlist-manage";
//	}
	public String sellerReviewList(@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "keywordType", required = false, defaultValue = "") String keywordType,
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
			@RequestParam(value = "sort", required = false, defaultValue = "WRITEDATE") String sort,
			Model model, HttpSession session) {
//		String ok;
//		if(session.getAttribute("user")!=null) {
//		ok ="/admin/review/admin-reviewlist-manage";
		
		HashMap<String, Object> pageInfo = new HashMap<String, Object>();
		pageInfo.put("page", page);
		pageInfo.put("keywordType", keywordType);
		pageInfo.put("keyword", keyword);
		pageInfo.put("sort", sort);
		pageInfo.put("currentPage", (page - 1) * 10);
		pageInfo.put("limit", 10);
		pageInfo.put("USER_ID", session.getAttribute("USER_ID"));
		List<ReviewVO> reviewList = reviewService.getReviewListSeller(pageInfo);
		
		ProductVO pvo = new ProductVO();
		for(int i = 0; i<reviewList.size(); i++) {
		pvo.setPRODUCT_ID(reviewList.get(i).getPRODUCT_ID());
		pvo=productService.getProduct(pvo);
		reviewList.get(i).setPRODUCT_NAME(pvo.getPRODUCT_NAME());
		}
		
		int listCount = reviewService.getReviewListCountSeller(pageInfo);
		
		System.out.println("superAdminCancelPaymentList 리스트 카운트 : " + listCount);
		System.out.println("getSuperAdminCancelPaymentList 사이즈 : " + reviewList.size());
		
		ReviewPagenation reviewPagenation = new ReviewPagenation(reviewList, (int) pageInfo.get("page"), listCount, (String) pageInfo.get("keyword"),
				(String) pageInfo.get("sort"), (String) pageInfo.get("keywordType"));

		model.addAttribute("reviewPagenation", reviewPagenation);
		
//		for(int i=0; i<list.size();i++) {
//		System.out.println("값:"+ map.get("reviewList"));
//		System.out.println("REVIEW_ID:"+ list.get(i).getREVIEW_ID());
//		System.out.println("USER_ID:"+ list.get(i).getUSER_ID());
//		}
		
		return "/seller/review/seller-reviewlist-manage";
	}
	@RequestMapping(value="/seller/seller-review-manage/{review_id}", method=RequestMethod.GET)
	public String sellerReview(Model model, HttpSession session, @PathVariable int review_id) {
		ReviewVO vo = new ReviewVO();
		vo.setREVIEW_ID(review_id);
		vo = reviewService.getReview(vo);
		ProductVO pvo = new ProductVO();
		pvo.setPRODUCT_ID(vo.getPRODUCT_ID());
		pvo=productService.getProduct(pvo);
		vo.setPRODUCT_NAME(pvo.getPRODUCT_NAME());
		model.addAttribute("review", vo);
		return "/seller/review/seller-review-manage";
	}
}
