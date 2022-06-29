package kr.co.rudisfarm.controller.product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.annotation.SessionAttributes;

import kr.co.rudisfarm.model.cart.CartService;
import kr.co.rudisfarm.model.cart.CartVO;
import kr.co.rudisfarm.model.chart.ChartService;
import kr.co.rudisfarm.model.chart.ChartVO;
import kr.co.rudisfarm.model.commons.pagenation.Pagenation;
import kr.co.rudisfarm.model.product.ProductService;
import kr.co.rudisfarm.model.product.ProductTypeService;
import kr.co.rudisfarm.model.product.ProductTypeVO;
import kr.co.rudisfarm.model.product.ProductVO;
import kr.co.rudisfarm.model.review.ReviewService;
import kr.co.rudisfarm.model.review.ReviewVO;
import kr.co.rudisfarm.model.user.UserService;
import kr.co.rudisfarm.model.user.UserVO;

@Controller
@SessionAttributes({"USER_ID", "EMAIL", "NAME"})
public class BuyerProductController {
	
	@Autowired
	ProductService productService;
	
	@Autowired
	ReviewService reviewService;
	
	@Autowired
	CartService cartService;
	
	@Autowired
	ProductTypeService productTypeService;

	@Autowired
	ChartService chartService;
	
	@Autowired
	UserService userSerivce;
	
	// 상품 리스트 페이징
	@RequestMapping(value = "/product", method = RequestMethod.GET)
	public String productList(@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
			@RequestParam(value = "type1", required = false, defaultValue = "") String type1,
			@RequestParam(value = "type2", required = false, defaultValue = "") String type2,
			@RequestParam(value = "sort", required = false, defaultValue = "INPUTDATE") String sort, Model model,
			HttpSession session) {
		
		String id = (String)session.getAttribute("USER_ID");
		Map<String, Object> map = new HashMap<String, Object>();
		
		int limit=12;
		map.put("user", "구매자");
		map.put("keyword", keyword);
		map.put("page", page);
		map.put("currentPage", (page - 1) * limit);
		map.put("type1", type1);
		map.put("type2", type2);
		map.put("sort", sort);
		map.put("limit",limit);
		
		List<Object> productList = productService.getProductList(map);
		int listCount = productService.getProductListCount(map);
		
		Pagenation pagenation = new Pagenation(productList, (int) map.get("page"), listCount, (int) map.get("limit"),
				(String) map.get("keyword"), (String) map.get("type1"), (String) map.get("type2"),
				(String) map.get("sort"));
		
		List<ProductTypeVO> productType = productTypeService.getProductType1();
		for(int i=6; i < productType.size(); i++) {
			productType.remove(i);
		}
		map.put("productTypeList", productType); 	
		
		//장바구니
		CartVO vo = new CartVO();
		vo.setUSER_ID(id);
		int sumMoney=cartService.sumMoney(id); 
		List<CartVO> list=cartService.getCartList(vo);
		map.put("list", list);			//장바구니 목록
		map.put("count", list.size()); 	//레코드 갯수
		map.put("sumMoney", sumMoney); 	//전체 금액
		
		model.addAttribute("map", map);
		model.addAttribute("productPagenation", pagenation);
		
		return "/buyer/product/product-list";
	}
	
