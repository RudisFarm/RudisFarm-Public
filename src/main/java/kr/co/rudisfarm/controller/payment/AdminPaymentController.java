package kr.co.rudisfarm.controller.payment;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import kr.co.rudisfarm.model.commons.pagenation.PaymentPagenation;
import kr.co.rudisfarm.model.payment.RudisPaymentService;
import kr.co.rudisfarm.model.payment.RudisPaymentVO;

@Controller
@SessionAttributes({ "USER_ID", "EMAIL", "NAME" })
public class AdminPaymentController {

	@Autowired
	RudisPaymentService paymentService;


	@RequestMapping(value = "/admin/admin-paymentlist-manage", method = RequestMethod.GET)
	public String superAdminPaymentList(@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
			@RequestParam(value = "keywordType", required = false, defaultValue = "ITEM_NAME") String keywordType,
			Model model) {

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("user", "ํ๋งค์");
		// map.put("user_id", USER_ID);
		map.put("keyword", keyword);
		map.put("page", page);
		map.put("currentPage", (page - 1) * 10);
		map.put("keywordType", keywordType);
		System.out.println(keywordType);
		System.out.println(keyword);

		List<RudisPaymentVO> superAdminPaymentList = paymentService.superAdminPaymentList(map);
		int listCount = paymentService.superAdminPaymentListCount(map);

		PaymentPagenation paymentPagenation = new PaymentPagenation(superAdminPaymentList, superAdminPaymentList,
				superAdminPaymentList, superAdminPaymentList, superAdminPaymentList, (int) map.get("page"), listCount,
				(String) map.get("keyword"), (String) map.get("type1"), (String) map.get("type2"),
				(String) map.get("sort"), (String) map.get("keywordType"));

		System.out.println("superAdminPaymentList ๋ฆฌ์คํธ ์นด์ดํธ : " + listCount);
		System.out.println("getSuperAdminPaymentList ์ฌ์ด์ฆ : " + superAdminPaymentList.size());
		model.addAttribute("paymentPagenation", paymentPagenation);

		return "/admin/payment/admin-paymentlist-manage";
	}

	@RequestMapping(value = "/admin/admin-canceledpaymentlist-manage", method = RequestMethod.GET)
	public String superAdminCancelPaymentList(
			@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
			@RequestParam(value = "keywordType", required = false, defaultValue = "ITEM_NAME") String keywordType,
			Model model) {

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("user", "ํ๋งค์");
		// map.put("user_id", USER_ID);
		map.put("keyword", keyword);
		map.put("page", page);
		map.put("currentPage", (page - 1) * 10);
		map.put("keywordType", keywordType);
		System.out.println(keywordType);
		System.out.println(keyword);

		List<RudisPaymentVO> superAdminCancelPaymentList = paymentService.superAdminCancelPaymentList(map);
		int listCount = paymentService.superAdminCancelPaymentListCount(map);

		PaymentPagenation paymentPagenation = new PaymentPagenation(superAdminCancelPaymentList,
				superAdminCancelPaymentList, superAdminCancelPaymentList, superAdminCancelPaymentList,
				superAdminCancelPaymentList, (int) map.get("page"), listCount, (String) map.get("keyword"),
				(String) map.get("type1"), (String) map.get("type2"), (String) map.get("sort"),
				(String) map.get("keywordType"));

		System.out.println("superAdminCancelPaymentList ๋ฆฌ์คํธ ์นด์ดํธ : " + listCount);
		System.out.println("getSuperAdminCancelPaymentList ์ฌ์ด์ฆ : " + superAdminCancelPaymentList.size());
		model.addAttribute("paymentPagenation", paymentPagenation);

		return "/admin/payment/admin-canceledpaymentlist-manage";
	}

	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new LinkedHashMap<String, String>();
		conditionMap.put("CID", "CID");
		conditionMap.put("TID", "TID");
		conditionMap.put("AID", "AID");
		conditionMap.put("๊ฒฐ์? ์ํ", "STATUS");
		conditionMap.put("์ฃผ๋ฌธ ๋ฒํธ", "PARTNER_ORDER_ID");
		conditionMap.put("์ฃผ๋ฌธ์ID", "PARTNER_USER_ID");
		conditionMap.put("์ํ๋ช", "ITEM_NAME");
		conditionMap.put("์๋", "QUANTITY");
		conditionMap.put("๊ฒฐ์?์ด์ก", "TOATL_AMOUNT");
		conditionMap.put("๊ฒฐ์?์๋จ", "PAYMENT_METHOD_TYPE");
		conditionMap.put("์ทจ์์ด์ก", "CANCEL_AMOUNT");
		return conditionMap;
	}

	// ์?๋?ฌ ๋ชฉ๋ก ๋ถ๋ฌ์ค๊ธฐ
	@RequestMapping(value = "/payment-sort", method = RequestMethod.POST)
	@ResponseBody
	public Object getProductSort() {
		Map<String, Object> map = new LinkedHashMap<String, Object>();

		return map;
	}

//	@RequestMapping(value = "/admin-paymentlist-manage", method = RequestMethod.GET)
//	public String superAdminPaymentList(Model model) {
//
//		RudisPaymentVO vo = new RudisPaymentVO();
//		model.addAttribute("superAdminPaymentList", paymentService.superAdminPaymentList(vo));
//
//		return "/admin/payment/admin-paymentlist-manage";
//	}

//	// ๊ฒฐ์?๋ด์ญ ์กฐํ
//	@RequestMapping(value = "/seller/seller-payment-manage", method = RequestMethod.GET)
//	public String getSellerPaymentList(@ModelAttribute UserVO vo2, @RequestParam(defaultValue = "1") int curPage,
//			Model model, HttpServletRequest request) {
//		// DAO์์ ๋ฐ์ดํฐ๋ฅผ ์กฐํ ํ model์ ๋ด์์ ์?๋ฌ
//
//		HttpSession session = request.getSession();
//		String userId = (String) session.getAttribute("USER_ID");
//
//		RudisPaymentVO vo = new RudisPaymentVO();
//		// String USER_ID = request.getParameter("USER_ID");
//		// System.out.println(USER_ID);
//
//		int listCnt = paymentService.getRudisPaymentListCOUNT(vo);
////		PagingVO pagination = new PagingVO(listCnt, curPage);
////		
////		vo.setStartIndex(pagination.getStartIndex());
//		
//		
//		
//
//		vo.setUSER_ID(userId);
//		System.out.println(userId);
//		System.out.println(vo.getUSER_ID());
//		model.addAttribute("paymentList", paymentService.getRudisPaymentList(vo));
//		model.addAttribute("AdminPaymentCancelList", paymentService.AdminPaymentCancelList(vo));
//
//		// PaymentVO payment = paymentService.getPaymentList(vo);
//
//		return "/seller/payment/seller-payment-manage";
//	}
}
