package kr.co.rudisfarm.controller.review;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.rudisfarm.model.commons.pagenation.ReviewPagenation;
import kr.co.rudisfarm.model.orders.OrdersService;
import kr.co.rudisfarm.model.orders.OrdersVO;
import kr.co.rudisfarm.model.product.ProductService;
import kr.co.rudisfarm.model.product.ProductVO;
import kr.co.rudisfarm.model.review.ReviewService;
import kr.co.rudisfarm.model.review.ReviewVO;

@Controller
public class BuyerReviewController {
	@Autowired
	ReviewService reviewService;
	@Autowired
	OrdersService ordersService;
//	@Autowired
//	UserService userService;
//	
	@Autowired
	ProductService productService;
//	@Autowired
//	BCryptPasswordEncoder pwEncoder;

//	@RequestMapping(value="/buyer-review", method=RequestMethod.GET)
//	public String buyerReview(Model model, ProductVO oVo, HttpSession session) {
//		System.out.println(oVo.getPRODUCT_ID());
//		model.addAttribute("orders", oVo);
////		if(oVo.getPRODUCT_ID()==0) {
////			return "/buyer/orders/my-orders";
////		} else {
//			return "/buyer/review/buyer-review";
////		}
//	}
	@RequestMapping(value = "/my-page/orders/buyer-review", method = RequestMethod.POST)
	@ResponseBody
	public Object testPut(@RequestBody HashMap<String, Object> jsonData, HttpServletRequest req, Model model, HttpSession session)throws ServletException, IOException {
		if(jsonData != null) {
			HashMap<String, Object> returnData = new HashMap<String, Object>();
			String USER_ID=(String)session.getAttribute("USER_ID");
			int PRODUCT_ID=Integer.parseInt((String)jsonData.get("product_id"));
			int ORDERS_ID=Integer.parseInt((String)jsonData.get("ORDERS_ID"));
			System.out.println(USER_ID);
			System.out.println(PRODUCT_ID);
			ReviewVO vo = new ReviewVO();
			vo.setUSER_ID(USER_ID);
			vo.setORDERS_ID(ORDERS_ID);
			vo.setPRODUCT_ID(PRODUCT_ID);
			List<ReviewVO> list = reviewService.checkReview(vo);
			System.out.println(list.size());
			if(list.size()==0) {
				System.out.println("리뷰 작성");
				returnData.put("result", "/rudisfarm/buyer-review/"+PRODUCT_ID+"?oId="+ORDERS_ID);
			} else {
				System.out.println("이미 작성함");
				int review_id=0;
				for(ReviewVO lists : list) {
					review_id=lists.getREVIEW_ID();
				}
				returnData.put("result", "/rudisfarm/my-page/orders");
				returnData.put("review_id", review_id);
			}
			return returnData;
		} else {
			System.out.println("실패");
			return null;
		}
	}

	@RequestMapping(value="/buyer-review/{PRODUCT_ID}", method=RequestMethod.GET)
	public String buyerReview(Model model, OrdersVO oVo, HttpSession session, @PathVariable int PRODUCT_ID, @RequestParam(value = "oId", required = true) int ORDERS_ID) {
		System.out.println(oVo.getPRODUCT_ID());
		oVo.setPRODUCT_ID(PRODUCT_ID);
		oVo.setORDERS_ID(ORDERS_ID);
		model.addAttribute("orders", oVo);
//		if(oVo.getPRODUCT_ID()==0) {
//			return "/buyer/orders/my-orders";
//		} else {
			return "/buyer/review/buyer-review";
//		}
	}
	