	// 상품 상세보기
	@RequestMapping(value = "/product/{PRODUCT_ID}", method = RequestMethod.GET)
	public String productList(@PathVariable String PRODUCT_ID, 
			@RequestParam(defaultValue = "1" ,required = false) String page,
			@RequestParam(defaultValue = "f", required = false) String cfr,
			Model model,
			HttpSession session) {
		String id = (String)session.getAttribute("USER_ID");
		
		ProductVO pVO = new ProductVO();
		CartVO vo = new CartVO();
		ChartVO chartVO = new ChartVO();
		vo.setUSER_ID(id);
		
		int intPRODUCT_ID;
		try {
			intPRODUCT_ID = Integer.parseInt(PRODUCT_ID);
		} catch (NumberFormatException e) {
			System.out.println("문자열 변환 오류 발생");
			intPRODUCT_ID = -1;
		}
		pVO.setPRODUCT_ID(intPRODUCT_ID);

		String url;
		ProductVO product = productService.getProduct(pVO);
		
		if (product != null) { // 가져온 상품이 있으면,
			
			chartVO.setTYPE2(product.getTYPE2());
			List<ChartVO> minMaxList = chartService.getMinMax(chartVO);
			
			Map<String, Object> minMax = new HashMap<String, Object>();
			minMax.put("tpye2", minMaxList.get(0).getTYPE2());
			minMax.put("min", minMaxList.get(0).getMIN());
			minMax.put("max", minMaxList.get(0).getMAX());
			model.addAttribute("minMax", minMax);

			System.out.println(product.getUSER_ID());
			
			if(productService.checkSellerStatus(product.getUSER_ID()) == 1 ) { //상태가 승인이고 갯수가 있는경우 && product.getCOUNT() > 0
				productService.updateProductViewCount(product.getPRODUCT_ID());
				UserVO userVO = userSerivce.getUserByID(product.getUSER_ID());
				
				//장바구니
				Map<String, Object> map = new HashMap<String, Object>();
				vo.setUSER_ID(id);
				int sumMoney=cartService.sumMoney(id); 
				List<CartVO> list=cartService.getCartList(vo);
				map.put("list", list);			//장바구니 목록
				map.put("count", list.size()); 	//레코드 갯수
				map.put("sumMoney", sumMoney); 	//전체 금액
				
				if (!product.getFILES().equals("")) {
					String[] files = product.getFILES().split("/");
					model.addAttribute("descFiles", files);
				}
				List<ProductTypeVO> productType = productTypeService.getProductType1();
				for(int i=6; i < productType.size(); i++) {
					productType.remove(i);
				}
				map.put("productTypeList", productType); 
				
				product.setDESCRIPTION(product.getDESCRIPTION().replace("\r\n", "<br>"));
				
	//			model.addAttribute("map", map);
				model.addAttribute("product", product);
				model.addAttribute("user", userVO);
				
				ReviewVO rvo = new ReviewVO();
				rvo.setPRODUCT_ID(intPRODUCT_ID);
				List<ReviewVO> rlist = reviewService.getReviewListProduct(rvo);
				model.addAttribute("reviewlist", rlist);
				int i = 0;
				int productSum=0;
				int sellerSum=0;
				String productAvg="";
				String sellerAvg="";
				for(ReviewVO lists : rlist) {
					i++;
					productSum+=lists.getPRODUCT_RATING();
					sellerSum+=lists.getSELLER_RATING();
					
					System.out.println(productSum +"," + sellerSum);
					productAvg = String.format("%.1f", productSum/(double)i);
					sellerAvg = String.format("%.1f", sellerSum/(double)i);
					
					System.out.println(productAvg +"," + sellerAvg);
				}
				model.addAttribute("reviewQuantity", rlist.size());
				model.addAttribute("productRatingAvg", productAvg);
				model.addAttribute("sellerRatingAvg", sellerAvg);
				model.addAttribute("cfr", cfr);
				
				url = "/buyer/product/product-detail";
				
			} else { // 판매자의 상태가 1이 아닌 경우
				int num = productService.checkSellerStatus(product.getUSER_ID());
				System.out.println(num);
				url = "redirect:/product";
			}
		} else { // 가져온 상품이 없으면, 목록을 다시 가져와서 목록 뷰로 이동
			url = "redirect:/product"; // 리다이렉트로 URL 바꾸는 방법을 알아보기
		}
		
		return url;
	}
	
	@RequestMapping(value = "/product/count", method = RequestMethod.POST)
	@ResponseBody
	public Object getProductCount(@RequestBody HashMap<String, Object> jsonData) {
		ProductVO pVo = new ProductVO();
		pVo.setPRODUCT_ID((int)jsonData.get("PRODUCT_ID"));
		ProductVO resultPVo = productService.getProduct(pVo);
		
		System.out.println((String)jsonData.get("COUNT"));
		
		if(resultPVo.getCOUNT() - Integer.parseInt((String)jsonData.get("COUNT")) >= 0) {
			return true;
		} else {
			return false;
		}
	}

	// 프리미엄 상품 6개 띄워주기
	@RequestMapping(value = "/product-randomlist", method = RequestMethod.POST)
	@ResponseBody
	public Object getProductRandomList() {
		List<ProductVO> list = productService.getProductRandomList();
		int result=0;
		
		for(ProductVO pVo : list) {
			if(pVo.getPRODUCT_NAME().length() > 9) {
				pVo.setPRODUCT_NAME(pVo.getPRODUCT_NAME().substring(0, 8)+"...");
			}
		}
		
		for(int i=0; i < list.size(); i++) {
			result=productService.updatePrimiumCount(list.get(i).getUSER_ID());
			System.out.println();
			System.out.println("실행 결과 : "+result);
		}
		
		return list;
	}
	
	// 랜덤상품 상품 5개 띄워주기
	@RequestMapping(value = "/product-randomlistside", method = RequestMethod.POST)
	@ResponseBody
	public Object getProductRandomListSide() {
		List<ProductVO> list = productService.getProductRandomListSide();
		
		for(ProductVO pVo : list) {
			if(pVo.getPRODUCT_NAME().length() > 9) {
				pVo.setPRODUCT_NAME(pVo.getPRODUCT_NAME().substring(0, 8)+"...");
			}
		}
		
		return list;
	}
	
	//판매자의 다른상품
	@RequestMapping(value = "/product-orderlist", method = RequestMethod.POST)
	@ResponseBody
	public Object getProductorderList(@RequestBody HashMap<String, Object> map) {
		List<ProductVO> list = productService.getProductOrderList((String) map.get("USER_ID"));
		System.out.println("판매자의 다른상품 실행 id :"+(String) map.get("USER_ID"));
		
		for(ProductVO pVo : list) {
			if(pVo.getPRODUCT_NAME().length() > 9) {
				pVo.setPRODUCT_NAME(pVo.getPRODUCT_NAME().substring(0, 8)+"...");
			}
		}
		
		int result=0;
		for(int i=0; i < list.size(); i++) {
			result=productService.updatePrimiumCount(list.get(i).getUSER_ID());
			System.out.println("실행 결과 : "+result);
		}
		
		return list;
	}
	
}
