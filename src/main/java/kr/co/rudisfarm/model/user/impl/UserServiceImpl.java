package kr.co.rudisfarm.model.user.impl;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.rudisfarm.model.commons.api.BizRegInfoChecker;
import kr.co.rudisfarm.model.commons.aysnc.AsyncConfig;
import kr.co.rudisfarm.model.commons.aysnc.AsyncMailSendTask;
import kr.co.rudisfarm.model.commons.pagenation.UserPagenation;
import kr.co.rudisfarm.model.product.ProductVO;
import kr.co.rudisfarm.model.product.impl.ProductDAO;

import kr.co.rudisfarm.model.user.UserService;
import kr.co.rudisfarm.model.user.UserVO;
import kr.co.rudisfarm.model.user.impl.UserDAO;

@Service("UserService")
public class UserServiceImpl implements UserService {

	@Autowired
	UserDAO userDAO;
	
	@Autowired
	ProductDAO productDAO;
	
	@Autowired
	BCryptPasswordEncoder pwEncoder;
	
	@Resource(name = "AsyncMailSendTask")
	private AsyncMailSendTask asyncMailSendTask;
	
    @Resource(name = "asyncConfig")
    private AsyncConfig asyncConfig;
	
	//관리자 전용 메소드
	@Override
	public UserVO getAdmin(UserVO vo) {
		return userDAO.getAdmin(vo);
	}
	@Override
	public void changeAdmin(UserVO vo) {
		userDAO.changeAdmin(vo);
	}
	@Override
	public String isAdminExists(UserVO vo) {
		return userDAO.isAdminExists(vo);
	}
	@Override
	public void createAdmin(UserVO vo) {
		userDAO.createAdmin(vo);
	}
	@Override
	public UserVO findAdmin(UserVO vo) {
		return userDAO.findAdmin(vo);
	}
	@Override
	public int checkAdmin(String EMAIL) {
		return userDAO.checkAdmin(EMAIL);
	}
	@Override
	public UserPagenation selectAdminBuyerList(HashMap<String, Object> pageInfo) {
		List<UserVO> sellerList = userDAO.selectAdminBuyerList(pageInfo);
		int listCount = userDAO.selectAdminBuyerListCount(pageInfo);
		UserPagenation userPagenation = new UserPagenation(sellerList, 
														(int)pageInfo.get("page"), 
														listCount, 
														(String)pageInfo.get("keyword"), 
														(String)pageInfo.get("sort"), 
														(String)pageInfo.get("keywordType"));
		
		return userPagenation;
	}
	
//	// 판매자 목록 조회
//	@Override
//	public List<UserVO> selectAdminSellerList() {
//		
//		return userDAO.selectAdminSellerList();
//	}
	
	// 판매자 목록 조회(페이징, 검색, 정렬)
	@Override
	public UserPagenation selectAdminSellerList(HashMap<String, Object> pageInfo) {
		List<UserVO> sellerList = userDAO.selectAdminSellerList(pageInfo);
		int listCount = userDAO.selectAdminSellerListCount(pageInfo);
		UserPagenation userPagenation = new UserPagenation(sellerList, 
														(int)pageInfo.get("page"), 
														listCount, 
														(String)pageInfo.get("keyword"), 
														(String)pageInfo.get("sort"), 
														(String)pageInfo.get("keywordType"));
		
		return userPagenation;
	}
	
	// 관리자의 판매자 계정 상태 수정
	@Override
	public int updateAdminSeller(String USER_ID, HashMap<String, Object> jsonData) {
		UserVO userVO = new UserVO();
		userVO.setUSER_ID(USER_ID);
		userVO.setSTATUS(Integer.parseInt((String)jsonData.get("STATUS")));
		System.out.println(userVO.toString());
		
		int resultCode = userDAO.updaetAdminSeller(userVO);
		
		if(resultCode == 1) {
			try {
				if(asyncConfig.isSampleTaskExecute()) {
					asyncMailSendTask.sellerUpdateSuccess((String)jsonData.get("EMAIL"), Integer.parseInt((String)jsonData.get("STATUS")));
				} else {
					System.out.println("쓰레드 갯수 초과");
				}
			} catch (Exception e) {
				System.out.println("==============>>>>>>>>>>>> THREAD ERROR");
	            System.out.println("TaskRejectedException : 등록 개수 초과");
	            System.out.println("==============>>>>>>>>>>>> THREAD END");
			}
		}
		
		return resultCode;
	}
	
