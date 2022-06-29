package kr.co.rudisfarm.model.commons.service.emailCheck.impl;

import java.util.HashMap;
import java.util.Random;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.co.rudisfarm.model.commons.aysnc.AsyncConfig;
import kr.co.rudisfarm.model.commons.aysnc.AsyncEmailCheckTask;
import kr.co.rudisfarm.model.commons.aysnc.AsyncMailSendTask;
import kr.co.rudisfarm.model.commons.service.emailCheck.EmailCheckService;
import kr.co.rudisfarm.model.user.UserVO;
import kr.co.rudisfarm.model.user.impl.UserDAO;

@Service("EmailCheckService")
public class EmailCheckServiceImpl implements EmailCheckService {
	@Resource(name = "AsyncMailSendTask")
	private AsyncMailSendTask asyncMailSendTask;
	
	@Resource(name = "AsyncEmailCheckTask")
	private AsyncEmailCheckTask asyncEmailCheckTask;
	
    @Resource(name = "asyncConfig")
    private AsyncConfig asyncConfig;
    
    @Autowired
    UserDAO UserDAO;
    
    @Autowired
	BCryptPasswordEncoder pwEncoder;
    
    private HashMap<String, HashMap<String, String>> emailCheckMap = new HashMap<String, HashMap<String,String>>();

    // 인증코드 생성 및 메일 전송
	@Override
	public int sellerJoinEmailCheck(HashMap<String, Object> jsonData) {
		String CHECK_TYPE = "1"; // 회원가입 인증인 경우
		int resultCode;
		
		Random random = new Random();
		int validationKey = random.nextInt(888888) + 111111;
		
		try {
			if(asyncConfig.isSampleTaskExecute()) {
				String email = (String)jsonData.get("EMAIL");
				HashMap<String, String> jsonMap = new HashMap<String, String>();
				
				if(emailCheckMap.get(email) == null) {
					jsonMap.put(CHECK_TYPE, Integer.toString(validationKey));
					emailCheckMap.put(email, jsonMap);
					
					resultCode = 1;
					asyncMailSendTask.sellerEmailCheck(email, emailCheckMap, CHECK_TYPE);
					asyncEmailCheckTask.waitDeleteEmailCheck(email, emailCheckMap, CHECK_TYPE, Integer.toString(validationKey));
				} else {
//					emailCheckMap.get(email).put(CHECK_TYPE, Integer.toString(validationKey));
					
					resultCode = 2;
				}
				
				if(emailCheckMap.get(email) == null) {
					System.out.println("해당 이메일로 인증 요청된 정보가 없으므로 신규 발송");
					
				} else {
					System.out.println("해당 이메일로 인증 요청된 정보가 있으므로 대기");
					
				}
			} else {
				System.out.println("쓰레드 갯수 초과");
				resultCode = -1;
				
				return resultCode;
			}
		} catch (Exception e) {
			System.out.println("==============>>>>>>>>>>>> THREAD ERROR");
            System.out.println("TaskRejectedException : 등록 개수 초과");
            resultCode = -1;
            System.out.println("==============>>>>>>>>>>>> THREAD END");
            e.printStackTrace();
		}
		
		return resultCode;
	}
 
	// 인증코드 조회(비교) 
	@Override
	public int sellerJoinEmailCheckResult(HashMap<String, Object> jsonData) {
		String CHECK_TPYE = "1";
		int resultCode;
		
		String email = (String)jsonData.get("EMAIL");
		HashMap<String, String> jsonMap = emailCheckMap.get(email);
		
		if(jsonMap != null && (String)jsonData.get("CHECK_KEY") != null) {
			String key = jsonMap.get(CHECK_TPYE);
			if(key != null && key.equals((String)jsonData.get("CHECK_KEY"))) {
				resultCode = 1;
			} else {
				resultCode = 0;
			}
		} else {
			resultCode = 0;
		}
		
		return resultCode;
	}
	
	// 회원 가입 성공 안내 메일 발송
	@Override
	public void sellerJoinSuccess(String EMAIL) {
		try {
			if(asyncConfig.isSampleTaskExecute()) {
				asyncMailSendTask.sellerJoinSuccess(EMAIL);
			}
		} catch (Exception e) {
			System.out.println("==============>>>>>>>>>>>> THREAD ERROR");
            System.out.println("TaskRejectedException : 등록 개수 초과");
            System.out.println("==============>>>>>>>>>>>> THREAD END");
            e.printStackTrace();
		}
	}
	
	//<구매자>
	
