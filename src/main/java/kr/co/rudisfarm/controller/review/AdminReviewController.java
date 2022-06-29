package kr.co.rudisfarm.controller.review;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.rudisfarm.model.commons.pagenation.ReviewPagenation;
import kr.co.rudisfarm.model.product.ProductService;
import kr.co.rudisfarm.model.product.ProductVO;
import kr.co.rudisfarm.model.review.ReviewService;
import kr.co.rudisfarm.model.review.ReviewVO;

@Controller

public class AdminReviewController {
	@Autowired
	ReviewService reviewService;
	@Autowired
	ProductService productService;
	
	@RequestMapping(value = "/admin/admin-reviewlist-manage", method = RequestMethod.GET)
	public String reviewList(@RequestParam(value = "page", required = false, defaultValue = "1") int page,
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
		
		List<ReviewVO> reviewList = reviewService.getReviewList(pageInfo);
		
		ProductVO pvo = new ProductVO();
		for(int i = 0; i<reviewList.size(); i++) {
		pvo.setPRODUCT_ID(reviewList.get(i).getPRODUCT_ID());
		pvo=productService.getProduct(pvo);
		reviewList.get(i).setPRODUCT_NAME(pvo.getPRODUCT_NAME());
		}
		
		int listCount = reviewService.getReviewListCount(pageInfo);
		
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
		
		return "/admin/review/admin-reviewlist-manage";
//		}
//		else {
//			System.out.println("로그인필요");
//			return "redirect:/admin-login";
//		}
	}
	
	@RequestMapping(value = "/admin/admin-review-manage/{number}", method = RequestMethod.GET)
	public String review(Model model, HttpSession session, @PathVariable int number) {
//		String ok;
//		if(session.getAttribute("user")!=null) {
//		ok ="/admin/review/admin-review-manage";
		System.out.println(number);
		model.addAttribute("name", number);
		ReviewVO vo = new ReviewVO();
		vo.setREVIEW_ID(number);
		vo = reviewService.getReview(vo);
		ProductVO pvo = new ProductVO();
		pvo.setPRODUCT_ID(vo.getPRODUCT_ID());
		pvo=productService.getProduct(pvo);
		vo.setPRODUCT_NAME(pvo.getPRODUCT_NAME());
		model.addAttribute("review", vo);
		return "/admin/review/admin-review-manage";
//		}
//		else {
//			System.out.println("로그인필요");
//			return "redirect:/admin-login";
//		}
	}

	@RequestMapping(value = "/admin/admin-review-manage/admin-deleteReview/ajax", method = RequestMethod.DELETE)
	@ResponseBody
	public Object deleteReview (@RequestBody HashMap<String, Object> jsonData) throws ServletException, IOException {
		if(jsonData != null) {
			ReviewVO vo = new ReviewVO();
			HashMap<String, Object> returnData = new HashMap<String, Object>();
			returnData.put("result", "success");
			vo.setREVIEW_ID(Integer.parseInt((String)jsonData.get("NO")));
			reviewService.deleteReview(vo);
			return returnData;
		} else {
			System.out.println("데이터가 존재안함.");
			return null;
		}
	}
}
