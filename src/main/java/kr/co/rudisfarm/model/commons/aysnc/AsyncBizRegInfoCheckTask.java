package kr.co.rudisfarm.model.commons.aysnc;

import java.util.List;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import kr.co.rudisfarm.model.commons.api.BizRegInfoChecker;
import kr.co.rudisfarm.model.user.UserVO;
import kr.co.rudisfarm.model.user.impl.UserDAO;

@Service("AsyncBizRegInfoCheckTask")
public class AsyncBizRegInfoCheckTask {
	BizRegInfoChecker bizRegInfoChecker;
	
	@Autowired
	UserDAO userDAO;

	@Async("executorSample")
	public void BizRegInfoCheckTask() {
		System.out.println("==============>>>>>>>>>>>> BizRegInfoCheckTask THREAD START");
		String pattern = "^[0-9]{3}-[0-9]{2}-[0-9]{5}$"; //숫자만
		
		while(true) {
			List<UserVO> sellerList = userDAO.selectAllSellerList();
			for(UserVO seller : sellerList) {
				if(Pattern.matches(pattern, seller.getSERIAL()) && seller.getSTATUS() == 1) {
					bizRegInfoChecker = new BizRegInfoChecker();
				
					String SERIAL_RESULT = bizRegInfoChecker.postCRN(seller.getSERIAL());
					UserVO updateSellerVO = new UserVO();
					updateSellerVO.setUSER_ID(seller.getUSER_ID());
					updateSellerVO.setSERIAL_RESULT(SERIAL_RESULT);
					
					if(SERIAL_RESULT.contains("폐업") || SERIAL_RESULT.contains("휴업") || SERIAL_RESULT.contains("등록되지 않은")) {
						updateSellerVO.setSTATUS(2);
					} else {
						updateSellerVO.setSTATUS(1);
					}
					
					try {
						Thread.sleep(100*5);
					} catch (InterruptedException e) {
						System.out.println("사업자인증번호 개별 조회 대기 실패");
					}
					
					userDAO.updaetAutoSellerSerial(updateSellerVO);
				}
			}
			try {
				Thread.sleep(1000*60*60*24*1);
			} catch (InterruptedException e) {
				System.out.println("사업자인증번호 자동 갱신 대기 실패");
			}
		}
	}
}