	// 구매자 회원가입 인증 메일 생성 및 메일 전송
	@Override
	public int buyerJoinEmailCheck(HashMap<String, Object> jsonData) {
		String CHECK_TYPE = "1"; // 회원가입 인증인 경우
		int resultCode;
		
		Random random = new Random();
		int validationKey = random.nextInt(888888) + 111111;
		System.out.println("[구매자 회원가입 인증 코드] : " + validationKey);
		
		try {
			//현재 서버에 담긴 데이터가 이메일이 있는 상태인지 아닌지에 따라 다르게 담음
			if(asyncConfig.isSampleTaskExecute()) {
				String email = (String)jsonData.get("EMAIL");
				HashMap<String, String> jsonMap = new HashMap<String, String>();
				
				if(emailCheckMap.get(email) == null) {
					jsonMap.put(CHECK_TYPE, Integer.toString(validationKey));
					emailCheckMap.put(email, jsonMap);
				} else {
					emailCheckMap.get(email).put(CHECK_TYPE, Integer.toString(validationKey));
				}
				
				//이메일 보내기
				if(emailCheckMap.get(email) != null) {
					resultCode = 1;
					asyncMailSendTask.buyerEmailCheck(email, emailCheckMap, CHECK_TYPE); //수정
					asyncEmailCheckTask.waitDeleteEmailCheck(email, emailCheckMap, CHECK_TYPE, Integer.toString(validationKey));
				} else {
					resultCode = -1;
				}
			} else {
				System.out.println("쓰레드 갯수 초과");
				resultCode = -1;
				
				return resultCode;
			}
		} catch (Exception e) {
			System.out.println("==============>>>>>>>>>>>> THREAD ERROR");
            System.out.println("TaskRejectedException : 등록 개수 초과");
            resultCode = -1;
            System.out.println("==============>>>>>>>>>>>> THREAD END");
            e.printStackTrace();
		}
		
		return resultCode;
	}
	 
	// 구매자 가입 인증코드 조회(비교) 
	@Override
	public int buyerJoinEmailCheckResult(HashMap<String, Object> jsonData) {
		String CHECK_TPYE = "1";
		int resultCode;
		
		String email = (String)jsonData.get("EMAIL");
		HashMap<String, String> jsonMap = emailCheckMap.get(email);
		
		if(jsonMap != null && (String)jsonData.get("CHECK_KEY") != null) {
			String key = jsonMap.get(CHECK_TPYE);
			if(key != null && key.equals((String)jsonData.get("CHECK_KEY"))) {
				resultCode = 1;
			} else {
				resultCode = 0;
			}
		} else {
			resultCode = 0;
		}
		
		return resultCode;
	}
		
	// 구매자 회원 가입 성공 안내 메일 발송
	@Override
	public int buyerJoinSuccess(String EMAIL) {
		try {
			if(asyncConfig.isSampleTaskExecute()) {
				asyncMailSendTask.buyerJoinSuccess(EMAIL); //수정
			}
		} catch (Exception e) {
			System.out.println("==============>>>>>>>>>>>> THREAD ERROR");
            System.out.println("TaskRejectedException : 등록 개수 초과");
            System.out.println("==============>>>>>>>>>>>> THREAD END");
            e.printStackTrace();
		}
		
		return 0;
	}
	
	//구매자 비밀번호 찾기 인증코드 이메일 발송
	@Override
	public int buyerFindPwEmailCheck(HashMap<String, Object> jsonData) {
		String CHECK_TYPE = "2"; // 비밀번호 찾기인 경우
		int resultCode;
		
		Random random = new Random();
		int validationKey = random.nextInt(888888) + 111111;
		
		System.out.println("[이메일체크서비스임플 buyerFindPwEmailCheck]" + validationKey);
		try {
			if(asyncConfig.isSampleTaskExecute()) {
				String email = (String)jsonData.get("EMAIL");
				HashMap<String, String> jsonMap = new HashMap<String, String>();
				
				if(emailCheckMap.get(email) == null) {
					jsonMap.put(CHECK_TYPE, Integer.toString(validationKey));
					emailCheckMap.put(email, jsonMap);
				} else {
					emailCheckMap.get(email).put(CHECK_TYPE, Integer.toString(validationKey));
				}
				
				if(emailCheckMap.get(email) != null) {
					resultCode = 1;
					asyncMailSendTask.buyerEmailCheck(email, emailCheckMap, CHECK_TYPE); 
					asyncEmailCheckTask.waitDeleteEmailCheck(email, emailCheckMap, CHECK_TYPE, Integer.toString(validationKey));
				} else {
					resultCode = -1;
				}
			} else {
				System.out.println("쓰레드 갯수 초과");
				resultCode = -1;
				
				return resultCode;
			}
		} catch (Exception e) {
			System.out.println("==============>>>>>>>>>>>> THREAD ERROR");
            System.out.println("TaskRejectedException : 등록 개수 초과");
            resultCode = -1;
            System.out.println("==============>>>>>>>>>>>> THREAD END");
            e.printStackTrace();
		}
		
		return resultCode;
	}
	
