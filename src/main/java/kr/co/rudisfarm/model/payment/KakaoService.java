package kr.co.rudisfarm.model.payment;

import java.net.InetAddress;
import java.net.URI;
import java.net.URISyntaxException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.RandomStringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import kr.co.rudisfarm.model.orders.OrdersVO;
import kr.co.rudisfarm.model.payment.apivo.KakaoPayApprovalAPIVO;
import kr.co.rudisfarm.model.payment.apivo.KakaoPayCancelAPIVO;
import kr.co.rudisfarm.model.payment.apivo.KakaoPayOrderAPIVO;
import kr.co.rudisfarm.model.payment.apivo.KakaoPayReadyAPIVO;
import kr.co.rudisfarm.model.payment.impl.PaymentDAO;

@Service
public class KakaoService {
	@Autowired
	private PaymentDAO paymentDAO;
	
	private static final Logger logger = LoggerFactory.getLogger(KakaoService.class);

	private static final String HOST = "https://kapi.kakao.com";

	private KakaoPayReadyAPIVO kakaoPayReadyAPIVO;
	private KakaoPayApprovalAPIVO kakaoPayApprovalAPIVO;
	private KakaoPayOrderAPIVO kakaoPayOrderAPIVO;
	private KakaoPayCancelAPIVO kakaoPayCancelAPIVO;
	
	private HashMap<String, Object> keyNAmount = new HashMap<String, Object>();
	private HashMap<String, Object> paymentInfo = new HashMap<String, Object>();

	public void MakeRandomKey(String USER_ID) {
		String uniqueKey ="";
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmssSSS");
		Calendar dateTime = Calendar.getInstance();
		uniqueKey = sdf.format(dateTime.getTime());
		uniqueKey = RandomStringUtils.randomAlphanumeric(2)+uniqueKey;
		
//		paymentInfo.put(USER_ID, );
//		hashMapUniqueKey.put(USER_ID, uniqueKey);
		keyNAmount.put("uniqueKey", uniqueKey);
	}
	