	// 최고관리자의 판매자 회원 가입 거부
	@Override
	public int deleteAdminSeller(String USER_ID) {
		UserVO userVO = new UserVO();
		userVO.setUSER_ID(USER_ID);
		ProductVO productVO = new ProductVO();
		productVO.setUSER_ID(USER_ID);
		
		if(productDAO.deleteProductbyUserId(productVO) != 0 && userDAO.deleteAdminSeller(userVO) != 0) {
			return 1;
		}
		
		return 0;
	}
	@Override
	public List<UserVO> getBuyerList(UserVO vo) {
		return userDAO.getBuyerList(vo);
	}
	@Override
	public UserVO getBuyer(UserVO vo) {
		return userDAO.getBuyer(vo);
	}
	

	// 구매자 전용 메소드
	// 로그인
	@Override
	public UserVO userLogin(UserVO userVO) {
		return userDAO.userLogin(userVO);
	}

	// 바이어 가입
	@Override
	public int buyerJoin(UserVO userVO) {
		System.out.println("[유저 서비스 임플_userJoin]" + userVO);
		int joinResult;
		userVO.setUSER_ID(userVO.getUSER_ID());
		userVO.setPASSWORD(pwEncoder.encode(userVO.getPASSWORD()));
		userVO.setEMAIL(userVO.getEMAIL());
		userVO.setUSER_NAME(userVO.getUSER_NAME());
		userVO.setFIR_ADDRESS(userVO.getFIR_ADDRESS());
		userVO.setSEC_ADDRESS(userVO.getSEC_ADDRESS());
		userVO.setPHONE(userVO.getPHONE());
		userVO.setBIRTHDATE(userVO.getBIRTHDATE());
		userVO.setGENDER(userVO.getGENDER());
		userVO.setPLATFORM(userVO.getPLATFORM());

		joinResult = userDAO.buyerJoin(userVO);

		return joinResult;
	}
	
	//아이디 중복 확인
	@Override
	public int idCheck(String USER_ID) {
		int result = userDAO.CheckDuplication(USER_ID);
	
		return result;
	}

	// 이메일 중복 확인
	@Override
	public int emailCheck(String EMAIL) {
		int result = userDAO.emailCheckDuplication(EMAIL);

		return result;
	}

	// 패스워드 확인
	@Override
	public boolean passwordCheck(HashMap<String, Object> jsonData) {
		System.out.println("[passwordCheck_jsonData] :" + jsonData);

		String USER_ID = (String) jsonData.get("checkid");
//		System.out.println("[passwordCheck_USER_ID] :" + USER_ID);
//		System.out.println("[passwordCheck_PASSWORDD] :" + PASSWORD);

		String originPwd = userDAO.passwordCheck(USER_ID);
		
		boolean matchResult = pwEncoder.matches((String) jsonData.get("checkpwd"), originPwd);
		System.out.println("일치 여부  : " + matchResult);
		if (matchResult) {
			return true;
		} else {
			return false;
		}

	}

	
	// 판매자 회원 가입
	@Override
	public int sellerJoin(UserVO userVO) {
//		UserVO userVO = new UserVO();
//		userVO.setUSER_ID((String)jsonData.get("USER_ID"));
//		userVO.setPASSWORD((String)jsonData.get("PASSWORD"));
//		userVO.setEMAIL((String)jsonData.get("EMAIL"));
//		userVO.setNAME((String)jsonData.get("NAME"));
//		userVO.setFIR_ADDRESS((String)jsonData.get("FIR_ADDRESS"));
//		userVO.setSEC_ADDRESS((String)jsonData.get("SEC_ADDRESS"));
//		userVO.setPHONE((String)jsonData.get("PHONE"));
//		userVO.setSERIAL((String)jsonData.get("SERIAL"));
		
		return userDAO.sellerJoin(userVO);
	}
	
	@Override
	public int sellerJoinAndProduct(UserVO userVO) {
		
		return userDAO.sellerJoinAndProduct(userVO);
	}

	// 판매자 내 정보 조회
	@Override
	public UserVO selectSeller(UserVO userVO) {
		
		return userDAO.selectSeller(userVO);
	}
	
	// 판매자 내 정보 수정
	@Override
	public int updateSeller(String USER_ID, HashMap<String, Object> jsonData, HttpSession session) {
		UserVO userVO = new UserVO();
		userVO.setUSER_ID(USER_ID);
		userVO.setUSER_NAME((String)jsonData.get("USER_NAME"));
		userVO.setCOMPANY_NAME((String)jsonData.get("COMPANY_NAME"));
		userVO.setFIR_ADDRESS((String)jsonData.get("FIR_ADDRESS"));
		userVO.setSEC_ADDRESS((String)jsonData.get("SEC_ADDRESS"));
		userVO.setPHONE((String)jsonData.get("PHONE"));
		
		int resultCode = userDAO.updaetSeller(userVO);
		if(resultCode ==1) {
			session.setAttribute("USER_ID", userVO.getUSER_ID());
			session.setAttribute("EMAIL", userVO.getEMAIL());
			session.setAttribute("USER_NAME", userVO.getUSER_NAME());
			session.setAttribute("COMPANY_NAME", userVO.getCOMPANY_NAME());
		}
		
		return resultCode;
	}
	