	//구매자 비밀번호 찾기 인증코드 비교(조회)
	@Override
	public int buyerFindPwEmailCheckResult(HashMap<String, Object> jsonData) {
		String CHECK_TPYE = "2";
		int resultCode;
		
		String email = (String)jsonData.get("EMAIL");
		HashMap<String, String> jsonMap = emailCheckMap.get(email);
		
		if(jsonMap != null && (String)jsonData.get("CHECK_KEY") != null) {
			String key = jsonMap.get(CHECK_TPYE);
			if(key != null && key.equals((String)jsonData.get("CHECK_KEY"))) {
				resultCode = 1;
			} else {
				resultCode = 0;
			}
		} else {
			resultCode = 0;
		}
		
		return resultCode;
	}
	
	//구매자 비밀번호 찾기 임시 비밀번호 저장 후 이메일 발송
		@Override
		public int buyerFindPwEmailCheckUpdate(HashMap<String, Object> jsonData) {
			String CHECK_TYPE = "3"; // 임시 비밀번호 저장하고 보내기
			int resultCode;
			
			try {
				//현재 서버에 담긴 데이터가 이메일이 있는 상태인지 아닌지에 따라 다르게 담음
				if(asyncConfig.isSampleTaskExecute()) {
					String email = (String)jsonData.get("EMAIL");
					HashMap<String, String> jsonMap = new HashMap<String, String>();
					
					if(emailCheckMap.get(email) == null) {
						jsonMap.put(CHECK_TYPE, (String)jsonData.get("PASSWORD"));
						emailCheckMap.put(email, jsonMap);
					} else {
						emailCheckMap.get(email).put(CHECK_TYPE, (String)jsonData.get("PASSWORD"));
					}
					
					//이메일 보내기
					if(emailCheckMap.get(email) != null) {
						resultCode = 1;
						asyncMailSendTask.buyerEmailCheck(email, emailCheckMap, CHECK_TYPE); //수정
						asyncEmailCheckTask.waitDeleteEmailCheck(email, emailCheckMap, CHECK_TYPE, (String)jsonData.get("PASSWORD"));
					} else {
						resultCode = -1;
					}
				} else {
					System.out.println("쓰레드 갯수 초과");
					resultCode = -1;
					
					return resultCode;
				}
			} catch (Exception e) {
				System.out.println("==============>>>>>>>>>>>> THREAD ERROR");
	            System.out.println("TaskRejectedException : 등록 개수 초과");
	            resultCode = -1;
	            System.out.println("==============>>>>>>>>>>>> THREAD END");
	            e.printStackTrace();
			}
			
			return resultCode;
		}
	
	//구매자 탈퇴 본인 인증 메일 이메일 발송
	@Override
	public int buyerOutEmailCheck(HashMap<String, Object> jsonData) {
		String CHECK_TYPE = "4"; // 회원가입 인증인 경우
		int resultCode;
		
		Random random = new Random();
		int validationKey = random.nextInt(888888) + 111111;
		System.out.println("[구매자 탈퇴 본인 인증 번호] : " + validationKey);
		try {
			if(asyncConfig.isSampleTaskExecute()) {
				String email = (String)jsonData.get("EMAIL");
				HashMap<String, String> jsonMap = new HashMap<String, String>();
				
				if(emailCheckMap.get(email) == null) {
					jsonMap.put(CHECK_TYPE, Integer.toString(validationKey));
					emailCheckMap.put(email, jsonMap);
				} else {
					emailCheckMap.get(email).put(CHECK_TYPE, Integer.toString(validationKey));
				}
				
				if(emailCheckMap.get(email) != null) {
					resultCode = 1;
					asyncMailSendTask.buyerEmailCheck(email, emailCheckMap, CHECK_TYPE); 
					asyncEmailCheckTask.waitDeleteEmailCheck(email, emailCheckMap, CHECK_TYPE, Integer.toString(validationKey));
				} else {
					resultCode = -1;
				}
			} else {
				System.out.println("쓰레드 갯수 초과");
				resultCode = -1;
				
				return resultCode;
			}
		} catch (Exception e) {
			System.out.println("==============>>>>>>>>>>>> THREAD ERROR");
            System.out.println("TaskRejectedException : 등록 개수 초과");
            resultCode = -1;
            System.out.println("==============>>>>>>>>>>>> THREAD END");
            e.printStackTrace();
		}
		
		return resultCode;
	}
	
	//구매자 탈퇴 인증코드 비교(조회)
		@Override
		public int buyerOutEmailCheckResult(HashMap<String, Object> jsonData) {
			String CHECK_TPYE = "4";
			int resultCode;
			
			String email = (String)jsonData.get("EMAIL");
			HashMap<String, String> jsonMap = emailCheckMap.get(email);
			
			if(jsonMap != null && (String)jsonData.get("CHECK_KEY") != null) {
				String key = jsonMap.get(CHECK_TPYE);
				if(key != null && key.equals((String)jsonData.get("CHECK_KEY"))) {
					resultCode = 1;
				} else {
					resultCode = 0;
				}
			} else {
				resultCode = 0;
			}
			
			return resultCode;
		}
		
	//</구매자>
}
