package kr.co.rudisfarm.controller.payment;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import kr.co.rudisfarm.model.commons.pagenation.PaymentKakaoPagenation;
import kr.co.rudisfarm.model.payment.PaymentService;
import kr.co.rudisfarm.model.payment.PaymentVO;
import kr.co.rudisfarm.model.payment.RudisPaymentService;
import kr.co.rudisfarm.model.payment.apivo.KakaoPayApprovalAPIVO;
import kr.co.rudisfarm.model.payment.apivo.KakaoPayCancelAPIVO;

@Controller
@SessionAttributes({ "USER_ID", "EMAIL", "NAME" })
public class BuyerPaymentController {

	@Autowired
	RudisPaymentService rudisPaymentService;
	
	@Autowired
	PaymentService paymentService;

	// 결제내역 조회
	// @RequestMapping(value = "/seller/seller-payment-manage", method = RequestMethod.GET)
	// public String getSellerPaymentList(@ModelAttribute UserVO vo2, Model model, HttpServletRequest request) {
	// 	// DAO에서 데이터를 조회 후 model에 담아서 전달

	// 	HttpSession session = request.getSession();
	// 	String userId = (String) session.getAttribute("USER_ID");

	// 	// String USER_ID = request.getParameter("USER_ID");
	// 	// System.out.println(USER_ID);

	// 	RudisPaymentVO vo = new RudisPaymentVO();
	// 	vo.setUSER_ID(userId);
	// 	System.out.println(userId);
	// 	System.out.println(vo.getUSER_ID());
	// 	model.addAttribute("paymentList", paymentService.getPaymentList(vo));

	// 	// PaymentVO payment = paymentService.getPaymentList(vo);

	// 	return "/seller/payment/seller-payment-manage";
	// }
	
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("제목", "TITLE");
		conditionMap.put("내용", "CONTENT");
		return conditionMap;
	}
	
	@RequestMapping(value = "/payment", method = RequestMethod.GET)
	public String paymentAdminList(Model model) {
		//주문 내역 리스트
		
		return "/seller/payment/payment";
	}
	
	// 구매자 리스트 보기
	@RequestMapping(value = "/my-page/payment", method = RequestMethod.GET)
	public String paymentBuyerList(@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@ModelAttribute("USER_ID") String USER_ID, Model model) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		System.out.println("USER_ID : " + USER_ID);
		
		map.put("user", "판매자");
		map.put("PARTNER_USER_ID", USER_ID);
		map.put("page", page);
		map.put("currentPage", (page - 1) * 10);
		
		List<PaymentVO> paymentList = paymentService.getKakaoOrderList(map);
		System.out.println("컨트롤러 페이먼트 리스트 : " + paymentList.toString());
		int listCount = paymentService.getOrederListCount(map);
		
		PaymentKakaoPagenation paymentPagenation = new PaymentKakaoPagenation(paymentList, (int) map.get("page"), listCount);
		
		model.addAttribute("paymentPagenation", paymentPagenation);
	
		return "buyer/payment/payment-list";
	}
	
	// 상세 확인용
	@RequestMapping(value = "/my-page/payment/{PARTNER_ORDER_ID}", method = RequestMethod.GET)
	public String getPaymentDetail(@PathVariable String PARTNER_ORDER_ID,  Model model, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		session.getAttribute("USER_ID");

		PaymentVO payVO = new PaymentVO();
		payVO.setPARTNER_ORDER_ID(PARTNER_ORDER_ID);
		model.addAttribute("getpayment", paymentService.getPaymentDetail(payVO));
		
		return "buyer/payment/payment-detail";
	}
	
	// 김승수 payment controller
	// 결제 성공시 들어오는 redirect URL
	@RequestMapping(value = "/payment/payment-result", method = RequestMethod.GET)
	public String showPaymentResult(@ModelAttribute("kakaoApprovalVO") KakaoPayApprovalAPIVO kakaoApprovalVO, Model model) {
		
		if(kakaoApprovalVO.getTid() != null) {
			model.addAttribute("info", kakaoApprovalVO);
		} else {
			return "redirect:/payment/paywrongpage";
		}
		
		return "buyer/payment/payment-success";
	}
	
	// 결제 취소 할 때 들어오는 redirect URL
//	@RequestMapping(value = "/payment/payment-cancel", method = RequestMethod.GET)
//	public String showPaymentCancel(@ModelAttribute("kakaoCancelAPIVO") KakaoPayCancelAPIVO kakaoCancelAPIVO, Model model) {
//		if(kakaoCancelAPIVO.getTid() != null) {
//			model.addAttribute("info", kakaoCancelAPIVO);
//		} else {
//			return "redirect:/payment/paywrongpage";
//		}
//		
//		return "buyer/payment/payment-cancel";
//	}
}