	// 판매자 비밀번호 수정
	@Override
	public int updateSellerPassword(String USER_ID, HashMap<String, Object> jsonData) {
		if(!((String)jsonData.get("NEW_PASSWORD")).equals((String)jsonData.get("NEW_PASSWORD_CHECK"))) {
			return 2;
		}
		
//		UserVO checkUserVO = new UserVO();
//		checkUserVO.setUSER_ID(USER_ID);
//		checkUserVO.setPASSWORD((String)jsonData.get("CURRENT_PASSWORD"));
		
		UserVO newUserVO = new UserVO();
		newUserVO.setUSER_ID(USER_ID);
		newUserVO.setPASSWORD(pwEncoder.encode((String)jsonData.get("NEW_PASSWORD")));
		
		if(pwEncoder.matches((String)jsonData.get("CURRENT_PASSWORD"), userDAO.getUserByID(USER_ID).getPASSWORD())) {
			return userDAO.updaetSellerPassword(newUserVO);
		}
		
//		if(userDAO.selectCheckSellerPassword(checkUserVO) == 1) {
//			return userDAO.updaetSellerPassword(newUserVO);
//		}
		
		return 0;
	}
	
	// 판매자 재인증 신청
	@Override
	public int updateSellerSerial(String USER_ID, UserVO userVO, MultipartHttpServletRequest mtf, HttpServletRequest req) {
		UserVO updateuserVO = new UserVO();
		updateuserVO.setUSER_ID(USER_ID);
		updateuserVO.setSERIAL(userVO.getSERIAL());
		
		String serialPath = req.getSession().getServletContext().getRealPath("/").concat("resources\\upload\\images\\user\\"+USER_ID);
		File serialFolder = new File(serialPath);
		if(!serialFolder.exists()) {
			try {
				serialFolder.mkdir();
				System.out.println(USER_ID+"유저의 폴더가 생성되었습니다/");
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			System.out.println("이미 폴더가 생성되어 있습니다.");
		}
		
		int unique=1;
		MultipartFile serialImage = mtf.getFile("serial-image");
		SimpleDateFormat format1 = new SimpleDateFormat ("MM-dd-yyyy");
		String fileName, extension, newFileName = "", files="";
		File ImageFile;
		
		//사업자 등록 번호 증빙 파일 업로드
		fileName = serialImage.getOriginalFilename();
		if(fileName.length() < 1) {
			System.out.println("증빙사진이 없습니다.");
		} else {
			extension = fileName.substring(fileName.lastIndexOf("."),fileName.length());
			newFileName = format1.format(System.currentTimeMillis())+"-"+unique+extension; 
			ImageFile = new File(serialPath+"\\"+newFileName);
			try {
				serialImage.transferTo(ImageFile);
				System.out.println("파일이 생성되었음");
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		updateuserVO.setFILE(newFileName);
		
		// 사업자 번호 등록정보 확인(API 이용)
		BizRegInfoChecker bizRegInfoChecker = new BizRegInfoChecker();
		// 중복되는 사업자인증번호에 대해 안내하는 SERAIL_RESULT를 적용하는 로직이 BizRegInfoChecker 클래스에 적용되어야 함.
		updateuserVO.setSERIAL_RESULT(bizRegInfoChecker.postCRN(userVO.getSERIAL()));
		updateuserVO.setSTATUS(3);
		
		int resultCode = userDAO.updaetSellerSerial(updateuserVO);
		
		if(resultCode == 1) {
			if(resultCode == 1) {
				try {
					if(asyncConfig.isSampleTaskExecute()) {
						asyncMailSendTask.sellerUpdateSuccess(userVO.getEMAIL(), 3);
					} else {
						System.out.println("쓰레드 갯수 초과");
					}
				} catch (Exception e) {
					System.out.println("==============>>>>>>>>>>>> THREAD ERROR");
		            System.out.println("TaskRejectedException : 등록 개수 초과");
		            System.out.println("==============>>>>>>>>>>>> THREAD END");
				}
			}
		}
		
		return resultCode;
	}
	
	// 판매자 회원 탈퇴
	@Override
	public int deleteSeller(String USER_ID, HashMap<String, Object> jsonData) {
		UserVO userVO = new UserVO();
		userVO.setUSER_ID(USER_ID);
//		userVO.setPASSWORD(pwEncoder.encode((String)jsonData.get("PASSWORD")));
		
//		userDAO.selectCheckSellerPassword(userVO) == 1
		
		if(pwEncoder.matches((String)jsonData.get("PASSWORD"), userDAO.getUserByID(USER_ID).getPASSWORD())) {
			return userDAO.deleteSeller(userVO);
		}
		
		return 0;
	}
	
	//소셜 처리
	@Override
	public int SocialJoinAndLoginCheck(HashMap<String, Object> jsonData) {
		int resultCode = 0;
		
		if(jsonData != null) {
			System.out.println(jsonData.get("USER_ID"));
			System.out.println(jsonData.get("EMAIL"));
			System.out.println(jsonData.get("GENDER"));
			System.out.println(jsonData.get("USER_NAME"));
			System.out.println(jsonData.get("PLATFORM"));
			
			String platform = "";
			if(((String)jsonData.get("PLATFORM")).equals("kakao")) {
				platform = "KAKAO";
			} else if(((String)jsonData.get("PLATFORM")).equals("naver")) {
				platform = "NAVER";
			} else if(((String)jsonData.get("PLATFORM")).equals("google")) {
				platform = "GOOGLE";
			}
			
			int gender = 0;
			if(jsonData.get("GENDER") != null) {
				if(((String)jsonData.get("GENDER")).equals("male") || ((String)jsonData.get("GENDER")).equals("M")) {
					gender = 1;
				} else if(((String)jsonData.get("GENDER")).equals("female") || ((String)jsonData.get("GENDER")).equals("F")) {
					gender = 2;
				}
			}
			
			UserVO checkUserVO = getUserByEmail((String)jsonData.get("EMAIL"));
			
			if(checkUserVO == null || !checkUserVO.getPLATFORM().equals("rudisfarm")) {
				// 해당 이메일로 가입된 계정이 없거나, rudisfarm 플랫폼 계정이 아닌 경우 ( == kakao 플랫폼 계정이 DB에 있다)에
				// 회원가입 및 로그인 진행
				System.out.println("해당 이메일로 등록된 계정은 존재하지 않거나, rudisfarm 플랫폼 계정이 아닙니다.");
				
				HashMap<String, String> map = new HashMap<String, String>();
				map.put("USER_ID", (String) (platform+jsonData.get("USER_ID")));
				map.put("PLATFORM", (String) jsonData.get("PLATFORM"));
				
				UserVO loginUserVO = getSocialUserByID(map);
				
				if(loginUserVO == null) {
					System.out.println("DB에 없는 계정입니다. 회원가입+로그인이 가능합니다.");
					resultCode = 1;
				} else {
					System.out.println("DB에 있는 계정입니다. 회원 상태를 확인합니다.");
					
					if(loginUserVO.getSTATUS() == 5) {
						System.out.println("탈퇴된 상태입니다. 재가입 여부를 물어보도록 2번 코드를 반환");
						resultCode = 2;
					} else {
						System.out.println("승인된 상태입니다. 로그인 진행으로 넘어가도록 1번 코드를 반환");
						resultCode = 1;
					}
				}
				
			} else {
				// 이미 해당 이메일로 rudisfram 플랫폼 계정으로 가입했다면
				// 해당 소셜 로그인은은 사용 불가능
				System.out.println("해당 이메일로 등록된 계정은 이미 존재하거나, rudisfarm 플랫폼 계정입니다.");
				
				resultCode = -1;
			}
		} else {
			// JSON 데이터가 넘어오지 않은 경우 로그인 실패
			resultCode = 0;
		}
		
		return resultCode;
	}
	
	@Override
	public UserVO getUserByID(String USER_ID) {
		
		return userDAO.getUserByID(USER_ID);
	}
	
	@Override
	public UserVO getSocialUserByID(HashMap<String, String> map) {
		
		return userDAO.getSocialUserByID(map);
	}
	
	@Override
	public UserVO getUserByEmail(String EMAIL) {
		
		return userDAO.getUserByEmail(EMAIL);
	}
	
	@Override
	public int rejoinSocialUser(String USER_ID) {
		
		return userDAO.rejoinSocialUser(USER_ID);
	}
	
	@Override
	public int outSocialUser(String USER_ID) {
		
		return userDAO.outSocialUser(USER_ID);
	}
	
	@Override
	public int isPremiumUpdate(HashMap<String, Object> map) {
		return userDAO.isPremiumUpdate(map);
	}

	// 유저 상세보기(바이어)
	@Override
	public UserVO buyerDetail(String USER_ID) {
		UserVO vo = new UserVO();
		
		vo = userDAO.buyerDetail(USER_ID);
		return vo;
	}
	
	// 개인 정보 수정(바이어)
	@Override
	public int buyerInfoModify(HashMap<String, Object> jsonData) {
		System.out.println("[유저 서비스 임플_buyerInfoModify_GENDER]" + jsonData.get("GENDER"));
		System.out.println("[유저 서비스 임플_buyerInfoModify_USER_ID]" + jsonData.get("USER_ID"));


		int modifyResult;
		int gander = Integer.parseInt(String.valueOf(jsonData.get("GENDER")));
		
		UserVO userVO = new UserVO();
		userVO.setUSER_ID((String)jsonData.get("USER_ID"));
		userVO.setPASSWORD(pwEncoder.encode((String)jsonData.get("PASSWORD")));
		userVO.setUSER_NAME((String)jsonData.get("USER_NAME"));
		userVO.setFIR_ADDRESS((String)jsonData.get("FIR_ADDRESS"));
		userVO.setSEC_ADDRESS((String)jsonData.get("SEC_ADDRESS"));
		userVO.setPHONE((String)jsonData.get("PHONE"));
		userVO.setGENDER(gander);

		modifyResult = userDAO.buyerInfoModify(userVO);

		return modifyResult;
	}
	// 개인 정보 수정(소셜로그인)
	@Override
	public int buyerInfoModifySocial(HashMap<String, Object> jsonData){
		System.out.println("[유저 서비스 임플_buyerInfoModifySocial]" + jsonData.get("USER_ID"));

		int modifyResultSocial;
		int gander = Integer.parseInt(String.valueOf(jsonData.get("GENDER")));
		
		UserVO userVO = new UserVO();
		userVO.setUSER_ID((String)jsonData.get("USER_ID"));
		userVO.setFIR_ADDRESS((String)jsonData.get("FIR_ADDRESS"));
		userVO.setSEC_ADDRESS((String)jsonData.get("SEC_ADDRESS"));
		userVO.setPHONE((String)jsonData.get("PHONE"));
		userVO.setGENDER(gander);

		modifyResultSocial = userDAO.buyerInfoModifySocial(userVO);

		return modifyResultSocial;
	}
	
	// 회원 탈퇴(바이어)
	@Override
	public int buyerDelete(String USER_ID) {
		System.out.println("[유저 탈퇴 서비스 임플]");
		int buyerOutResult = userDAO.buyerDelete(USER_ID);

		return buyerOutResult;
	}
	
	//찜 비우기
	@Override
	public int deleteBuyerCart(HashMap<String, Object> jsonData) {
		System.out.println("[유저 탈퇴 찜 목록 삭제]");
		int buyerOutResult;
		
		buyerOutResult = userDAO.buyerDeleteCart((String)jsonData.get("checkid"));

		return buyerOutResult;
		
	}
	
	//아이디 찾기
	@Override
	public UserVO findId(String EMAIL) {
		System.out.println("[아이디 찾기]");
		UserVO vo = new UserVO();
		vo = userDAO.findId(EMAIL);
		return vo;
	}
	
	//임시 비밀번호 발급
	public String temporaryPw(UserVO userVO) {
		
		Random random = new Random();
		String validationKey = Integer.toString(random.nextInt(888888) + 111111);
		
		System.out.println("[temporaryPw 임시 비밀번호] : " + validationKey);

		userVO.setPASSWORD(pwEncoder.encode(validationKey));
		userVO.setEMAIL(userVO.getEMAIL());
		
		//임시 비밀번호 저장
		userDAO.temporaryPw(userVO);
		
		

		return validationKey;
	}
	
	// adminindex
	@Override
	public int adminIndexUser(UserVO userVO) {
		return userDAO.adminIndexUser(userVO);
	}
	
	//구매자 아이디 찾기 페이지로 보여주기
	/*
	 * @Override public UserVO buyerFindIdEmailCheck(HashMap<String, Object>
	 * jsonData) { UserVO vo = new UserVO(); vo =
	 * UserDAO.findId((String)jsonData.get("EMAIL"));
	 * System.out.println("[이메일체크서비스임플 buyerFindIdEmailCheck]" + vo); return vo; }
	 */

	
}

	// 로그아웃
//	@Override
//	public void userLogout(HttpSession session) {
//		loginUsers.remove(session.getSESSION_ID());
//		session.invalidate();
//	}