	public String kakaoPayReady(HashMap<String, Object> jsonData, String USER_ID, HttpServletRequest request) throws Exception {

		logger.info("서비스 들어오는가");

		RestTemplate restTemplate = new RestTemplate();

		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK " + "b86509cfd77035607bc91e5854a2acbc");
		headers.add("Accept", MediaType.APPLICATION_JSON_VALUE + ";charset=UTF-8");
		headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
		
		String item_name = "";
		int total_amountInt = 0;
		String total_amount = "";
		String quantity = "";
		
		List<HashMap<String, Object>> jsonList = (List<HashMap<String, Object>>)jsonData.get("test");
		
		HashMap<String, Object> jsonProduct = ((HashMap<String, Object>)jsonList.get(0));
		
		System.out.println((String)jsonProduct.get("product_id"));
		System.out.println((String)jsonProduct.get("item_name"));
		System.out.println((String)jsonProduct.get("quantity"));
		
		item_name = (String)jsonProduct.get("item_name");
		total_amountInt += Integer.parseInt((String)jsonProduct.get("total_amount"));
		quantity = (String)jsonProduct.get("quantity");
		
		System.out.println((String)jsonProduct.get("total_amount"));

		total_amount = Integer.toString(total_amountInt);
		
		MakeRandomKey(USER_ID);
		keyNAmount.put("total_amount", total_amount);
		
		OrdersVO orderInfo = new OrdersVO();
		orderInfo.setUSER_ID(USER_ID);
		orderInfo.setUSER_NAME((String)jsonData.get("USER_NAME"));
		orderInfo.setPHONE((String)jsonData.get("PHONE"));
		orderInfo.setFIR_ADDRESS((String)jsonData.get("FIR_ADDRESS"));
		orderInfo.setSEC_ADDRESS((String)jsonData.get("SEC_ADDRESS"));
		orderInfo.setDELIVERY_MESSAGE((String)jsonData.get("DELIVERY_MESSAGE"));
		orderInfo.setPRODUCT_ID(Integer.parseInt((String)jsonProduct.get("product_id")));
		orderInfo.setCOUNT(Integer.parseInt(quantity));
		orderInfo.setPRICE(total_amountInt/Integer.parseInt(quantity));
		orderInfo.setTOTAL_PRICE(total_amountInt);
		keyNAmount.put("orderInfo", orderInfo);
		
		paymentInfo.put(USER_ID, keyNAmount);
		
		InetAddress inet = InetAddress.getLocalHost();
		String ip = inet.getHostAddress();
		int portNum = request.getServerPort();
		
		System.out.println(ip + ":" + portNum);
		
		String address = "";
		
		if(!inet.getHostAddress().equals("52.79.54.117")) {
			ip = "localhost";
			portNum = 8088;
		}
		
		address = ip + ":" + portNum;
		
		if(inet.getHostAddress().equals("172.31.40.76")) {
			address = "www.rudisfarm.shop";
		}

		
		MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
		params.add("cid", "TC0ONETIME");
		params.add("partner_order_id", ((HashMap<String, String>)paymentInfo.get(USER_ID)).get("uniqueKey"));
		params.add("partner_user_id", USER_ID);
		params.add("item_name", item_name);
		params.add("quantity", quantity);
		params.add("total_amount", ((HashMap<String, String>)paymentInfo.get(USER_ID)).get("total_amount"));
		params.add("vat_amount", "0");
		params.add("tax_free_amount", "0");
//		params.add("approval_url", "http://www.rudisfarm.shop/rudisfarm/payment/kakaoPaySuccess");
//		params.add("cancel_url", "http://www.rudisfarm.shop/rudisfarm/payment/kakaoPaymentCancel");
//		params.add("fail_url", "http://www.rudisfarm.shop/rudisfarm/payment/kakaoPaySuccessFail");
		params.add("approval_url", "http://" + address +"/rudisfarm/payment/kakaoPaySuccess");
		params.add("cancel_url", "http://" + address +"/rudisfarm/payment/kakaoPaymentCancel");
		params.add("fail_url", "http://" + address +"/rudisfarm/payment/kakaoPaySuccessFail");

		HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);

		System.out.println("------------------------------");
		System.out.println(body.getHeaders().toString());
		System.out.println(body.getBody().toString());
		System.out.println("------------------------------");

		try {
			// ResponseEntity<String> responseEntity = restTemplate.postForEntity(new
			// URI(HOST + "/v1/payment/ready"), body, String.class);
			kakaoPayReadyAPIVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body,
					KakaoPayReadyAPIVO.class);
			logger.info("response kakao : " + kakaoPayReadyAPIVO.toString());
			// ObjectMapper obm = new ObjectMapper();
			// KakaoPayReadyVO result = obm.readValue(responseEntity.getBody(),
			// KakaoPayReadyVO.class);