	@RequestMapping(value="/buyer-review", method=RequestMethod.POST)
	@ResponseBody
	public Object buyerAddReview(OrdersVO oVo, ReviewVO rVo, HttpSession session, MultipartHttpServletRequest mtf, HttpServletRequest req) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String path = req.getSession().getServletContext().getRealPath("/").concat("resources\\upload\\images\\review\\"+(String)session.getAttribute("USER_ID"));
		File folder = new File(path);
		if(!folder.exists()) {
			try {
				folder.mkdir();
				System.out.println((String)session.getAttribute("USER_ID")+"유저의 폴더가 생성되었습니다/");
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			System.out.println("이미 폴더가 생성되어 있습니다.");
		}
		int unique=1;
		List<MultipartFile> reviewImage = mtf.getFiles("reviewfiles");
		SimpleDateFormat format1 = new SimpleDateFormat ("MM-dd-yyyy");
		String fileName, extension, newFileName = "", files="";
		File ImageFile;
		if(reviewImage.get(0).getOriginalFilename().length() < 1) {
			System.out.println("설명사진이 없습니다.");
		} else {
			System.out.println("업로드한 이미지의 갯수 : " + reviewImage.size());
			for(int i=0; i<reviewImage.size(); i++) {
				if(i > 0) files = files + "/";
				fileName = reviewImage.get(i).getOriginalFilename();
				extension = fileName.substring(fileName.lastIndexOf("."),fileName.length());
				newFileName = format1.format(System.currentTimeMillis())+"-"+oVo.getORDERS_ID()+"-"+unique+extension; 
				
				ImageFile = new File(path+"\\"+newFileName);
				reviewImage.get(i).transferTo(ImageFile);
				files = files + newFileName;
				unique++;
			}
		}
		rVo.setUSER_ID((String)session.getAttribute("USER_ID"));
		rVo.setORDERS_ID(oVo.getORDERS_ID());
		rVo.setFILES(files);
		reviewService.insertReview(rVo);
		System.out.println(rVo.toString());
		
		int isReviewResult = ordersService.isReviewed(oVo.getORDERS_ID());
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		if(isReviewResult == 1) {
			map.put("resultCode", 1);
		} else {
			map.put("resultCode", 0);
		}
		

		return map;
	}
	
	@RequestMapping(value="/buyer-updatereview/{REVIEW_ID}", method=RequestMethod.POST)
	@ResponseBody
	public Object buyerUpdateReview(@PathVariable int REVIEW_ID ,OrdersVO oVo, ReviewVO rVo, HttpSession session, MultipartHttpServletRequest mtf, HttpServletRequest req) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String path = req.getSession().getServletContext().getRealPath("/").concat("resources\\upload\\images\\review\\"+(String)session.getAttribute("USER_ID"));
		File folder = new File(path);
		if(!folder.exists()) {
			try {
				folder.mkdir();
				System.out.println((String)session.getAttribute("USER_ID")+"유저의 폴더가 생성되었습니다/");
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			System.out.println("이미 폴더가 생성되어 있습니다.");
		}
		int unique=1;
		List<MultipartFile> reviewImage = mtf.getFiles("reviewfiles");
		SimpleDateFormat format1 = new SimpleDateFormat ("MM-dd-yyyy");
		String fileName, extension, newFileName = "", files="";
		File ImageFile;
		if(reviewImage.get(0).getOriginalFilename().length() < 1) {
			System.out.println("설명사진이 없습니다.");
		} else {
			System.out.println("업로드한 이미지의 갯수 : " + reviewImage.size());
			for(int i=0; i<reviewImage.size(); i++) {
				if(i > 0) files = files + "/";
				fileName = reviewImage.get(i).getOriginalFilename();
				extension = fileName.substring(fileName.lastIndexOf("."),fileName.length());
				newFileName = format1.format(System.currentTimeMillis())+"-"+oVo.getORDERS_ID()+"-"+unique+extension; 
				
				ImageFile = new File(path+"\\"+newFileName);
				reviewImage.get(i).transferTo(ImageFile);
				files = files + newFileName;
				unique++;
			}
		}
		rVo.setUSER_ID((String)session.getAttribute("USER_ID"));
		rVo.setFILES(files);
		rVo.setREVIEW_ID(REVIEW_ID);
		
//		reviewService.insertReview(rVo);
		reviewService.updateReview(rVo);
		System.out.println(rVo.toString());
		
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("resultCode", 1);

		return map;
	}
	
