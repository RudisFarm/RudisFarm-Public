package kr.co.rudisfarm.controller.orders;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import kr.co.rudisfarm.model.commons.pagenation.OrdersPagenation;
import kr.co.rudisfarm.model.orders.OrdersService;
import kr.co.rudisfarm.model.orders.OrdersVO;
import kr.co.rudisfarm.model.payment.PaymentService;
import kr.co.rudisfarm.model.product.ProductService;
import kr.co.rudisfarm.model.product.ProductVO;

@Controller
public class BuyerOrdersController {

	@Autowired
	OrdersService ordersService;
	
	@Autowired
	ProductService productService;

	@Autowired
	PaymentService paymentService;
	// 유저 목록 페이지 이동
	@RequestMapping(value = "/my-page/orders", method = RequestMethod.GET)
	public String getBuyerOrdersListForm(@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
			@RequestParam(value = "type1", required = false, defaultValue = "") String type1,
			@RequestParam(value = "type2", required = false, defaultValue = "") String type2,
			@RequestParam(value = "sort", required = false, defaultValue = "ORDERSDATE") String sort,
			@RequestParam(value = "status", required = false, defaultValue = "1") int status,
			@RequestParam(value = "keywordType", required = false, defaultValue = "ORDERS_NAME") String keywordType,
			HttpSession session, Model model) {

		Map<String, Object> map = new HashMap<String, Object>();

		System.out.println(keywordType);

		int limit = 10;
		map.put("user", "유저");
		map.put("user_id", (String)session.getAttribute("USER_ID"));
		map.put("keyword", keyword);
		map.put("page", page);
		map.put("currentPage", (page - 1) * limit);
		map.put("type1", type1);
		map.put("type2", type2);
		map.put("sort", sort);
		map.put("status", status);
		map.put("limit", limit);
		map.put("keywordType", keywordType);

		List<Object> ordersList = ordersService.getBuyerOrdersList(map);
		int listCount = ordersService.getBuyerOrdersListCount(map);

		OrdersPagenation pagenation = new OrdersPagenation(ordersList, (int) map.get("page"), listCount,
				(int) map.get("limit"), (String) map.get("keyword"), null, null, sort);

		List<ProductVO> pList = new ArrayList<ProductVO>();
		for(Object orders : ordersService.getBuyerOrdersList(map)) {
			ProductVO findPVO = new ProductVO();
			findPVO.setPRODUCT_ID(((OrdersVO)orders).getPRODUCT_ID());
			ProductVO pVO = productService.getProduct(findPVO);
			pList.add(pVO);
		}
		
		model.addAttribute("pList", pList);
		model.addAttribute("ordersPagenation", pagenation);
		model.addAttribute("status", status);

		return "/buyer/orders/my-orders";
	}

	/* @Autowired */
	/* Orders_DetailService orders_detailService; */

	// 유저 주문목록 리스트 조회
//	@RequestMapping(value = "/my-page/orders", method = RequestMethod.GET)
//	public String buyerOrdersList(HttpSession session, Model model) {
//		OrdersVO vo = new OrdersVO();
//		vo.setUSER_ID((String)session.getAttribute("USER_ID"));
//		model.addAttribute("buyerOrdersList", ordersService.getBuyerOrdersList(vo));
//
//		return "/buyer/orders/my-orders";
//	}

	// 유저 주문상세내역
	@RequestMapping(value = "/my-page/orders/{ORDERS_ID}", method = RequestMethod.GET)
	public String buyerOrdersDetail(@PathVariable int ORDERS_ID, Model model, HttpServletRequest request,
			OrdersVO getOrdersDetail) throws Exception {
		HttpSession session = request.getSession();
		session.getAttribute("getOrdersDetail");
		OrdersVO targetOrders = new OrdersVO();
		targetOrders.setORDERS_ID(ORDERS_ID);
		OrdersVO getorders = ordersService.getOrders(targetOrders);
		
		if(!((String)session.getAttribute("USER_ID")).equals(getorders.getUSER_ID())) {
			return "redirect:/my-page/orders";
		}
		
		String tid = paymentService.getTIDfrompartnerID(getorders.getORDERS_NAME());
		ProductVO tartgetProduct = new ProductVO();
		tartgetProduct.setPRODUCT_ID(getorders.getPRODUCT_ID());

		model.addAttribute("getorders", getorders);
		model.addAttribute("tid", tid);
		model.addAttribute("getsellerinfo", ordersService.getSellerInfo(getorders));
		model.addAttribute("product", productService.getProduct(tartgetProduct));

		return "/buyer/orders/my-orders-detail";
	}
	
	@RequestMapping(value = "/my-page/orders/{ORDERS_ID}", method = RequestMethod.PUT)
	@ResponseBody
	public Object updateOrdersBuyFinish(@PathVariable int ORDERS_ID, @RequestBody HashMap<String, Object> jsonData) {
		
		if(ordersService.updateOrders(ORDERS_ID, (String)jsonData.get("STATUS")) == 1) {
			return true;
		} else {
			return false;
		}
	}

