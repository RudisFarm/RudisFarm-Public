package kr.co.rudisfarm.model.commons.aysnc;

import java.util.HashMap;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

@Service("AsyncMailSendTask")
public class AsyncMailSendTask {
	@Autowired
	private JavaMailSender mailSender;
	
	private String setFrom = "rudisfarmad@gmail.com";
    private String title = "";
    private String content = "";
    
    @Async("executorSample")
	public void sellerJoinSuccess(String toMail) {
    	title = "루디스팜 판매자 회원가입 신청이 정상적으로 완료되었습니다.";
    	content = "신청하신 판매자 정보 및 상품 정보를 검토한 후 처리해드리겠습니다.<br>"
    			+ "가입 신청 결과는 이메일로 다시 안내드릴 예정입니다. 감사합니다.";
    	
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
	        helper.setTo(toMail);
	        helper.setSubject(title);
	        helper.setText(content, true);
	        mailSender.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
    }
    
    //판매자 orders 배송 시작 이메일용 메소드 
    @Async("executorSample")
	public void sellerdeliverySuccess(String toMail, String number, String ORDERS_NAME, String PRODUCT_NAME) {
    	title = "루디스팜 배송이 시작됐습니다.";
    	content = "주문하신 상품명\n" + PRODUCT_NAME + "<br>" + "운송장 번호 : " +  number + "<br>" + "주문 번호 : " + ORDERS_NAME  + "<br>" +"상품명 : "+ PRODUCT_NAME
    			+ "<br><br><br>" + "물품이 도착하지 않을경우 판매자 번호로 연락 부탁드립니다.<br> " + " 감사합니다.";
    	
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
	        helper.setTo(toMail);
	        helper.setSubject(title);
	        helper.setText(content, true);
	        mailSender.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
    }
    
	
	@Async("executorSample")
	public void sellerUpdateSuccess(String toMail, int status) {
		System.out.println("==============>>>>>>>>>>>> THREAD START");
		
		if(status == 1) {
    		title = "루디스팜 판매자 상태가 승인으로 변경되었습니다.";
    		content = "루디스팜 판매자 상태가 승인으로 변경되었습니다. 판매자 관리 페이지의 모든 기능을 정상 사용하실 수 있습니다.";
    	} else if(status == 2) {
    		title = "루디스팜 판매자 상태가 정지로 변경되었습니다.";
    		content = "운영 정책 위반 또는 품질 유지 불량으로 인해 이용 정지되었습니다. 자세한 내용은 루디스팜 관리자에게 문의하세요.";
    	} else if(status == 3) {
    		title = "루디스팜 판매자 재승인 신청이 완료되었습니다.";
    		content = "루디스팜 판매자 재승인 신청이 완료되었습니다. 확인 후 이메일로 안내드리겠습니다. 상품 판매가 일시 정지되나, 이외의 기능은 정상적으로 이용하실 수 있습니다.";
    	} else if(status == 4) {
    		title = "루디스팜 판매자 재승인 신청이 거부되었습니다.";
    		content = "루디스팜 판매자 재승인 신청이 거부되었습니다. 사업자 등록 번호와 증빙 파일 누락 여부를 확인한 후 다시 신청해주세요. 자세한 내용은 루디스팜 관리자에게 문의하세요.";
    	} else if(status == 6) {
    		title = "루디스팜 판매자 회원가입이 거부되었습니다.";
    		content = "루디스팜 판매자 회원가입이 거부되었습니다. 사업자 등록 번호와 증빙 파일 누락 여부 및 상품 정보를 다시 한 번 확인하고 다시 회원가입해주세요. 자세한 내용은 루디스팜 관리자에게 문의하세요.";
    	}
    	
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
	        helper.setTo(toMail);
	        helper.setSubject(title);
	        helper.setText(content, true);
	        mailSender.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		System.out.println("==============>>>>>>>>>>>> THREAD END");
	}
	
	@Async("executorSample")
	public void sellerEmailCheck(String EMAIL, HashMap<String, HashMap<String, String>> emailCheckMap, String CHECK_TYPE) {
		System.out.println("==============>>>>>>>>>>>> THREAD START");
		String title = "루디스팜 이메일 인증 번호 안내입니다.";
    	if(CHECK_TYPE == "1") {
            content = "저희 루디스팜에 방문해주시어 감사드립니다." + "<br>" + 
        				"다음 인증 번호를 회원가입 양식에 기입하여 주십시오. 인증번호 확인란에 기입하여 주세요." + "<br>" + 
        				"인증 번호 : " + emailCheckMap.get(EMAIL).get(CHECK_TYPE);
    	} else if(CHECK_TYPE == "2") {
    		content = "루디스팜 아이디 찾기 인증코드입니다." + "<br>" + 
        				"다음 인증 번호를 아이디 찾기 양식에 기입하여 주십시오. 인증번호 확인란에 기입하여 주세요." + "<br>" + 
        				"인증 번호 : " + emailCheckMap.get(EMAIL).get(CHECK_TYPE);
    	} else if(CHECK_TYPE == "3") {
    		content = "루디스팜 비밀번호 찾기 인증코드입니다." + "<br>" + 
    				"다음 인증 번호를 비밀번호 찾기 양식에 기입하여 주십시오. 인증번호 확인란에 기입하여 주세요." + "<br>" + 
    				"인증 번호 : " + emailCheckMap.get(EMAIL).get(CHECK_TYPE);
    	}
    	
    	System.out.println("인증키 : " + emailCheckMap.get(EMAIL).get(CHECK_TYPE));
    	
        
        try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
	        helper.setTo(EMAIL);
	        helper.setSubject(title);
	        helper.setText(content, true);
	        mailSender.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		
		System.out.println("==============>>>>>>>>>>>> THREAD END");
	}
	
