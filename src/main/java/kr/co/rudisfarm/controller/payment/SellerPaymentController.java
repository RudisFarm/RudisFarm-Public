package kr.co.rudisfarm.controller.payment;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import kr.co.rudisfarm.model.payment.PaymentService;
import kr.co.rudisfarm.model.payment.PremiumVO;
import kr.co.rudisfarm.model.payment.RudisPaymentService;
import kr.co.rudisfarm.model.payment.SellerKakaoService;
import kr.co.rudisfarm.model.payment.apivo.KakaoPayApprovalAPIVO;
import kr.co.rudisfarm.model.user.UserService;

@Controller
@SessionAttributes({ "USER_ID", "EMAIL", "NAME" })
public class SellerPaymentController {
	@Autowired
	RudisPaymentService paymentService;
	
	@Autowired
	SellerKakaoService sellerKakaoService;
	
	@Autowired
	PaymentService kakaoPaymentService;
	
	@Autowired
	UserService userService;

	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("제목", "TITLE");
		conditionMap.put("내용", "CONTENT");
		return conditionMap;
	}
	
	@RequestMapping(value = "/seller/premium-payment", method = RequestMethod.POST)
	public String orders(Model model, HttpSession session) throws Exception {
		String id = (String)session.getAttribute("USER_ID");
		
		return "redirect:"+sellerKakaoService.kakaoPayReady(id);
	}
	
	@RequestMapping(value = "/premium/kakaopaySuccess", method = RequestMethod.GET)
	public String kakaoPay(@RequestParam("pg_token") String pg_token, Model model, HttpServletRequest request) throws Exception {
		String userId = (String)request.getSession().getAttribute("USER_ID");
		
		HashMap<String, Object> kakaoPayInfoResult = sellerKakaoService.kakaoPayInfo(pg_token, userId);
		
		System.out.println("프리미엄 결과 : " + ((KakaoPayApprovalAPIVO)kakaoPayInfoResult.get("kakaoPayApprovalAPIVO")).toString());
		
		PremiumVO premiumVO = new PremiumVO();
		
		premiumVO.setUSER_ID(((KakaoPayApprovalAPIVO)kakaoPayInfoResult.get("kakaoPayApprovalAPIVO")).getPartner_user_id());
		premiumVO.setPREMIUM_KEY(((KakaoPayApprovalAPIVO)kakaoPayInfoResult.get("kakaoPayApprovalAPIVO")).getPartner_order_id());
		
		int resultNum = kakaoPaymentService.insertPremium(premiumVO); // 결제 테이블에 결제 기록

		System.out.println("디비에 vo 변환해서 삽입한 결과 갯수는? : " + resultNum);
		
		model.addAttribute("premium", premiumVO);
		
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("USER_ID", userId);
		map.put("PRIMIUM_COUNT", 100000);
		
		int result = userService.isPremiumUpdate(map);
		System.out.println("실행 결과 :"+result);

//		return "redirect:/seller/seller-product-manage";
		return "redirect:/seller/seller-product-manage-premium-form";
	}
}
