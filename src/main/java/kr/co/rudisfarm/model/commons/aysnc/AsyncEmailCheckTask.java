package kr.co.rudisfarm.model.commons.aysnc;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

@Service("AsyncEmailCheckTask")
public class AsyncEmailCheckTask {
	
	@Async("executorSample")
	public void waitDeleteEmailCheck(String EMAIL, HashMap<String, HashMap<String, String>> emailCheckMap, String CHECK_TYPE, String validationKey) {
		System.out.println("==============>>>>>>>>>>>> waitDeleteEmailCheck THREAD START");
		try {
			Thread.sleep(1000*60);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		if(emailCheckMap.get(EMAIL).get(CHECK_TYPE).equals(validationKey)) {
			System.out.println("==============>>>>>>>>>>>>인증키 삭제");
			emailCheckMap.get(EMAIL).remove(CHECK_TYPE);
			if(emailCheckMap.get(EMAIL).size() == 0) {
				emailCheckMap.remove(EMAIL);
				System.out.println("==============>>>>>>>>>>>>이메일 키 삭제");
			}
		} else {
			System.out.println("==============>>>>>>>>>>>>인증키가 갱신되어 미삭제");
		}
		System.out.println(emailCheckMap.get(EMAIL).size());
		System.out.println("==============>>>>>>>>>>>> waitDeleteEmailCheck THREAD END");
	}
}
