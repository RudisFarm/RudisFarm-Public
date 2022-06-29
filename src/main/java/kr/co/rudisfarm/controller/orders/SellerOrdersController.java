package kr.co.rudisfarm.controller.orders;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import kr.co.rudisfarm.model.commons.aysnc.AsyncConfig;
import kr.co.rudisfarm.model.commons.aysnc.AsyncMailSendTask;
import kr.co.rudisfarm.model.commons.pagenation.OrdersBuyerPagenation;
import kr.co.rudisfarm.model.commons.pagenation.PaymentPagenation;
import kr.co.rudisfarm.model.orders.OrdersService;
import kr.co.rudisfarm.model.orders.OrdersVO;
import kr.co.rudisfarm.model.payment.KakaoService;
import kr.co.rudisfarm.model.payment.PaymentService;
import kr.co.rudisfarm.model.payment.RudisPaymentService;
import kr.co.rudisfarm.model.payment.RudisPaymentVO;
import kr.co.rudisfarm.model.payment.apivo.KakaoPayCancelAPIVO;
import kr.co.rudisfarm.model.product.ProductService;
import kr.co.rudisfarm.model.product.ProductVO;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Controller
//@SessionAttributes({ "USER_ID", "EMAIL", "NAME" })
public class SellerOrdersController {
	@Autowired
	private KakaoService kakaoService;
	
	@Autowired
	OrdersService ordersService;
	
	@Autowired
	ProductService productService;

	@Autowired
	RudisPaymentService rudisPaymentService;
	
	@Autowired
	PaymentService paymentService;
	
	@Resource(name = "AsyncMailSendTask")
	private AsyncMailSendTask asyncMailSendTask;

	@Resource(name = "asyncConfig")
	private AsyncConfig asyncConfig;
	
	
	
	@RequestMapping(value = "/seller/seller-deliverysearch-manage", method = RequestMethod.GET)
	public String sellerdeliverysearch() {

		return "/seller/orders/seller-deliverysearch-manage";
	}

	



	
	@RequestMapping(value = "/seller/seller-orderlistcompleted-manage", method = RequestMethod.PUT)
	@ResponseBody
	public Object getorderlistcompleted(@RequestBody HashMap<String, Object> jsonData, Model model,
			HttpServletRequest request) {
		
		System.out.println("들어온 주문이름 : " + (String) jsonData.get("ORDERS_NAME"));
		System.out.println("반품 승인 여부 : " + (boolean) jsonData.get("EXCHANGE"));
		System.out.println("운송장 번호 : " + (String) jsonData.get("TRACKING_NUMBER"));
		System.out.println("택배회사명 : " + (String) jsonData.get("TRACKING_NAME"));
		String trackingname = (String) jsonData.get("TRACKING_NAME");
		
		OrdersVO ordersVO = new OrdersVO();
		ordersVO.setORDERS_NAME((String) jsonData.get("ORDERS_NAME"));
		ordersVO.setTRACKING_NUMBER((String) jsonData.get("TRACKING_NUMBER"));
		ordersVO.setTRACKING_NAME((String) jsonData.get("TRACKING_NAME"));
		
		if((String) jsonData.get("TRACKING_NUMBER") == "") {
			String name = "직접배송";
			ordersVO.setTRACKING_NUMBER(name);
		}
		if(trackingname.equals("CJ대한통운")) {
			String code = "04";
			ordersVO.setTRACKING_CODE(code);
			
		}else if(trackingname.equals("한진택배")) {
			String code = "05";
			ordersVO.setTRACKING_CODE(code);
		}else if(trackingname.equals("롯데택배")) {
			String code = "08";
			ordersVO.setTRACKING_CODE(code);
		}else if(trackingname.equals("우체국택배")) {
			String code = "01";
			ordersVO.setTRACKING_CODE(code);
		}else if(trackingname.equals("로젠택배")) {
			String code = "06";
			ordersVO.setTRACKING_CODE(code);
		}else if(trackingname.equals("대신택배")) {
			String code = "22";
			ordersVO.setTRACKING_CODE(code);
		}else if(trackingname.equals("경동택배")) {
			String code = "23";
			ordersVO.setTRACKING_CODE(code);
		}else if(trackingname.equals("합동택배")) {
			String code = "32";
			ordersVO.setTRACKING_CODE(code);
		}else if(trackingname.equals("CU편의점택배")) {
			String code = "46";
			ordersVO.setTRACKING_CODE(code);
		}else if(trackingname.equals("GSPostbox택배")) {
			String code = "24";
			ordersVO.setTRACKING_CODE(code);
		}else{
			String code = "21";
			ordersVO.setTRACKING_CODE(code);
		}
	
		int resultCode = 0;
		int TrackingResultCode = 0;
	
		String api_key = "NCSKXTRZRFKIONUW";
		String api_secret = "6IUARHDAQN1XAGSIVBFS8GZRMTBPYRK0";
	
	
		if ((boolean) jsonData.get("EXCHANGE")) {
			resultCode = ordersService.getOrderslistComplete(ordersVO);
			TrackingResultCode = ordersService.getTrackingNumberUpdate(ordersVO);
			OrdersVO ordersEmail = ordersService.ordersemailsearch(ordersVO);
			ordersEmail.setPHONE(ordersService.ordersphonesearch(ordersVO).getPHONE());
			OrdersVO productname = ordersService.selectproductnamesearch(ordersVO);
	
			System.out.println("배송 처리!");
			try {
				if (asyncConfig.isSampleTaskExecute()) {
					asyncMailSendTask.sellerdeliverySuccess(ordersEmail.getEMAIL(), ordersVO.getTRACKING_NUMBER(),
							ordersVO.getORDERS_NAME(), productname.getPRODUCT_NAME());
					System.out.println("orderslistdetail 배송 처리 이메일 보내기 성공");
				} else {
					System.out.println("쓰레드 갯수 초과");
				}
			} catch (Exception e) {
				System.out.println("==============>>>>>>>>>>>> THREAD ERROR");
				System.out.println("TaskRejectedException : 등록 개수 초과");
				System.out.println("==============>>>>>>>>>>>> THREAD END");
			}
			
			Message coolsms = new Message(api_key, api_secret);
			
			HashMap<String, String> params = new HashMap<String, String>();
			System.out.println("getorderlistcompleted에서  ordersVO.getPHONE() = " + ordersEmail.getPHONE());
			

			
			 
			
			params.put("to", (String)ordersEmail.getPHONE());
			params.put("from", "01033593487");
			params.put("type", "SMS");
			params.put("text", "루디스팜입니다.\n 운송장번호 : " + ordersVO.getTRACKING_NUMBER() + "\n" + "상품명 : " + productname.getPRODUCT_NAME() 
						+ "\n" + "주문번호 : " + ordersVO.getORDERS_NAME() + "\n");
			params.put("app_version", "test app 1.2"); // application name and version
			System.out.println("문자메세지 모내기 try문 전까지");
	
			try {
				JSONObject obj = (JSONObject) coolsms.send(params);
				System.out.println("문자 메세지 성공" + obj.toString());
			} catch (CoolsmsException e) {
	
				System.out.println(e.getMessage());
				System.out.println(e.getCode());
				System.out.println("문자메세지 오류..catch문 마지막");
			}
		}
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("resultCode", resultCode);
	
		if (TrackingResultCode == 1 && resultCode == 1 && (boolean) jsonData.get("EXCHANGE")) {
			String STATUS = "배송 처리"; // select문 결과
			map.put("STATUS", STATUS);
		}
	
		return map;
	}
	