			return kakaoPayReadyAPIVO.getNext_redirect_pc_url();

		} catch (RestClientException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (URISyntaxException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/index";
	}

	public HashMap<String, Object> kakaoPayInfo(String pg_token, String USER_ID) throws Exception {

		logger.info("KakaoPayInfoVO............................................");

		RestTemplate restTemplate = new RestTemplate();

		// 서버로 요청할 Header
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK " + "b86509cfd77035607bc91e5854a2acbc");
		headers.add("Accept", MediaType.APPLICATION_JSON_VALUE + ";charset=UTF-8");
		headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");

		// 서버로 요청할 Body
		MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
		params.add("cid", "TC0ONETIME"); 
		params.add("tid", kakaoPayReadyAPIVO.getTid());
		params.add("partner_order_id", ((HashMap<String, String>)paymentInfo.get(USER_ID)).get("uniqueKey"));
		params.add("partner_user_id", USER_ID);
		params.add("pg_token", pg_token);
		params.add("total_amount", ((HashMap<String, String>)paymentInfo.get(USER_ID)).get("total_amount"));
		
		OrdersVO orderInfo = (OrdersVO)((HashMap<String, Object>)paymentInfo.get(USER_ID)).get("orderInfo");
		
		// 성공적으로 고유키 사용시, 해시맵에서 해당 유저의 고유키 제거
		System.out.println(USER_ID);
		// 이미 사용한 유저의 결제 정보(고유키, 전체금액)을 삭제
		paymentInfo.remove(USER_ID);
		// 삭제 후 정상적으로 해시맵이 비워졌는지 조회
		System.out.println(paymentInfo.size()); 

		HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);

		System.out.println("--------------------------");
		logger.info(body.getHeaders().toString());
		logger.info(body.getBody().toString());
		System.out.println("--------------------------");
		
		HashMap<String, Object> kakaoPayInfoResult = new HashMap<String, Object>();

		try {

//				ResponseEntity<String> responseEntity = restTemplate.postForEntity(new URI(HOST + "/v1/payment/approve"), body, String.class);
//				ObjectMapper obm = new ObjectMapper();
//				kakaoPayApprovalVO = obm.readValue(responseEntity.getBody(), KakaoPayApprovalVO.class);

			kakaoPayApprovalAPIVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/approve"), body,
					KakaoPayApprovalAPIVO.class);
			
			kakaoPayInfoResult.put("kakaoPayApprovalAPIVO", kakaoPayApprovalAPIVO);
			kakaoPayInfoResult.put("orderInfo", orderInfo);
	
		} catch (RestClientException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (URISyntaxException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return kakaoPayInfoResult;

	}

	public KakaoPayOrderAPIVO kakaoPayOrder(String tid) throws Exception {

		logger.info("KakaoPayPayOrder..........");

		RestTemplate restTemplate = new RestTemplate();

		// 서버로 요청할 Header
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK " + "b86509cfd77035607bc91e5854a2acbc");
		headers.add("Accept", MediaType.APPLICATION_JSON_VALUE + ";charset=UTF-8");
		headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");

		// 서버로 요청할 Body
		MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
		params.add("cid", "TC0ONETIME");
		params.add("tid", tid);

		HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);

		System.out.println("--------------------------");
		logger.info(body.getHeaders().toString());
		logger.info(body.getBody().toString());
		System.out.println("--------------------------");

		try {

//				ResponseEntity<String> responseEntity = restTemplate.postForEntity(new URI(HOST + "/v1/payment/approve"), body, String.class);
//				ObjectMapper obm = new ObjectMapper();
//				kakaoPayApprovalVO = obm.readValue(responseEntity.getBody(), KakaoPayApprovalVO.class);

			kakaoPayOrderAPIVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/order"), body,
					KakaoPayOrderAPIVO.class);

		} catch (RestClientException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (URISyntaxException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return kakaoPayOrderAPIVO;
	}

	public KakaoPayCancelAPIVO kakaoPayCancel(String tid) throws Exception {

		logger.info("KakaoPayPayOrder..........");

		RestTemplate restTemplate = new RestTemplate();

		// 서버로 요청할 Header
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK " + "b86509cfd77035607bc91e5854a2acbc");
		headers.add("Accept", MediaType.APPLICATION_JSON_VALUE + ";charset=UTF-8");
		headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");

		// 서버로 요청할 Body
		MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
		params.add("cid", "TC0ONETIME");
		params.add("tid", tid);
		params.add("cancel_amount", Integer.toString(paymentDAO.selectPaymentfromTID(tid).getTOTAL_AMOUNT()));
		params.add("cancel_tax_free_amount", "0");

		HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);

		System.out.println("--------------------------");
		logger.info(body.getHeaders().toString());
		logger.info(body.getBody().toString());
		System.out.println("--------------------------");

		try {

//				ResponseEntity<String> responseEntity = restTemplate.postForEntity(new URI(HOST + "/v1/payment/cancel"), body, String.class);
//				ObjectMapper obm = new ObjectMapper();
//				kakaoPayCancelVO = obm.readValue(responseEntity.getBody(), KakaoPayCancelVO.class);

			kakaoPayCancelAPIVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/cancel"), body,
					KakaoPayCancelAPIVO.class);

		} catch (RestClientException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (URISyntaxException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return kakaoPayCancelAPIVO;
	}
}
