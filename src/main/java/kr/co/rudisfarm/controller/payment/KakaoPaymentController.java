package kr.co.rudisfarm.controller.payment;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.rudisfarm.model.cart.CartService;
import kr.co.rudisfarm.model.cart.CartVO;
import kr.co.rudisfarm.model.orders.OrdersService;
import kr.co.rudisfarm.model.orders.OrdersVO;
import kr.co.rudisfarm.model.payment.KakaoService;
import kr.co.rudisfarm.model.payment.PaymentService;
import kr.co.rudisfarm.model.payment.apivo.KakaoPayApprovalAPIVO;
import kr.co.rudisfarm.model.payment.apivo.KakaoPayCancelAPIVO;
import kr.co.rudisfarm.model.product.ProductService;
import kr.co.rudisfarm.model.product.ProductVO;
import kr.co.rudisfarm.model.user.UserService;
import kr.co.rudisfarm.model.user.UserVO;

@Controller
public class KakaoPaymentController {
	
	private static final Logger logger = LoggerFactory.getLogger(KakaoPaymentController.class);
	
	@Autowired
	private KakaoService kakaoService;
	
	@Autowired
	private PaymentService paymentService;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private OrdersService ordersService;
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private UserService userService;

	// 임시 결제 페이지
	@RequestMapping(value = "/payment/payment-get", method = RequestMethod.GET)
	public String paymentget() {
		
		return "buyer/wrongapproach";
	}
	
	// 상품 결제하기
	@RequestMapping(value = "/orders-payment", method = RequestMethod.POST)
	public String orders(@ModelAttribute ProductVO pVO, @ModelAttribute CartVO cVO, Model model, HttpSession session) {
		String url = "/buyer/user/login";
		String id = (String)session.getAttribute("USER_ID");
		
		int cart_id = cVO.getCART_ID();
		System.out.println("장바구니 번호 : "+cart_id);
		
		//아이디가 있을경우
		if(id != null) {
			//장바구니에서 구매를 했을때
			if(cart_id > 0) {
				cVO = cartService.getCart(cVO);
				pVO.setPRODUCT_ID(cVO.getPRODUCT_ID());
				pVO = productService.getProduct(pVO);
				
				//장바구니 구매 수량
				pVO.setCOUNT(cVO.getCOUNT());
				
				model.addAttribute("user", userService.buyerDetail(id));
				model.addAttribute("product",pVO);
				url = "/buyer/payment/payment";
				
			//상품 상세보기에서 구매를 했을때
			} else {
				ProductVO productVO = new ProductVO();
				productVO = productService.getProduct(pVO);
				productVO.setCOUNT(pVO.getCOUNT());
				
				model.addAttribute("user", userService.buyerDetail(id));
				model.addAttribute("product",productVO);
				url = "/buyer/payment/payment";
			}
		} 
		return url;
	}
	
	// 카카오페이 결제 준비 단계
	@RequestMapping(value = "/payment/kakaopay", method = RequestMethod.POST)
	@ResponseBody
	public Object kakaoPay(@RequestBody HashMap<String, Object> jsonData, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		String userId;
		
		userId = (String) session.getAttribute("USER_ID");
		
		if(jsonData != null) {
			System.out.println("값이 넘어왔습니다.");
			
			List<HashMap<String, Object>> jsonList = (List<HashMap<String, Object>>)jsonData.get("test");

			for(int i=0; i<jsonList.size(); i++) {
				HashMap<String, Object> jsonProduct = ((HashMap<String, Object>)jsonList.get(i));
				System.out.println(jsonProduct.get("product_id"));
				System.out.println((String)jsonProduct.get("item_name"));
				System.out.println((String)jsonProduct.get("quantity"));
				System.out.println((String)jsonProduct.get("total_amount"));
			}
		}

//			List<HashMap<String, Object>> jsonList = (List<HashMap<String, Object>>)jsonData.get("list");
//			
//			HashMap<String, Object> jsonProduct = (HashMap<String, Object>)jsonList.get("1");
//			String item_name = (String)jsonProduct.get("item_name");
//		}
		
		HashMap<String, Object> resultJson = new HashMap<String, Object>();
		resultJson.put("resultUrl", kakaoService.kakaoPayReady(jsonData, userId, request));
		
		return resultJson;
		
//		return "redirect:" + kakaoService.kakaoPayReady(/*jsonData, user_id*/);
	}
	
