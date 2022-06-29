package kr.co.rudisfarm.model.payment;

import java.net.URI;
import java.net.URISyntaxException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;

import org.apache.commons.lang3.RandomStringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
import kr.co.rudisfarm.model.payment.apivo.KakaoPayReadyAPIVO;

@Service
public class SellerKakaoService {
	
	
	private static final Logger logger = LoggerFactory.getLogger(KakaoService.class);

	private static final String HOST = "https://kapi.kakao.com";

	private KakaoPayReadyAPIVO kakaoPayReadyAPIVO;
	private KakaoPayApprovalAPIVO kakaoPayApprovalAPIVO;
	
	private HashMap<String, Object> keyNAmount = new HashMap<String, Object>();
	private HashMap<String, Object> paymentInfo = new HashMap<String, Object>();

	public void MakeRandomKey(String USER_ID) {
		String uniqueKey ="";
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmssSSS");
		Calendar dateTime = Calendar.getInstance();
		uniqueKey = sdf.format(dateTime.getTime());
		uniqueKey = RandomStringUtils.randomAlphanumeric(2)+uniqueKey;
		
		keyNAmount.put("uniqueKey", uniqueKey);
	}
	
	public String kakaoPayReady(String USER_ID) throws Exception {

		logger.info("서비스 들어오는가");

		RestTemplate restTemplate = new RestTemplate();

		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK " + "b86509cfd77035607bc91e5854a2acbc");
		headers.add("Accept", MediaType.APPLICATION_JSON_VALUE + ";charset=UTF-8");
		headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");

		MakeRandomKey(USER_ID);
		
		PremiumVO premiumInfo = new PremiumVO();
		premiumInfo.setUSER_ID(USER_ID);
		keyNAmount.put("premiumInfo", premiumInfo);
		
		paymentInfo.put(USER_ID, keyNAmount);
		
		
		MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
		params.add("cid", "TC0ONETIME");
		params.add("partner_order_id", ((HashMap<String, String>)paymentInfo.get(USER_ID)).get("uniqueKey"));
		params.add("partner_user_id", USER_ID);
		params.add("item_name", "Premium 회원 1개월권");
		params.add("quantity", "1");
		params.add("total_amount", "9900");
		params.add("vat_amount", "0");
		params.add("tax_free_amount", "0");
		params.add("approval_url", "http://localhost:8088/rudisfarm/premium/kakaopaySuccess");
		params.add("cancel_url", "http://localhost:8088/rudisfarm/payment/kakaoPayCancel");
		params.add("fail_url", "http://localhost:8088/rudisfarm/payment/kakaoPaySuccessFail");

		HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);

		System.out.println("------------------------------");
		System.out.println(body.getHeaders().toString());
		System.out.println(body.getBody().toString());
		System.out.println("------------------------------");

		try {
			kakaoPayReadyAPIVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body,
					KakaoPayReadyAPIVO.class);
			logger.info("response kakao : " + kakaoPayReadyAPIVO.toString());
			System.out.println(kakaoPayReadyAPIVO.getNext_redirect_pc_url());
			
			return kakaoPayReadyAPIVO.getNext_redirect_pc_url();

		} catch (RestClientException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (URISyntaxException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/rudisfarm";
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
		params.add("total_amount", "9900");
		
		PremiumVO premiumInfo = (PremiumVO)((HashMap<String, Object>)paymentInfo.get(USER_ID)).get("premiumInfo");
		
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
			kakaoPayInfoResult.put("premiumInfo", premiumInfo);
	
		} catch (RestClientException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (URISyntaxException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return kakaoPayInfoResult;
	}
}