	// 등록된 상품 삭제 기능 *ajax
	@RequestMapping(value = "/my-page/orders/{ORDERS_ID}", method = RequestMethod.DELETE)
	@ResponseBody
	public Object deleteOrders(@PathVariable int ORDERS_ID) {

		OrdersVO ordersVO = new OrdersVO();
		ordersVO.setORDERS_ID(ORDERS_ID);
		
		int result = ordersService.deleteOrders(ORDERS_ID);

		if (result > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	// 유저 반품/교환 신청 페이지

	@RequestMapping(value = "/my-page/my-exchange-and-cancel/{ORDERS_ID}", method = RequestMethod.GET)
	public String exchangeCancel(Model model, @PathVariable int ORDERS_ID) {

		OrdersVO vo = new OrdersVO();
		
		vo.setORDERS_ID(ORDERS_ID);
		
		System.out.println(vo.toString());
		model.addAttribute("exchangeCancel", ordersService.exchangeCancel(vo));
		
		return "/buyer/orders/my-exchange-and-cancel";
	}

	// 교환신청 기능 *ajax
	@RequestMapping(value = "/my-page/my-exchange-and-cancel/{ORDERS_ID}", method = RequestMethod.PUT)
	@ResponseBody
	public Object exchangeNcancelOrders(@PathVariable int ORDERS_ID, @RequestBody HashMap<String, String> jsonData) {
		
	
		
		OrdersVO ordersVO = new OrdersVO();
		ordersVO.setORDERS_ID(ORDERS_ID);
		ordersVO.setEXCHANGE_MESSAGE(jsonData.get("msg"));
		System.out.println(jsonData.get("msg") + "사유!");
		int result = 0;
		System.out.println("구매자 교환반품 데이터 체크 : " + jsonData.get("code"));
		
		if(jsonData.get("code").equals("교환")) {
			result = ordersService.exchangeOrders(ordersVO);
		} else if(jsonData.get("code").equals("반품")) {
			result = ordersService.cancelOrders(ordersVO);
		} 
		
		
		if(result > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	

	// 반품신청 기능 *ajax
//	@RequestMapping(value = "/my-page/my-exchange-and-cancel/{ORDERS_ID}", method = RequestMethod.GET)
//	@ResponseBody
//	public Object cancelOrders(@PathVariable int ORDERS_ID) {
//		
//	
//		OrdersVO ordersVO = new OrdersVO();
//		ordersVO.setORDERS_ID(ORDERS_ID);
//		int result = ordersService.cancelOrders(ORDERS_ID);
//		
//		if(result > 0) {
//			return true;
//		} else {
//			return false;
//		}
//	}
	
}

// 유저 상세 결제 정보 표시(선택한 Orders와 그와 연관된 Orders_detail들을 표시)
/*
 * @RequestMapping(value = "/my-page/orders/{ORDERS_NAME}", method =
 * RequestMethod.GET) public String orders_detailList(@PathVariable String
 * ORDERS_NAME, Model model) { Orders_DetailVO vo = new Orders_DetailVO(); //
 * vo.setORDERS_ID(Integer.parseInt(ORDERS_ID)); vo.setORDERS_NAME(ORDERS_NAME);
 * 
 * String url; List<Orders_DetailVO> orders_detailList =
 * orders_detailService.getOrders_DetailList(vo);
 * 
 * if (orders_detailList != null) { // 가져온 상품이 있으면,
 * model.addAttribute("orders_detailList", orders_detailList); url =
 * "/buyer/orders/my-orders-detail"; } else { // 가져온 상품이 없으면, 목록을 다시 가져와서 목록 뷰로
 * 이동 url = "redirect:/buyer/orders/my-orders"; }
 * 
 * return url ; }
 */

/*
 * @RequestMapping(value = "/orders/{ORDERS_ID}", method = RequestMethod.GET)
 * public String ordersList(@PathVariable String ORDERS_ID, Model model) {
 * OrdersVO vo = new OrdersVO(); vo.setORDERS_ID(Integer.parseInt(ORDERS_ID));
 * 
 * String url; OrdersVO orders = ordersService.getOrders(vo);
 * 
 * if(orders != null) { // 가져온 상품이 있으면, model.addAttribute("orders", orders);
 * url = "/buyer/orders/my-orders_detail"; } else { // 가져온 상품이 없으면, 목록을 다시 가져와서
 * 목록 뷰로 이동 url = "redirect:/orders"; // 리다이렉트로 URL 바꾸는 방법을 알아보기 }
 * 
 * return url;
 * 
 * }
 */
/*
 * // 주문
 * 
 * @RequestMapping(value = "/cartList", method = RequestMethod.POST) public void
 * orders(HttpSession session, OrdersVO orders, Orders_DetailVO orders_detail)
 * throws Exception { // logger.info("orders");
 * 
 * UserVO user= (UserVO)session.getAttribute("user"); String USER_ID =
 * user.getUSER_ID();
 * 
 * ordersService.ordersInfo(orders);
 * orders_detailService.orders_detailInfo(orders_detail);
 */