	 @Async("executorSample")
	public void sellerExchangeSuccess(String toMail, boolean isSuccess) {
		 if(isSuccess) {
			 title = "저희 루디스팜을 이용해 주셔서 감사합니다.";
	    	content = "고객님의 교환처리 신청이 정상적으로 완료되었습니다." + "<br>"
	    				+ "자세한 내용은 홈페이지를 확인해 주시기 바랍니다.";
		 } else {
			 title = "저희 루디스팜을 이용해 주셔서 감사합니다.";
	    	content = "고객님의 교환처리 신청이  교환 불가 처리되었습니다." + "<br>" + 
	    				"자세한 내용은 홈페이지를 확인해 주시기 바랍니다.";
		 }
    	
    	
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
	        helper.setTo(toMail);
	        helper.setSubject(title);
	        helper.setText(content, true);
	        mailSender.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
    }
	 
	 @Async("executorSample")
		public void sellerReturnSuccess(String toMail, boolean isSuccess) {
			 if(isSuccess) {
				 title = "저희 루디스팜을 이용해 주셔서 감사합니다.";
		    	content = "고객님의 반품처리 신청이 정상적으로 완료되었습니다."+"<br>"
		    				+"자세한 내용은 홈페이지를 확인해 주시기 바랍니다.";
			 } else {
				 title = "저희 루디스팜을 이용해 주셔서 감사합니다.";
		    	content = "고객님의 반품처리 신청이  반품 불가 처리되었습니다." + "<br>"
		    				+ "자세한 내용은 홈페이지를 확인해 주시기 바랍니다.";
			 }
	    	
	    	
			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
				helper.setFrom(setFrom);
		        helper.setTo(toMail);
		        helper.setSubject(title);
		        helper.setText(content, true);
		        mailSender.send(message);
			} catch (MessagingException e) {
				e.printStackTrace();
			}
	    }
	
	
	//<구매자>
	
	//구매자 가입 성공 메일
	@Async("executorSample")
	public void buyerJoinSuccess(String toMail) {
    	title = "루디스팜 회원 가입이 정상적으로 완료되었습니다.";
    	content = "저희 루디스팜의 가족이 되어 주셔서 감사합니다." + "<br>" + "항상 고객님을 위하여 성섬성의를 다하는 모습을 보여드리겠습니다.";
    	
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
	        helper.setTo(toMail);
	        helper.setSubject(title);
	        helper.setText(content, true);
	        mailSender.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
    }
	
	//구매자 인증번호 보내기
	@Async("executorSample")
	public void buyerEmailCheck(String EMAIL, HashMap<String, HashMap<String, String>> emailCheckMap, String CHECK_TYPE) {
		System.out.println("==============>>>>>>>>>>>> THREAD START");
		String title = "루디스팜 이메일 인증 번호 안내입니다.";
    	if(CHECK_TYPE == "1") {
            content = "저희 루디스팜에 방문해주시어 감사드립니다." + "<br>" + 
        				"다음 인증 번호를 회원가입 양식에 기입하여 주십시오." + "<br>" + 
        				"인증 번호 : " + emailCheckMap.get(EMAIL).get(CHECK_TYPE);
			/*
			 * } else if(CHECK_TYPE == "2") { content = "루디스팜 아이디 찾기 서비스입니다." + "<br>" +
			 * "회원님의 아이디는 다음과 같습닏다." + "<br>" + "인증 번호 : " +
			 * emailCheckMap.get(EMAIL).get(CHECK_TYPE);
			 */
    	} else if(CHECK_TYPE == "2") {
    		content = "루디스팜 비밀번호 찾기 인증코드입니다." + "<br>" + 
    				"다음 인증 번호를 비밀번호 찾기 양식에 기입하여 주십시오." + "<br>" + 
    				"인증 번호 : " + emailCheckMap.get(EMAIL).get(CHECK_TYPE);
    	} else if(CHECK_TYPE == "3") {
    		content = "루디스팜 회원 비밀번호 찾기 임시 비밀번호입니다." + "<br>" + 
    				"임시 비밀번호는 " + emailCheckMap.get(EMAIL).get(CHECK_TYPE) + "입니다." + "<br>"+
    				"로그인 후 반드시 비밀번호를 변경하여 주시기 바랍니다.";
    	} else if(CHECK_TYPE == "4") {
    		content = "루디스팜 회원 탈퇴 본인 인증코드입니다." + "<br>" + 
    				"다음 인증 번호를 양식에 기입하여 주십시오." + "<br>" + 
    				"인증 번호 : " + emailCheckMap.get(EMAIL).get(CHECK_TYPE);
    	}
        
        try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
	        helper.setTo(EMAIL);
	        helper.setSubject(title);
	        helper.setText(content, true);
	        mailSender.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		
		System.out.println("==============>>>>>>>>>>>> THREAD END");
	}
}