	@RequestMapping(value="/my-page/reviewlist", method=RequestMethod.GET)
	public String getReviewList(@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "sort", required = false, defaultValue = "WRITEDATE") String sort,
			Model model, HttpSession session) {
//		ReviewVO vo = new ReviewVO();
//		vo.setUSER_ID((String)session.getAttribute("USER_ID"));
//		List<ReviewVO> list = reviewService.getReviewListUser(vo);
//		List<ProductVO> plist= new ArrayList<ProductVO>();
//		
//		for(ReviewVO lists : list) {
//			ProductVO pvo = new ProductVO();
//			pvo.setPRODUCT_ID(lists.getPRODUCT_ID());
//			plist.add(productService.getProduct(pvo));
//		}
		
//		System.out.println(list.get(1));

//		System.out.println(plist);
		
		
		HashMap<String, Object> pageInfo = new HashMap<String, Object>();
		pageInfo.put("page", page);
		pageInfo.put("sort", sort);
		pageInfo.put("currentPage", (page - 1) * 10);
		pageInfo.put("limit", 10);
		pageInfo.put("USER_ID", session.getAttribute("USER_ID"));
		
		
		ProductVO pvo = new ProductVO();
		
		
		
		List<ReviewVO> reviewList = reviewService.getReviewListUser(pageInfo);
		for(int i = 0; i<reviewList.size(); i++) {
		pvo.setPRODUCT_ID(reviewList.get(i).getPRODUCT_ID());
		pvo=productService.getProduct(pvo);
		reviewList.get(i).setPRODUCT_NAME(pvo.getPRODUCT_NAME());
		}
		int listCount = reviewService.getReviewListCountUser(pageInfo);
		System.out.println("superAdminCancelPaymentList 리스트 카운트 : " + listCount);
		System.out.println("getSuperAdminCancelPaymentList 사이즈 : " + reviewList.size());
		ReviewPagenation reviewPagenation = new ReviewPagenation(reviewList, (int) pageInfo.get("page"), listCount, (String) pageInfo.get("keyword"),
				(String) pageInfo.get("sort"), (String) pageInfo.get("keywordType"));

		model.addAttribute("reviewPagenation", reviewPagenation);
		
//		model.addAttribute("plist", plist);
//		model.addAttribute("reviewlist", list);
		
		
//		int i = 0;
//		int productSum=0;
//		int sellerSum=0;
//		String productAvg="";
//		String sellerAvg="";
//		for(ReviewVO lists : list) {
//			i++;
//			productSum+=lists.getPRODUCT_RATING();
//			sellerSum+=lists.getSELLER_RATING();
//			productAvg = String.format("%.1f", productSum/(double)i);
//			sellerAvg = String.format("%.1f", sellerSum/(double)i);
//		}
//		model.addAttribute("reviewQuantity", list.size());
//		model.addAttribute("productRatingAvg", productAvg);
//		model.addAttribute("sellerRatingAvg", sellerAvg);
		return "/buyer/review/buyer-reviewlist";
	}
	
	@RequestMapping(value="/my-page/update-review/{REVIEW_ID}", method=RequestMethod.GET)
	public String getReview(Model model, HttpSession session, @PathVariable int REVIEW_ID) {
		ReviewVO vo = new ReviewVO();
		vo.setREVIEW_ID(REVIEW_ID);
		vo = reviewService.getReview(vo);
		model.addAttribute("orders", vo);
		System.out.println(vo.getUSER_ID());
		System.out.println((String)session.getAttribute("USER_ID"));
		if(!vo.getUSER_ID().equals(session.getAttribute("USER_ID"))) {
			return "/buyer/review/buyer-reviewlist";
		} else {
			return "/buyer/review/buyer-updatereview";
		}
	}
	
}