	@RequestMapping(value = "/seller/seller-reqexchangecompleted-manage", method = RequestMethod.PUT)
	@ResponseBody
	public Object getSellerRequestReturnComplete(@RequestBody HashMap<String, Object> jsonData, Model model,
			HttpServletRequest request) {

		System.out.println("들어온 주문이름 : " + (String) jsonData.get("ORDERS_NAME"));
		System.out.println("교환 승인 여부 : " + (boolean) jsonData.get("EXCHANGE"));
		System.out.println("운송장 번호 : " + (String) jsonData.get("TRACKING_NUMBER"));
		System.out.println("택배회사명 : " + (String) jsonData.get("TRACKING_NAME"));
		String trackingname = (String) jsonData.get("TRACKING_NAME");
		
		OrdersVO ordersVO = new OrdersVO();
		ordersVO.setORDERS_NAME((String) jsonData.get("ORDERS_NAME"));
		ordersVO.setTRACKING_NUMBER((String) jsonData.get("TRACKING_NUMBER"));
		ordersVO.setTRACKING_NAME((String) jsonData.get("TRACKING_NAME"));
		
		if((String) jsonData.get("TRACKING_NUMBER") == "") {
			String name = "직접배송";
			ordersVO.setTRACKING_NUMBER(name);
		}
		if(trackingname.equals("CJ대한통운")) {
			String code = "04";
			ordersVO.setTRACKING_CODE(code);
			
		}else if(trackingname.equals("한진택배")) {
			String code = "05";
			ordersVO.setTRACKING_CODE(code);
		}else if(trackingname.equals("롯데택배")) {
			String code = "08";
			ordersVO.setTRACKING_CODE(code);
		}else if(trackingname.equals("우체국택배")) {
			String code = "01";
			ordersVO.setTRACKING_CODE(code);
		}else if(trackingname.equals("로젠택배")) {
			String code = "06";
			ordersVO.setTRACKING_CODE(code);
		}else if(trackingname.equals("대신택배")) {
			String code = "22";
			ordersVO.setTRACKING_CODE(code);
		}else if(trackingname.equals("경동택배")) {
			String code = "23";
			ordersVO.setTRACKING_CODE(code);
		}else if(trackingname.equals("합동택배")) {
			String code = "32";
			ordersVO.setTRACKING_CODE(code);
		}else if(trackingname.equals("CU편의점택배")) {
			String code = "46";
			ordersVO.setTRACKING_CODE(code);
		}else if(trackingname.equals("GSPostbox택배")) {
			String code = "24";
			ordersVO.setTRACKING_CODE(code);
		}else{
			String code = "21";
			ordersVO.setTRACKING_CODE(code);
		}
		
		
		int SMSresultCode = 0;
		int TrackingResultCode = 0;
		
		SMSresultCode = ordersService.getOrderslistComplete(ordersVO);
		TrackingResultCode = ordersService.getTrackingNumberUpdate(ordersVO);
		OrdersVO ordersEmail = ordersService.ordersemailsearch(ordersVO);
		OrdersVO productname = ordersService.selectproductnamesearch(ordersVO);
		
		
	
		String api_key = "NCSKXTRZRFKIONUW";
		String api_secret = "6IUARHDAQN1XAGSIVBFS8GZRMTBPYRK0";
	
	
		if ((boolean) jsonData.get("EXCHANGE")) {
	
			System.out.println("교환 처리!");
			try {
				if (asyncConfig.isSampleTaskExecute()) {
					asyncMailSendTask.sellerExchangeSuccess(ordersEmail.getEMAIL(), true);
					System.out.println("orderslistdetail 교환 처리 이메일 보내기 성공");
				} else {
					System.out.println("쓰레드 갯수 초과");
				}
			} catch (Exception e) {
				System.out.println("==============>>>>>>>>>>>> THREAD ERROR");
				System.out.println("TaskRejectedException : 등록 개수 초과");
				System.out.println("==============>>>>>>>>>>>> THREAD END");
			}
			
			Message coolsms = new Message(api_key, api_secret);
			
			HashMap<String, String> params = new HashMap<String, String>();
			System.out.println("getorderlistcompleted에서  ordersVO.getPHONE() = " + ordersEmail.getPHONE());
			 
			
			params.put("to", (String)ordersEmail.getPHONE());
			params.put("from", "01033593487");
			params.put("type", "SMS");
			params.put("text", "루디스팜입니다.\n 교환신청한 상품이 교환처리 됐습니다.\n" + "상품명 : " + productname.getPRODUCT_NAME() 
						+ "\n" + "주문번호 : " + ordersVO.getORDERS_NAME() + "\n");
			params.put("app_version", "test app 1.2"); // application name and version
			System.out.println("문자메세지 모내기 try문 전까지");
	
			try {
				JSONObject obj = (JSONObject) coolsms.send(params);
				System.out.println("문자 메세지 성공" + obj.toString());
			} catch (CoolsmsException e) {
	
				System.out.println(e.getMessage());
				System.out.println(e.getCode());
				System.out.println("문자메세지 오류..catch문 마지막");
			}
		}
		
		if (!(boolean) jsonData.get("EXCHANGE")) {

	
			System.out.println("교환 불가!");
			try {
				if (asyncConfig.isSampleTaskExecute()) {
					asyncMailSendTask.sellerExchangeSuccess(ordersEmail.getEMAIL(), false);
					System.out.println("orderslistdetail 교환 처리 이메일 보내기 성공");
				} else {
					System.out.println("쓰레드 갯수 초과");
				}
			} catch (Exception e) {
				System.out.println("==============>>>>>>>>>>>> THREAD ERROR");
				System.out.println("TaskRejectedException : 등록 개수 초과");
				System.out.println("==============>>>>>>>>>>>> THREAD END");
			}
			
			Message coolsms = new Message(api_key, api_secret);
			
			HashMap<String, String> params = new HashMap<String, String>();
			System.out.println("getorderlistcompleted에서  ordersVO.getPHONE() = " + ordersEmail.getPHONE());
			 
			
			params.put("to", (String)ordersEmail.getPHONE());
			params.put("from", "01033593487");
			params.put("type", "SMS");
			params.put("text", "루디스팜입니다.\n 교환신청한 상품이 교환불가 처리 됐습니다.\n" + "상품명 : " + productname.getPRODUCT_NAME() 
						+ "\n" + "주문번호 : " + ordersVO.getORDERS_NAME() + "\n");
			params.put("app_version", "test app 1.2"); // application name and version
			System.out.println("문자메세지 모내기 try문 전까지");
	
			try {
				JSONObject obj = (JSONObject) coolsms.send(params);
				System.out.println("문자 메세지 성공" + obj.toString());
			} catch (CoolsmsException e) {
	
				System.out.println(e.getMessage());
				System.out.println(e.getCode());
				System.out.println("문자메세지 오류..catch문 마지막");
			}
		}


		int resultCode = 0;
		if ((boolean) jsonData.get("EXCHANGE")) {
			resultCode = ordersService.getOrdersExchangeComplete(ordersVO);
			System.out.println("교환 처리!");
		} else {
			resultCode = ordersService.getOrdersExchangeFalse(ordersVO);
			System.out.println("교환 불가!");
		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("resultCode", resultCode);

		if (SMSresultCode == 1 && TrackingResultCode == 1 && resultCode == 1 && (boolean) jsonData.get("EXCHANGE")) {
			String STATUS = "교환 처리"; // select문 결과
			map.put("STATUS", STATUS);
		} else if (SMSresultCode == 1 && TrackingResultCode == 1 && resultCode == 1 && !(boolean) jsonData.get("EXCHANGE")) {
			String STATUS = "교환 불가"; // select문 결과
			map.put("STATUS", STATUS);
		} else if (TrackingResultCode == 1 && resultCode == 1 && (boolean) jsonData.get("EXCHANGE")) {
			String STATUS = "배송 처리"; // select문 결과
			map.put("STATUS", STATUS);
		}
	
		return map;
	}
	
	
	
	@RequestMapping(value = "/seller/seller-reqreturncompleted-manage", method = RequestMethod.PUT)
	@ResponseBody
	public Object getSellerRequestExchangeComplete(@RequestBody HashMap<String, Object> jsonData, Model model,
			HttpServletRequest request) throws Exception {

		System.out.println("들어온 주문이름 : " + (String) jsonData.get("ORDERS_NAME"));
		System.out.println("반품 승인 여부 : " + (boolean) jsonData.get("RETURN"));
		OrdersVO odersVO = new OrdersVO();
		odersVO.setORDERS_NAME((String) jsonData.get("ORDERS_NAME"));

		// List<OrdersVO> sellerExchangeList =
		// ordersService.sellerExchangeList(ordersVO);

//		System.out.println("SellerOrdersController reqexchangecompleted 실행");

		// System.out.println("orders페이지 판매자 결제내역 카운트" + sellerExchangeList);
//		model.addAttribute("ordersExchangeList", ordersService.sellerExchangeList(odersVO));
		
		
		
		int SMSresultCode = 0;
		int TrackingResultCode = 0;
		
		SMSresultCode = ordersService.getOrderslistComplete(odersVO);
		TrackingResultCode = ordersService.getTrackingNumberUpdate(odersVO);
		OrdersVO ordersEmail = ordersService.ordersemailsearch(odersVO);
		OrdersVO productname = ordersService.selectproductnamesearch(odersVO);
		
		
	
		String api_key = "NCSKXTRZRFKIONUW";
		String api_secret = "6IUARHDAQN1XAGSIVBFS8GZRMTBPYRK0";
	
		int resultCode = 0;
		
		if ((boolean) jsonData.get("RETURN")) {
			
			//결제 취소
			
			//1. order_name으로 tid 찾기
			String TID = paymentService.getTIDfrompartnerID(odersVO.getORDERS_NAME());
			System.out.println("TID ? :" + TID);
			//2. 찾은 tid로 카카오 결제 취소처리하기
			KakaoPayCancelAPIVO kakaoCancelAPIVO = kakaoService.kakaoPayCancel(TID);
			if(kakaoCancelAPIVO != null ) {
				System.out.println("널 아님");
			}
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
				System.out.println("복구할 수량 : " + kakaoCancelAPIVO.getQuantity());
				
				productService.updateProductCount(pVo); //취소가 성공했으므로, 재고를 다시 복구
			
				//3. 취소 완료되면, 주문을 반품 처리 상태로 변환하기
				resultCode = ordersService.getOrdersReturnComplete(odersVO);
				System.out.println("반품 처리!");
			}
	
			System.out.println("반품 처리!");
			try {
				if (asyncConfig.isSampleTaskExecute()) {
					asyncMailSendTask.sellerReturnSuccess(ordersEmail.getEMAIL(), true);
					System.out.println("orderslistdetail 반품 처리 이메일 보내기 성공");
				} else {
					System.out.println("쓰레드 갯수 초과");
				}
			} catch (Exception e) {
				System.out.println("==============>>>>>>>>>>>> THREAD ERROR");
				System.out.println("TaskRejectedException : 등록 개수 초과");
				System.out.println("==============>>>>>>>>>>>> THREAD END");
			}
			
			Message coolsms = new Message(api_key, api_secret);
			
			HashMap<String, String> params = new HashMap<String, String>();
			System.out.println("getorderlistcompleted에서  ordersVO.getPHONE() = " + ordersEmail.getPHONE());
			 
			
			params.put("to", (String)ordersEmail.getPHONE());
			params.put("from", "01033593487");
			params.put("type", "SMS");
			params.put("text", "루디스팜입니다.\n 반품신청한 상품이 정상적으로 처리 됐습니다.\n" + "상품명 : " + productname.getPRODUCT_NAME() 
						+ "\n" + "주문번호 : " + odersVO.getORDERS_NAME() + "\n");
			params.put("app_version", "test app 1.2"); // application name and version
			System.out.println("문자메세지 모내기 try문 전까지");
	
			try {
				JSONObject obj = (JSONObject) coolsms.send(params);
				System.out.println("문자 메세지 성공" + obj.toString());
			} catch (CoolsmsException e) {
	
				System.out.println(e.getMessage());
				System.out.println(e.getCode());
				System.out.println("문자메세지 오류..catch문 마지막");
			}
		}
		
		if (!(boolean) jsonData.get("RETURN")) {
			resultCode = ordersService.getOrdersReturnFalse(odersVO);
	
			System.out.println("반품 불가!");
			try {
				if (asyncConfig.isSampleTaskExecute()) {
					asyncMailSendTask.sellerReturnSuccess(ordersEmail.getEMAIL(), false);
					System.out.println("orderslistdetail 반품 처리 이메일 보내기 성공");
				} else {
					System.out.println("쓰레드 갯수 초과");
				}
			} catch (Exception e) {
				System.out.println("==============>>>>>>>>>>>> THREAD ERROR");
				System.out.println("TaskRejectedException : 등록 개수 초과");
				System.out.println("==============>>>>>>>>>>>> THREAD END");
			}
			
			Message coolsms = new Message(api_key, api_secret);
			
			HashMap<String, String> params = new HashMap<String, String>();
			System.out.println("getorderlistcompleted에서  ordersVO.getPHONE() = " + ordersEmail.getPHONE());
			 
			
			params.put("to", (String)ordersEmail.getPHONE());
			params.put("from", "01033593487");
			params.put("type", "SMS");
			params.put("text", "루디스팜입니다.\n 반품신청한 상품이 반품불가 처리 됐습니다.\n" + "상품명 : " + productname.getPRODUCT_NAME() 
						+ "\n" + "주문번호 : " + odersVO.getORDERS_NAME() + "\n");
			params.put("app_version", "test app 1.2"); // application name and version
			System.out.println("문자메세지 모내기 try문 전까지");
	
			try {
				JSONObject obj = (JSONObject) coolsms.send(params);
				System.out.println("문자 메세지 성공" + obj.toString());
			} catch (CoolsmsException e) {
	
				System.out.println(e.getMessage());
				System.out.println(e.getCode());
				System.out.println("문자메세지 오류..catch문 마지막");
			}
		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("resultCode", resultCode);

		if (SMSresultCode == 1 && TrackingResultCode == 1 && resultCode == 1 && (boolean) jsonData.get("RETURN")) {
			String STATUS = "반품 처리"; // select문 결과
			map.put("STATUS", STATUS);
		} else if (SMSresultCode == 1 && TrackingResultCode == 1 && resultCode == 1 && !(boolean) jsonData.get("RETURN")) {
			String STATUS = "반품 불가"; // select문 결과
			map.put("STATUS", STATUS);
		}

		return map;
	}
	
	
	
	@RequestMapping(value = "/seller/seller-reqreturnorders-manage/returndetail/{ORDERS_NAME}", method = RequestMethod.GET)
	public String ordersReqReturnOrdersManage(@ModelAttribute OrdersVO vo, @PathVariable String ORDERS_NAME,
			Model model, HttpServletRequest request,  HttpSession session) {
//		OrdersVO vo = new OrdersVO();
//		vo.setORDERS_ID(Integer.parseInt(ORDERS_ID));
		System.out.println(ORDERS_NAME);
		vo.setORDERS_NAME(ORDERS_NAME);
		OrdersVO orders = ordersService.getOrdersRetrunListDetail(vo);
		
		System.out.println(
				"SellerOrdersController ordersReqRuturnOrdersManage vo.getORDERS_NAME() : " + vo.getORDERS_NAME());
		String url = null;
		
		ProductVO pVo = new ProductVO();
		pVo.setPRODUCT_ID(orders.getPRODUCT_ID());
		if(!((String)session.getAttribute("USER_ID")).equals(productService.getProduct(pVo).getUSER_ID())) {
			return "redirect:/seller/seller-reqreturnorders-manage";
		}
		
		if (orders != null) {
			model.addAttribute("product", productService.getProduct(pVo));
			model.addAttribute("orders", orders);
			url = "/seller/orders/orders-returndetail";
		}
		return url;
	}
	
	
	@RequestMapping(value = "/seller/seller-reqexchangeOrders-manage/exchangedetail/{ORDERS_NAME}", method = RequestMethod.GET)
	public String ordersReqExchangepaymentManage(@ModelAttribute OrdersVO vo, @PathVariable String ORDERS_NAME,
			 Model model, HttpServletRequest request, HttpSession session) {

		vo.setORDERS_NAME(ORDERS_NAME);
		OrdersVO orders = ordersService.getOrdersExchangeListDetail(vo);
		System.out.println(
				"SellerOrdersController ordersReqExchangepaymentManage vo.getORDERS_NAME() : " + vo.getORDERS_NAME());
		System.out.println(
				"SellerOrdersController ordersReqExchangepaymentManage vo.getPRODUCT_ID() : " + orders.getPRODUCT_ID());
		
		ProductVO pVo = new ProductVO();
		pVo.setPRODUCT_ID(orders.getPRODUCT_ID());
		if(!((String)session.getAttribute("USER_ID")).equals(productService.getProduct(pVo).getUSER_ID())) {
			return "redirect:/seller/seller-reqexchangeOrders-manage";
		}
		
		String url = null;

		if (orders != null) {
			model.addAttribute("product", productService.getProduct(pVo));
			model.addAttribute("orders", orders);
			url = "/seller/orders/orders-exchangedetail";
		}

		return url;
	}
	

	// 배송처리 및 이메일 보내기
	@RequestMapping(value = "/seller/seller-orderslist-manage/orderslistdetail/{ORDERS_NAME}", method = RequestMethod.GET)
	public String orderslistdetail(@ModelAttribute OrdersVO vo, @PathVariable String ORDERS_NAME, Model model,
			HttpServletRequest request, HttpSession session) {
//		OrdersVO vo = new OrdersVO();
//		vo.setORDERS_ID(Integer.parseInt(ORDERS_ID));
		vo.setORDERS_NAME(ORDERS_NAME);
		OrdersVO orders = ordersService.orderslistdetail(vo);
		OrdersVO ordersproductname = ordersService.orderslistdetailproductname(vo);
		
		ProductVO pVo = new ProductVO();
		pVo.setPRODUCT_ID(orders.getPRODUCT_ID());
		if(!((String)session.getAttribute("USER_ID")).equals(productService.getProduct(pVo).getUSER_ID())) {
			return "redirect:/seller/seller-OrdersList-manage";
		}
		
		System.out.println("본인의 주문을 조회!");
		

		System.out.println("SellerOrdersController orderslistdetail vo.getORDERS_NAME() : " + vo.getORDERS_NAME());
		System.out.println("SellerOrdersController orderslistdetail-ordersproductname vo.getORDERS_NAME() : "
				+ ordersproductname.getPRODUCT_NAME());
		String url = null;

		if (orders != null) {
			model.addAttribute("orders", orders);
			model.addAttribute("ordersproductname", ordersproductname);

			url = "/seller/orders/orders-orderslistdetail";
		}

		System.out.println(url);
		
		return url;
	}

	@RequestMapping(value = "/seller/seller-deliverylist-manage/deliverylistdetail/{ORDERS_NAME}/{TRACKING_NUMBER}", method = RequestMethod.GET)
	public String deliverylistdetail(@ModelAttribute OrdersVO vo, @PathVariable String ORDERS_NAME, Model model,
			@PathVariable String TRACKING_NUMBER, HttpServletRequest request, HttpSession session) {
//		OrdersVO vo = new OrdersVO();
//		vo.setORDERS_ID(Integer.parseInt(ORDERS_ID));
		vo.setORDERS_NAME(ORDERS_NAME);
		vo.setTRACKING_NUMBER(TRACKING_NUMBER);
		OrdersVO orders = ordersService.deliverylistdetail(vo);
		OrdersVO ordersproductname = ordersService.deliverylistdetailname(vo);
		System.out.println("SellerOrdersController deliverylistdetail vo.getORDERS_NAME() : " + vo.getORDERS_NAME());
		System.out.println("SellerOrdersController deliverylistdetailname vo.getORDERS_NAME() : "
				+ ordersproductname.getPRODUCT_NAME());
		String url = null;
		
		ProductVO pVo = new ProductVO();
		pVo.setPRODUCT_ID(orders.getPRODUCT_ID());
		if(!((String)session.getAttribute("USER_ID")).equals(productService.getProduct(pVo).getUSER_ID())) {
			return "redirect:/seller/seller-deliverylist-manage";
		}

		if (orders != null) {
			model.addAttribute("orders", orders);
			model.addAttribute("ordersproductname", ordersproductname);
			
			
			System.out.println("deliverylistdetail url 설정 전까지");
			url = "/seller/orders/orders-deliverylistdetail";
		}
		return url;
	}

	@RequestMapping(value = "/seller/seller-exchangeimpossibleList-manage/exchImpossibledetail/{ORDERS_NAME}", method = RequestMethod.GET)
	public String exchImpossibledetail(@ModelAttribute OrdersVO vo, @PathVariable String ORDERS_NAME, Model model,
			HttpServletRequest request, HttpSession session) {
//		OrdersVO vo = new OrdersVO();
//		vo.setORDERS_ID(Integer.parseInt(ORDERS_ID));
		vo.setORDERS_NAME(ORDERS_NAME);
		OrdersVO orders = ordersService.exchImpossibledetail(vo);
		OrdersVO ordersproductname = ordersService.exchImpossibledetailname(vo);
		System.out.println("SellerOrdersController deliverylistdetail vo.getORDERS_NAME() : " + vo.getORDERS_NAME());
		System.out.println("SellerOrdersController deliverylistdetailname vo.getORDERS_NAME() : "
				+ ordersproductname.getPRODUCT_NAME());
		String url = null;
		
		ProductVO pVo = new ProductVO();
		pVo.setPRODUCT_ID(orders.getPRODUCT_ID());
		if(!((String)session.getAttribute("USER_ID")).equals(productService.getProduct(pVo).getUSER_ID())) {
			return "redirect:/seller/seller-exchangeimpossibleList-manage";
		}

		if (orders != null) {
			model.addAttribute("orders", orders);
			model.addAttribute("ordersproductname", ordersproductname);
			System.out.println("deliverylistdetail url 설정 전까지");
			url = "/seller/orders/orders-exchImpossibledetail";
		}

		return url;
	}

	@RequestMapping(value = "/seller/seller-exchangecompleteList-manage/exchcompldetail/{ORDERS_NAME}", method = RequestMethod.GET)
	public String exchcompldetail(@ModelAttribute OrdersVO vo, @PathVariable String ORDERS_NAME, Model model,
			HttpServletRequest request, HttpSession session) {
//		OrdersVO vo = new OrdersVO();
//		vo.setORDERS_ID(Integer.parseInt(ORDERS_ID));
		vo.setORDERS_NAME(ORDERS_NAME);
		OrdersVO orders = ordersService.exchcompldetail(vo);
		OrdersVO ordersproductname = ordersService.exchcompldetailname(vo);
		System.out.println("SellerOrdersController exchcompldetail vo.getORDERS_NAME() : " + vo.getORDERS_NAME());
		System.out.println("SellerOrdersController exchcompldetailname vo.getORDERS_NAME() : "
				+ ordersproductname.getPRODUCT_NAME());
		String url = null;
		
		ProductVO pVo = new ProductVO();
		pVo.setPRODUCT_ID(orders.getPRODUCT_ID());
		if(!((String)session.getAttribute("USER_ID")).equals(productService.getProduct(pVo).getUSER_ID())) {
			return "redirect:/seller/seller-exchangecompleteList-manage";
		}
		
		

		if (orders != null) {
			model.addAttribute("orders", orders);
			model.addAttribute("ordersproductname", ordersproductname);
			System.out.println("exchcompldetail url 설정 전까지");
			url = "/seller/orders/orders-exchcompldetail";
		}
		return url;
	}

	@RequestMapping(value = "/seller/seller-returncompleteList-manage/returncompletedetail/{ORDERS_NAME}", method = RequestMethod.GET)
	public String returncompletedetail(@ModelAttribute OrdersVO vo, @PathVariable String ORDERS_NAME, Model model,
			HttpServletRequest request, HttpSession session) {
//		OrdersVO vo = new OrdersVO();
//		vo.setORDERS_ID(Integer.parseInt(ORDERS_ID));
		vo.setORDERS_NAME(ORDERS_NAME);
		OrdersVO orders = ordersService.returncompletedetail(vo);
		OrdersVO ordersproductname = ordersService.returncompletedetailname(vo);
		System.out.println("SellerOrdersController returncompletedetail vo.getORDERS_NAME() : " + vo.getORDERS_NAME());
		System.out.println("SellerOrdersController returncompletedetailname vo.getORDERS_NAME() : "
				+ ordersproductname.getPRODUCT_NAME());
		String url = null;
		
		
		ProductVO pVo = new ProductVO();
		pVo.setPRODUCT_ID(orders.getPRODUCT_ID());
		if(!((String)session.getAttribute("USER_ID")).equals(productService.getProduct(pVo).getUSER_ID())) {
			return "redirect:/seller/seller-returncompleteList-manage";
		}
		
		

		if (orders != null) {
			model.addAttribute("orders", orders);
			model.addAttribute("ordersproductname", ordersproductname);
			System.out.println("returncompletedetail url 설정 전까지");
			url = "/seller/orders/orders-returncompletedetail";
		}
		return url;
	}

	@RequestMapping(value = "/seller/seller-returnimpossibleList-manage/returnimpossibledetail/{ORDERS_NAME}", method = RequestMethod.GET)
	public String returnimpossibledetail(@ModelAttribute OrdersVO vo, @PathVariable String ORDERS_NAME, Model model,
			HttpServletRequest request,  HttpSession session) {
//		OrdersVO vo = new OrdersVO();
//		vo.setORDERS_ID(Integer.parseInt(ORDERS_ID));
		vo.setORDERS_NAME(ORDERS_NAME);
		OrdersVO orders = ordersService.returnimpossibledetail(vo);
		OrdersVO ordersproductname = ordersService.returnimpossibledetailname(vo);
		System.out.println("SellerOrdersController returncompletedetail vo.getORDERS_NAME() : " + vo.getORDERS_NAME());
		System.out.println("SellerOrdersController returncompletedetailname vo.getORDERS_NAME() : "
				+ ordersproductname.getPRODUCT_NAME());
		String url = null;
		
		ProductVO pVo = new ProductVO();
		pVo.setPRODUCT_ID(orders.getPRODUCT_ID());
		if(!((String)session.getAttribute("USER_ID")).equals(productService.getProduct(pVo).getUSER_ID())) {
			return "redirect:/seller/seller-returnimpossibleList-manage";
		}

		if (orders != null) {
			model.addAttribute("orders", orders);
			model.addAttribute("ordersproductname", ordersproductname);
			System.out.println("returncompletedetail url 설정 전까지");
			url = "/seller/orders/orders-returnimpossibledetail";
		}
		return url;
	}

	// 등록한 상품 관리 페에지 이동
	@RequestMapping(value = "/seller/seller-payment-manage", method = RequestMethod.GET)
	public String getPaymentListForm(@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
			@RequestParam(value = "sort", required = false, defaultValue = "ITEM_NAME") String sort,
			HttpSession session, Model model) {

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("user", "판매자");
		map.put("USER_ID", (String)session.getAttribute("USER_ID"));
		System.out.println("userID값" + (String)session.getAttribute("USER_ID"));
		map.put("keyword", keyword);
		map.put("page", page);
		map.put("currentPage", (page - 1) * 10);
		map.put("sort", sort);

		List<RudisPaymentVO> paymentList = rudisPaymentService.getPaymentList(map);
		int listCount = rudisPaymentService.getPaymentListCount(map);
		System.out.println("실행");
		List<RudisPaymentVO> paymentCancelList = rudisPaymentService.getPaymentCancelList(map);
		int CancellistCount = rudisPaymentService.getPaymentCancelListCount(map);

		PaymentPagenation paymentPagenation = new PaymentPagenation(paymentList, paymentCancelList, paymentCancelList,
				paymentCancelList, paymentCancelList, (int) map.get("page"), listCount, (String) map.get("keyword"),
				(String) map.get("type1"), (String) map.get("type2"), (String) map.get("sort"),
				(String) map.get("keywordType"));

		System.out.println("payment페이지 판매자 결제내역 카운트 : " + listCount);
		System.out.println("payment페이지 판매자 결제내역 리스트 사이즈 : " + paymentPagenation.getPaymentList().size());
		model.addAttribute("paymentPagenation", paymentPagenation);

		//////////////////////////////////////////////////////////////////////////

		System.out.println("payment페이지 판매자 결제 취소내역 카운트" + CancellistCount);
		System.out.println("payment페이지 판매자 결제 취소내역 사이즈" + paymentPagenation.getPaymentCancelList().size());
		// model.addAttribute("paymentCancelPagenation", paymentPagenation);

		return "/seller/payment/seller-payment-manage";
	}

	@RequestMapping(value = "/seller/seller-cancelpayment-manage", method = RequestMethod.GET)
	public String getPaymentCancelListForm(@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
			@RequestParam(value = "sort", required = false, defaultValue = "ITEM_NAME") String sort,
			HttpSession session, Model model) {

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("user", "판매자");
		map.put("USER_ID", (String)session.getAttribute("USER_ID"));
		System.out.println("userID값" + (String)session.getAttribute("USER_ID"));
		map.put("keyword", keyword);
		map.put("page", page);
		map.put("currentPage", (page - 1) * 10);
		map.put("sort", sort);

		List<RudisPaymentVO> paymentList = rudisPaymentService.getPaymentList(map);
		int listCount = rudisPaymentService.getPaymentListCount(map);
		System.out.println("시해");
		List<RudisPaymentVO> paymentCancelList = rudisPaymentService.getPaymentCancelList(map);
		int CancellistCount = rudisPaymentService.getPaymentCancelListCount(map);

		PaymentPagenation paymentPagenation = new PaymentPagenation(paymentList, paymentCancelList, paymentCancelList,
				paymentCancelList, paymentCancelList, (int) map.get("page"), listCount, (String) map.get("keyword"),
				(String) map.get("type1"), (String) map.get("type2"), (String) map.get("sort"),
				(String) map.get("keywordType"));

		System.out.println("cancel페이지 판매자 결제내역 카운트" + listCount);
		System.out.println("cancel페이지 판매자 결제내역 리스트 사이즈" + paymentPagenation.getPaymentList().size());
		model.addAttribute("paymentPagenation", paymentPagenation);

		//////////////////////////////////////////////////////////////////////////

		System.out.println("cancel페이지 판매자 결제 취소내역 카운트" + CancellistCount);
		System.out.println("cancel페이지 판매자 결제 취소내역 사이즈" + paymentPagenation.getPaymentCancelList().size());
		// model.addAttribute("paymentCancelPagenation", paymentPagenation);

		return "/seller/payment/seller-cancelpayment-manage";
	}



	

	


	
	@RequestMapping(value = "/seller/seller-reqexchangeorders-manage", method = RequestMethod.GET)
	public String getSellerRequestexchangeListForm(
			@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
			@RequestParam(value = "keywordType", required = false, defaultValue = "STATUS") String keywordType,
			HttpSession session, Model model) {
		
		
	
		Map<String, Object> map = new HashMap<String, Object>();
	
		map.put("user", "판매자");
		map.put("USER_ID", (String)session.getAttribute("USER_ID"));
		System.out.println("userID값" + (String)session.getAttribute("USER_ID"));
		map.put("keyword", keyword);
		map.put("page", page);
		map.put("currentPage", (page - 1) * 10);
		map.put("keywordType", keywordType);
		System.out.println(keywordType);
		System.out.println(keyword);
	
		List<OrdersVO> sellerExchangeList = ordersService.sellerOrdersExchangeList(map);
		int listCount = ordersService.sellerOrdersExchangeListCount(map);
	
		OrdersBuyerPagenation ordersPagenation = new OrdersBuyerPagenation(sellerExchangeList, sellerExchangeList,
				(int) map.get("page"), listCount, (String) map.get("keyword"), (String) map.get("type1"),
				(String) map.get("type2"), (String) map.get("sort"), (String) map.get("keywordType"));
	
		System.out.println("getSellerRequestexchangeListForm 실행");
		System.out.println("getSellerRequestexchangeListForm 리스트 카운트 : " + listCount);
		System.out.println("getSellerRequestexchangeListForm 사이즈 : " + sellerExchangeList.size());
		model.addAttribute("ordersPagenation", ordersPagenation);
		

		
	
		return "/seller/orders/seller-reqexchangeorders-manage";
	}



	@RequestMapping(value = "/seller/seller-reqreturnorders-manage", method = RequestMethod.GET)
	public String getSellerReqreTurnOrders(@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
			@RequestParam(value = "keywordType", required = false, defaultValue = "STATUS") String keywordType,
			HttpSession session, Model model) {

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("user", "판매자");
		map.put("USER_ID", (String)session.getAttribute("USER_ID"));
		System.out.println("userID값" + (String)session.getAttribute("USER_ID"));
		map.put("keyword", keyword);
		map.put("page", page);
		map.put("currentPage", (page - 1) * 10);
		map.put("keywordType", keywordType);
		System.out.println(keywordType);
		System.out.println(keyword);

		List<OrdersVO> sellerReturnList = ordersService.sellerOrdersReturnList(map);
		int listCount = ordersService.sellerOrdersReturnListCount(map);

		OrdersBuyerPagenation ordersPagenation = new OrdersBuyerPagenation(sellerReturnList, sellerReturnList,
				(int) map.get("page"), listCount, (String) map.get("keyword"), (String) map.get("type1"),
				(String) map.get("type2"), (String) map.get("sort"), (String) map.get("keywordType"));

		System.out.println("getSellerRequestexchangeListForm 실행");
		System.out.println("getSellerRequestexchangeListForm 리스트 카운트 : " + listCount);
		System.out.println("getSellerRequestexchangeListForm 사이즈 : " + sellerReturnList.size());
		model.addAttribute("ordersPagenation", ordersPagenation);

		System.out.println("SellerOrdersController getSellerReqreTurnOrders 실행");

		return "/seller/orders/seller-reqreturnorders-manage";
	}

	

	
	
	
	
	
	
	
	
	@RequestMapping(value = "/seller/seller-orderslist-manage", method = RequestMethod.GET)
	public String getSellerOrdersListForm(@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
			@RequestParam(value = "keywordType", required = false, defaultValue = "STATUS") String keywordType,
			HttpSession session, Model model) {

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("user", "판매자");
		map.put("USER_ID", (String)session.getAttribute("USER_ID"));
		System.out.println("userID값" + (String)session.getAttribute("USER_ID"));
		map.put("keyword", keyword);
		map.put("page", page);
		map.put("currentPage", (page - 1) * 10);
		map.put("keywordType", keywordType);
		System.out.println(keywordType);
		System.out.println(keyword);

		List<OrdersVO> sellerExchangeList = ordersService.sellerOrderList(map);
		int listCount = ordersService.sellerOrderListCount(map);

		OrdersBuyerPagenation ordersPagenation = new OrdersBuyerPagenation(sellerExchangeList, sellerExchangeList,
				(int) map.get("page"), listCount, (String) map.get("keyword"), (String) map.get("type1"),
				(String) map.get("type2"), (String) map.get("sort"), (String) map.get("keywordType"));

		System.out.println("getSellerRequestexchangeListForm 실행");
		System.out.println("getSellerRequestexchangeListForm 리스트 카운트 : " + listCount);
		System.out.println("getSellerRequestexchangeListForm 사이즈 : " + sellerExchangeList.size());
		model.addAttribute("ordersPagenation", ordersPagenation);

		return "/seller/orders/seller-orderslist-manage";
	}

	@RequestMapping(value = "/seller/seller-deliverylist-manage", method = RequestMethod.GET)
	public String getdeliverylistForm(@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
			@RequestParam(value = "keywordType", required = false, defaultValue = "STATUS") String keywordType,
			HttpSession session, Model model) {

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("user", "판매자");
		map.put("USER_ID", (String)session.getAttribute("USER_ID"));
		System.out.println("userID값" + (String)session.getAttribute("USER_ID"));
		map.put("keyword", keyword);
		map.put("page", page);
		map.put("currentPage", (page - 1) * 10);
		map.put("keywordType", keywordType);
		System.out.println(keywordType);
		System.out.println(keyword);

		List<OrdersVO> sellerExchangeList = ordersService.sellerdeliverylist(map);
		System.out.println("seller-deliverylist-manage s List<OrdersVO>sellerExchangeList 까지");
		int listCount = ordersService.sellerdeliverylistCount(map);

		OrdersBuyerPagenation ordersPagenation = new OrdersBuyerPagenation(sellerExchangeList, sellerExchangeList,
				(int) map.get("page"), listCount, (String) map.get("keyword"), (String) map.get("type1"),
				(String) map.get("type2"), (String) map.get("sort"), (String) map.get("keywordType"));

		System.out.println("seller-deliverylist-manage 실행");
		System.out.println("seller-deliverylist-manage 리스트 카운트 : " + listCount);
		System.out.println("seller-deliverylist-manage 사이즈 : " + sellerExchangeList.size());
		model.addAttribute("ordersPagenation", ordersPagenation);

		return "/seller/orders/seller-deliverylist-manage";
	}

	@RequestMapping(value = "/seller/seller-exchangecompleteList-manage", method = RequestMethod.GET)
	public String exchangecompleteList(@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
			@RequestParam(value = "keywordType", required = false, defaultValue = "STATUS") String keywordType,
			HttpSession session, Model model) {

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("user", "판매자");
		map.put("USER_ID", (String)session.getAttribute("USER_ID"));
		System.out.println("userID값" + (String)session.getAttribute("USER_ID"));
		map.put("keyword", keyword);
		map.put("page", page);
		map.put("currentPage", (page - 1) * 10);
		map.put("keywordType", keywordType);
		System.out.println(keywordType);
		System.out.println(keyword);

		List<OrdersVO> sellerExchangeList = ordersService.exchangecompleteList(map);
		System.out.println("List<OrdersVO>exchangecompleteList 까지");
		int listCount = ordersService.exchangecompleteListCount(map);

		OrdersBuyerPagenation ordersPagenation = new OrdersBuyerPagenation(sellerExchangeList, sellerExchangeList,
				(int) map.get("page"), listCount, (String) map.get("keyword"), (String) map.get("type1"),
				(String) map.get("type2"), (String) map.get("sort"), (String) map.get("keywordType"));

		System.out.println("exchangecompleteList 실행");
		System.out.println("exchangecompleteList 리스트 카운트 : " + listCount);
		System.out.println("exchangecompleteList 사이즈 : " + sellerExchangeList.size());
		model.addAttribute("ordersPagenation", ordersPagenation);

		return "/seller/orders/orders-exchangecompleteList";
	}

	@RequestMapping(value = "/seller/seller-exchangeimpossibleList-manage", method = RequestMethod.GET)
	public String exchangeimpossibleList(@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
			@RequestParam(value = "keywordType", required = false, defaultValue = "STATUS") String keywordType,
			HttpSession session, Model model) {

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("user", "판매자");
		map.put("USER_ID", (String)session.getAttribute("USER_ID"));
		System.out.println("userID값" + (String)session.getAttribute("USER_ID"));
		map.put("keyword", keyword);
		map.put("page", page);
		map.put("currentPage", (page - 1) * 10);
		map.put("keywordType", keywordType);
		System.out.println(keywordType);
		System.out.println(keyword);

		List<OrdersVO> sellerExchangeList = ordersService.exchangeimpossibleList(map);
		System.out.println("List<OrdersVO>exchangecompleteList 까지");
		int listCount = ordersService.exchangeimpossibleListCount(map);

		OrdersBuyerPagenation ordersPagenation = new OrdersBuyerPagenation(sellerExchangeList, sellerExchangeList,
				(int) map.get("page"), listCount, (String) map.get("keyword"), (String) map.get("type1"),
				(String) map.get("type2"), (String) map.get("sort"), (String) map.get("keywordType"));

		System.out.println("exchangecompleteList 실행");
		System.out.println("exchangecompleteList 리스트 카운트 : " + listCount);
		System.out.println("exchangecompleteList 사이즈 : " + sellerExchangeList.size());
		model.addAttribute("ordersPagenation", ordersPagenation);

		return "/seller/orders/orders-exchangeimpossibleList";
	}

	@RequestMapping(value = "/seller/seller-returncompleteList-manage", method = RequestMethod.GET)
	public String returncompleteList(@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
			@RequestParam(value = "keywordType", required = false, defaultValue = "STATUS") String keywordType,
			HttpSession session, Model model) {

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("user", "판매자");
		map.put("USER_ID", (String)session.getAttribute("USER_ID"));
		System.out.println("userID값" + (String)session.getAttribute("USER_ID"));
		map.put("keyword", keyword);
		map.put("page", page);
		map.put("currentPage", (page - 1) * 10);
		map.put("keywordType", keywordType);
		System.out.println(keywordType);
		System.out.println(keyword);

		List<OrdersVO> sellerExchangeList = ordersService.returncompleteList(map);
		System.out.println("List<OrdersVO>exchangecompleteList 까지");
		int listCount = ordersService.returncompleteListCount(map);

		OrdersBuyerPagenation ordersPagenation = new OrdersBuyerPagenation(sellerExchangeList, sellerExchangeList,
				(int) map.get("page"), listCount, (String) map.get("keyword"), (String) map.get("type1"),
				(String) map.get("type2"), (String) map.get("sort"), (String) map.get("keywordType"));

		System.out.println("exchangecompleteList 실행");
		System.out.println("exchangecompleteList 리스트 카운트 : " + listCount);
		System.out.println("exchangecompleteList 사이즈 : " + sellerExchangeList.size());
		model.addAttribute("ordersPagenation", ordersPagenation);

		return "/seller/orders/seller-returncompleteList";
	}

	@RequestMapping(value = "/seller/seller-returnimpossibleList-manage", method = RequestMethod.GET)
	public String returnimpossibleList(@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
			@RequestParam(value = "keywordType", required = false, defaultValue = "STATUS") String keywordType,
			HttpSession session, Model model) {

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("user", "판매자");
		map.put("USER_ID", (String)session.getAttribute("USER_ID"));
		System.out.println("userID값" + (String)session.getAttribute("USER_ID"));
		map.put("keyword", keyword);
		map.put("page", page);
		map.put("currentPage", (page - 1) * 10);
		map.put("keywordType", keywordType);
		System.out.println(keywordType);
		System.out.println(keyword);

		List<OrdersVO> sellerExchangeList = ordersService.returnimpossibleList(map);
		System.out.println("List<OrdersVO>exchangecompleteList 까지");
		int listCount = ordersService.returnimpossibleListCount(map);

		OrdersBuyerPagenation ordersPagenation = new OrdersBuyerPagenation(sellerExchangeList, sellerExchangeList,
				(int) map.get("page"), listCount, (String) map.get("keyword"), (String) map.get("type1"),
				(String) map.get("type2"), (String) map.get("sort"), (String) map.get("keywordType"));

		System.out.println("exchangecompleteList 실행");
		System.out.println("exchangecompleteList 리스트 카운트 : " + listCount);
		System.out.println("exchangecompleteList 사이즈 : " + sellerExchangeList.size());
		model.addAttribute("ordersPagenation", ordersPagenation);

		return "/seller/orders/seller-returnimpossibleList";
	}

}