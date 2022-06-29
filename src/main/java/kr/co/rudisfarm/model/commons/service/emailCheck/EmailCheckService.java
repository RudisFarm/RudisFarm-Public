package kr.co.rudisfarm.model.commons.service.emailCheck;

import java.util.HashMap;

import kr.co.rudisfarm.model.user.UserVO;

public interface EmailCheckService {
	public int sellerJoinEmailCheck(HashMap<String, Object> jsonData);
	public int sellerJoinEmailCheckResult(HashMap<String, Object> jsonData);
	public void sellerJoinSuccess(String EMAIL);
	
	// 구매자
	public int buyerJoinEmailCheck(HashMap<String, Object> jsonData);
	public int buyerJoinEmailCheckResult(HashMap<String, Object> jsonData);
	public int buyerJoinSuccess(String EMAIL);
	
	public int buyerFindPwEmailCheck(HashMap<String, Object> jsonData);
	public int buyerFindPwEmailCheckResult(HashMap<String, Object> jsonData);
	public int buyerFindPwEmailCheckUpdate(HashMap<String, Object> jsonData);
	public int buyerOutEmailCheck(HashMap<String, Object> jsonData);
	public int buyerOutEmailCheckResult(HashMap<String, Object> jsonData);
}