	// 결제 성공 맵핑
	@RequestMapping(value = "/payment/kakaoPaySuccess", method = RequestMethod.GET)
	public String kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model, RedirectAttributes rttr, HttpServletRequest request, HttpSession session) throws Exception {
		String userId = (String)request.getSession().getAttribute("USER_ID");
		
//		KakaoPayApprovalAPIVO kakaoApprovalVO = kakaoService.kakaoPayInfo(pg_token, userId);
		
		HashMap<String, Object> kakaoPayInfoResult = kakaoService.kakaoPayInfo(pg_token, userId);
		
		
		if(kakaoPayInfoResult == null) {
			return "buyer/payment-fail";
		} else {
			KakaoPayApprovalAPIVO kakaoApprovalVO = (KakaoPayApprovalAPIVO)kakaoPayInfoResult.get("kakaoPayApprovalAPIVO");
			OrdersVO orderInfo = (OrdersVO)kakaoPayInfoResult.get("orderInfo");
			orderInfo.setORDERS_NAME(kakaoApprovalVO.getPartner_order_id());
			
			ProductVO pVo = new ProductVO();
			pVo.setPRODUCT_ID(orderInfo.getPRODUCT_ID());
			pVo.setCOUNT(-kakaoApprovalVO.getQuantity());
			
//			System.out.println(">>>>>>>>>>>>"+orderInfo.toString());
			
			int resultNum = paymentService.insertPayment(kakaoApprovalVO); // 결제 테이블에 결제 기록
			int ordersNum = ordersService.insertOrders(orderInfo);// 주문 테이블에 주문 기록
			int productUpdatResultNum = productService.updateProductCount(pVo);// 상품 테이블에 재고 갱신

			System.out.println("디비에 vo 변환해서 삽입한 결과 갯수는? : " + resultNum);
			System.out.println("디비에 vo 변환해서 삽입한 결과 갯수는? : " + ordersNum);
			
			rttr.addFlashAttribute("kakaoApprovalVO", kakaoApprovalVO);
		}
		
		return "redirect:payment-result";
	}
	

	// 결제 취소 맵핑
	@RequestMapping(value = "/payment/kakaopaycancel", method = RequestMethod.POST)
	@ResponseBody
	public Object kakaoPayCancel(@RequestBody HashMap<String, Object> jsonData, Model model) throws Exception {
		System.out.println("tid : " + (String)jsonData.get("TID"));
		String tid = (String)jsonData.get("TID");
		
		KakaoPayCancelAPIVO kakaoCancelAPIVO = kakaoService.kakaoPayCancel(tid);
		
		int resultCode = 0;
		
		if(kakaoCancelAPIVO == null) {
			resultCode = 0;
		} else {
			int resultNum = paymentService.insertPaymentCancel(kakaoCancelAPIVO);
			
			if (resultNum == 1) {
				resultCode = paymentService.updateStatusPayment(kakaoCancelAPIVO.getTid());
			}
			
			OrdersVO oVo = new OrdersVO();
			oVo.setORDERS_NAME(kakaoCancelAPIVO.getPartner_order_id());
			OrdersVO getOVo = ordersService.getOrdersbyOrdersName(oVo);
			
			
			ProductVO pVo = new ProductVO();
			pVo.setPRODUCT_ID(getOVo.getPRODUCT_ID());
			pVo.setCOUNT(kakaoCancelAPIVO.getQuantity());
			
			productService.updateProductCount(pVo); //취소가 성공했으므로, 재고를 다시 복구
		}
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("resultCode", resultCode);
		
		return map;
		
//		if(kakaoCancelAPIVO == null) {
//			return "/buyer/payment/payment-fail";
//		} else {
//			int resultNum = paymentService.insertPaymentCancel(kakaoCancelAPIVO);
//			
//			if (resultNum == 1) {
//				paymentService.updateStatusPayment(kakaoCancelAPIVO.getTid());
//			}
//			System.out.println("캔슬에서 삽입한 결과 갯수는? : " + resultNum);
//		}
//		rttr.addFlashAttribute("kakaoCancelAPIVO", kakaoCancelAPIVO);
//		return "redirect:/payment/payment-cancel";
	}
	
	// 카카오페이 결제 실패시 맵핑
	@RequestMapping(value = "/payment/kakaoPaySuccessFail", method = RequestMethod.GET)
	public String kakaoSuccessFail() throws Exception {
		System.out.println("카카오 페이 결제 과정 중 오류가 발생했습니다. 확인 요망");
		return "/buyer/payment/payment-fail";
	}
	
	@RequestMapping(value = "/payment/kakaoPaymentCancel", method = RequestMethod.GET)
	public String kakaoCancel() throws Exception {
		System.out.println("카카오 페이 결제 취소");
		return "redirect: /rudisfarm";
	}
	
	// 결제 완료나 취소후 새로고침 뒤로가기 시 들어오는 URL
	@RequestMapping(value = "/payment/paywrongpage", method = RequestMethod.GET)
	public String payWrong() {
		
		return "buyer/wrongapproach";
	}
	
	@RequestMapping(value = "/payment/pay" , method = RequestMethod.GET)
	public String paytest() {
		
		return "buyer/payment/paymentsucc";
	}
}