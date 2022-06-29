package kr.co.rudisfarm.controller.user;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.context.HttpSessionSecurityContextRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import kr.co.rudisfarm.model.commons.service.emailCheck.EmailCheckService;
import kr.co.rudisfarm.model.user.UserService;
import kr.co.rudisfarm.model.user.UserVO;

@Controller
@SessionAttributes({ "USER_ID", "EMAIL", "NAME", "LEVEL" })
public class BuyerUserController {
	@Autowired
	UserService userService;

	@Autowired
	EmailCheckService emailCheckService;

	@Autowired
	BCryptPasswordEncoder pwEncoder; // 서비스에서 사용하도록 메소드 수정
	

	// private final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	// 로그인 폼(단순 페이지 이동)
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String userLoginPage(HttpServletRequest request) {

//		request.setAttribute("loginFail", false);
		
		// 요청 시점의 사용자 URI 정보를 Session의 Attribute에 담아서 전달(잘 지워줘야 함)
		// 로그인이 틀려서 다시 하면 요청 시점의 URI가 로그인 페이지가 되므로 조건문 설정
		String uri = request.getHeader("Referer");
		System.out.println(uri);
		if (uri != null && !uri.contains("/login") && !uri.contains("/join") && !uri.contains("/seller-join") && !uri.contains("/find")) {
			request.getSession().setAttribute("prevPage",
					request.getHeader("Referer"));
		}
		System.out.println("로그인 페이지 표시");
		
		return "/buyer/user/login";
	}
	
	
	// 로그인 페이지
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String failLoginPage(HttpServletRequest request) {
		
		return "/buyer/user/login";
	}
	
	@RequestMapping(value = "/naverlogin", method = RequestMethod.GET)
	public String naverLogin() {
		
		return "/buyer/login/naver-login";
	}
	
	@RequestMapping(value = "/socialcheck", method = RequestMethod.POST)
	@ResponseBody
	public Object SocialJoinAndLoginCheck(@RequestBody HashMap<String, Object> jsonData, HttpServletRequest request) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("resultCode", userService.SocialJoinAndLoginCheck(jsonData));
		
		return map;
	}
	
	@RequestMapping(value = "/socialjoinandlogin", method = RequestMethod.POST)
	@ResponseBody
	public Object SocialJoinAndLogin(@RequestBody HashMap<String, Object> jsonData, HttpServletRequest request) {
		int resultCode;
		
		// 성공적으로 카카오톡에 로그인하여 소셜 회원 정보가 들어온 경우
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
			
			UserVO joinUserVO = new UserVO();
			String role = "";
			
			UserVO checkUserVO = userService.getUserByEmail((String)jsonData.get("EMAIL"));
			
			if(checkUserVO == null || !checkUserVO.getPLATFORM().equals("rudisfarm")) {
				// 해당 이메일로 가입된 계정이 없거나, rudisfarm 플랫폼 계정이 아닌 경우
				// 회원가입 및 로그인 진행
				System.out.println("해당 이메일로 등록된 계정은 존재하지 않거나, rudisfarm 플랫폼 계정이 아닙니다.");
				
				HashMap<String, String> map = new HashMap<String, String>();
				map.put("USER_ID", (String) (platform+jsonData.get("USER_ID")));
				map.put("PLATFORM", (String) jsonData.get("PLATFORM"));
				
				UserVO loginUserVO = userService.getSocialUserByID(map);
				
				if(loginUserVO == null) {
					System.out.println("DB에 없는 계정입니다.");
					
					joinUserVO.setUSER_ID(platform+jsonData.get("USER_ID"));
					joinUserVO.setPASSWORD(pwEncoder.encode(platform+jsonData.get("USER_ID")));
					joinUserVO.setEMAIL((String)jsonData.get("EMAIL"));
					joinUserVO.setUSER_NAME((String)jsonData.get("USER_NAME"));
					joinUserVO.setGENDER(gender);
					joinUserVO.setPLATFORM((String)jsonData.get("PLATFORM"));
					
					userService.buyerJoin(joinUserVO);
					
					System.out.println(joinUserVO.toString());
						
					System.out.println("신규 " + platform +" 계정 회원가입 성공!");
				} else {
					System.out.println("DB에 있는 계정입니다.");
					
					//회원탈퇴 후 재가입 하는경우에만 계정상태와 가입일자 갱신
					if(loginUserVO.getSTATUS() == 5) {
						System.out.println(platform +" 재가입 시도 및 가입일자 갱신");
						userService.rejoinSocialUser(loginUserVO.getUSER_ID());
						
						//재가입한 회원의 마이 페이지에서는 자기 정보와 관련된 모든 조회(주문, 결제)시 가입날짜 이후의 데이터만 조회해야함. !!!!
					}
				}
				
				UserVO userVO = new UserVO();
				userVO = userService.getUserByID(platform+jsonData.get("USER_ID")); //이후 카카오 플랫폼만 필터링해서 가져오는 SQL문 사용이 필요함.
				
				List<GrantedAuthority> authList = new ArrayList<GrantedAuthority>();
				authList.add(new SimpleGrantedAuthority("BUYER"));
				SecurityContext sc = SecurityContextHolder.getContext();
				sc.setAuthentication(new UsernamePasswordAuthenticationToken(userVO.getUSER_ID(), null, authList));
				request.getSession().setAttribute(HttpSessionSecurityContextRepository.SPRING_SECURITY_CONTEXT_KEY, sc);
				
				request.getSession().setAttribute("USER_ID", userVO.getUSER_ID());
				
				System.out.println("로그인 성공! USER_ID : " + userVO.getUSER_ID());
				
				resultCode = 1;
				
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
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("resultCode", resultCode);
		//세션에 이전경로(prevPage)를 가지고 있다면, 해당 경로로 리다이렉트가 가능하도록 map에 포함시켜 보내기 (!!!)
		if(request.getSession().getAttribute("prevPage") != null) {
			System.out.println(request.getSession().getAttribute("prevPage"));
			map.put("prevPage", request.getSession().getAttribute("prevPage"));
		}
		
		return map;
	}
	
	// 소셜 탈퇴 처리
	@RequestMapping(value = "/my-page/socialout", method = RequestMethod.PUT)
	@ResponseBody
	public Object outSocialUser(HttpSession session) {
		int resultCode = userService.outSocialUser((String)session.getAttribute("USER_ID"));
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("resultCode", resultCode);
		
		return map;
	}
	
//	// 로그아웃
//	@RequestMapping("/logout")
//	public String userLogout(HttpSession session) throws Exception {
//
//		return "redirect:/";
//	}

	// 회원가입 페이지로 이동하기
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String userJoinPage() {
		return "/buyer/user/buyer-join";
	}

	// 바이어 회원가입
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String userJoin(@ModelAttribute UserVO vo, HttpServletResponse res) throws IOException {
		System.out.println("[컨트롤러_userJoin : 처리 전] : " + vo);

		String url;

		vo.setPLATFORM("rudisfarm");
		int joinResult = userService.buyerJoin(vo);
		System.out.println("[컨트롤러_userJoin : 처리 후 ] : " + joinResult);

		if (joinResult == 0) {
			url = "buyer/user/buyer-join";
		} else {
			emailCheckService.buyerJoinSuccess(vo.getEMAIL());
			url = "buyer/user/login";
		}
		return url;
	}

	// 아이디 중복 검사(에이젝스)
	@RequestMapping(value = "/idCheck", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	@ResponseBody
	public String idCheck(HttpServletRequest request) {

		String USER_ID = request.getParameter("idcheckval");
		int result = userService.idCheck(USER_ID);
		return Integer.toString(result);
	}

	// email 중복 검사(에이젝스)
	@RequestMapping(value = "/emailCheck", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	@ResponseBody
	public String emailCheck(HttpServletRequest request) {

		String EMAIL = request.getParameter("emailkCheckVal");
		int result = userService.emailCheck(EMAIL);
		return Integer.toString(result);
	}

	// 구매자 회원가입 인증코드 생성 및 메일 전송
	@RequestMapping(value = "/buyer-join/emailcheck", method = RequestMethod.POST)
	@ResponseBody
	public Object buyerInsertEmailcheck(@RequestBody HashMap<String, Object> jsonData) {
		System.out.println("/buyer-join/emailcheck");
		int resultCode = emailCheckService.buyerJoinEmailCheck(jsonData);

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("resultCode", resultCode);

		return map;
	}

	// 구매자 회원가입 인증코드 조회(비교)
	@RequestMapping(value = "/buyer-join/emailcheckresult", method = RequestMethod.POST)
	@ResponseBody
	public Object buyerSelectEmailcheck(@RequestBody HashMap<String, Object> jsonData) {
		int resultCode = emailCheckService.buyerJoinEmailCheckResult(jsonData);

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("resultCode", resultCode);

		return map;
	}

	// 구매자 아이디 찾기
	@RequestMapping(value = "/buyer-findid/emailcheck", /* method = {RequestMethod.GET, RequestMethod.POST}) */ method = RequestMethod.POST)
	@ResponseBody
	public Object buyerIdFindEmailCheck(@RequestBody HashMap<String, Object> jsonData) {
		System.out.println("[컨트롤러 buyerIdFindEmailCheck] 이동");
		UserVO vo = new UserVO();
		String EMAIL = ((String)jsonData.get("EMAIL"));
		vo = userService.findId(EMAIL);

		HashMap<String, Object> map = new HashMap<String, Object>();
		System.out.println("[유저컨트롤러 buyerIdFindEmailCheck]" + vo);
		
		map.put("USER_ID", vo.getUSER_ID());
		map.put("JOINDATE", vo.getJOINDATE());
		map.put("PLATFORM", vo.getPLATFORM());

		System.out.println("[유저컨트롤러 buyerIdFindEmailCheck]" + map);

		return map;
	}

	// 구매자 비밀번호 찾기 인증코드 발송
	@RequestMapping(value = "/buyer-findpw/emailcheck", method = RequestMethod.POST)
	@ResponseBody
	public Object buyerPwFindInsertEmailCheck(@RequestBody HashMap<String, Object> jsonData) {
		int resultCode = emailCheckService.buyerFindPwEmailCheck(jsonData);

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("resultCode", resultCode);

		return map;
	}

	// 구매자 비밀번호 찾기 인증코드 조회(비교)
	@RequestMapping(value = "/buyer-findpw/emailcheckresult", method = RequestMethod.POST)
	@ResponseBody
	public Object buyerPwFindSelectEmailcheck(@RequestBody HashMap<String, Object> jsonData) {
		System.out.println("[buyer-findpw/emailcheckresult_buyerPwFindSelectEmailcheck] 이동");
		int resultCode = emailCheckService.buyerFindPwEmailCheckResult(jsonData);

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("resultCode", resultCode);

		return map;
	}

	// 구매지 비밀번호 찾기 임시 비밀번호 만들어서 보내기
	@RequestMapping(value = "/buyer-findpw/emailcheckupdate", method = RequestMethod.POST)
	@ResponseBody
	public Object buyerPwFindUpdateEmailcheck(@RequestBody HashMap<String, Object> jsonData) {
		//이메일 정보 받음
		UserVO vo = new UserVO();
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		vo.setEMAIL((String)jsonData.get("EMAIL"));
		
		//이메일이 소셜 로그인 유저인지 확인하기
		UserVO findIdvo = new UserVO();
		findIdvo = userService.findId((String)jsonData.get("EMAIL"));
		String platform = findIdvo.getPLATFORM();
		
		//소셜 로그인 유저일때 아닐때
		if(platform.equals("rudisfarm")) {
			
			
			//임시 비밀번호
			String temporaryPwResult = userService.temporaryPw(vo);
			
			//임시 비밀번호 메일로 보내기
			jsonData.put("PASSWORD", temporaryPwResult);
			int resultCode = emailCheckService.buyerFindPwEmailCheckUpdate(jsonData);
	
			
			map.put("resultCode", resultCode);

			return map;
		} else {
			map.put("resultCode", 99);
			return map;
		}
	}

	// 구매자 탈퇴 본인 확인 인증코드 발송
	@RequestMapping(value = "/my-page/buyer-out/emailcheck", method = RequestMethod.POST)
	@ResponseBody
	public Object buyerOutEmailCheck(@RequestBody HashMap<String, Object> jsonData) {
		int resultCode = emailCheckService.buyerOutEmailCheck(jsonData);

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("resultCode", resultCode);

		return map;
	}

	// 구매자 탈퇴 본인 인증코드 확인(비교)
	@RequestMapping(value = "/my-page/buyer-out/emailcheckresult", method = RequestMethod.POST)
	@ResponseBody
	public Object buyerOutEmailCheckResult(@RequestBody HashMap<String, Object> jsonData) {
		int resultCode = emailCheckService.buyerOutEmailCheckResult(jsonData);

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("resultCode", resultCode);

		return map;
	}

	// 비밀번호 맞는지 확인하기(에이젝스)
	@RequestMapping(value = "/my-page/passCheck", method = RequestMethod.PUT)
	@ResponseBody
	public Object passCheck(@RequestBody HashMap<String, Object> jsonData) {
		boolean result;
		System.out.println("[UserController_passCHeck]" + jsonData);
		result = userService.passwordCheck(jsonData);
		
		return result;
	}

	// 마이페이지 폼(단순 페이지 이동)
	@RequestMapping(value = "/my-page/my-info", method = RequestMethod.GET)
	public String myInfoPage() {
		return "/buyer/user/my-info";
	}

//	// 마이페이지 비밀번호 확인 폼(단순 페이지 이동)
//	@RequestMapping(value = "/my-page/my-info-modify-check", method = RequestMethod.GET)
//	public String myInfoPassCheckPage() {
//		return "/buyer/user/my-info-modify-check";
//	}

	// 개인정보 수정 페이지(바이어)
	@RequestMapping(value = "/my-page/my-info-modify-form", method = RequestMethod.GET)
	public String buyerInfo(HttpSession session, Model model) throws Exception {
		UserVO resultUserVO = new UserVO();
		String USER_ID = (String) session.getAttribute("USER_ID");
		System.out.println("[buyerInfo_userInfo] : " + USER_ID);

		resultUserVO = userService.buyerDetail(USER_ID);
		model.addAttribute("userDetail", resultUserVO);

		System.out.println("[buyerInfo : 결과] : " + model);
		return "buyer/user/my-info-modify-form";
	}

	// 개인정보 수정(바이어)
	@RequestMapping(value = "/my-page/my-info", method = RequestMethod.PUT)
	@ResponseBody
	public Object buyerInfoModify(@RequestBody HashMap<String, Object> jsonData, ModelAndView mav) {
		System.out.println("[buyerInfo_buyerInfoModify]");

		int buyerModifyResult = userService.buyerInfoModify(jsonData);
		mav.addObject("buyerModifyResult", buyerModifyResult);

		System.out.println("컨트롤러_buyerInfoModify : 결과 " + buyerModifyResult);
		if (buyerModifyResult == 1) {
			return true;
		} else {
			return false;
		}
	}
	
	 //개인정보 수정(소셜 로그인)
	@RequestMapping(value = "/my-page/my-info-social", method = RequestMethod.PUT)
	@ResponseBody
	public Object buyerInfoModifySocial(@RequestBody HashMap<String, Object> jsonData, ModelAndView mav) {
		System.out.println("[buyerInfoModifySocial 이동]");

		int buyerSocialModifyResult = userService.buyerInfoModifySocial(jsonData);
		mav.addObject("buyerSocialModifyResult", buyerSocialModifyResult);

		System.out.println("컨트롤러_buyerSocialInfoModify : 결과 " + buyerSocialModifyResult);
		if (buyerSocialModifyResult == 1) {
			return true;
		} else {
			return false;
		}
	}

	// 회원 탈퇴 폼(단순 페이지 이동)
	@RequestMapping(value = "/my-page/out-check", method = RequestMethod.GET)
	public String buyerOutCheckForm(HttpSession session, Model model) throws Exception {
		UserVO resultUserVO = new UserVO();
		String USER_ID = (String) session.getAttribute("USER_ID");
		System.out.println("userInfo" + USER_ID);

		resultUserVO = userService.buyerDetail(USER_ID);
		model.addAttribute("userDetail", resultUserVO);
		System.out.println("[out-check : 결과] : " + model);

		return "/buyer/user/my-delete-check";
	}

	// 회원탈퇴(바이어)
	@RequestMapping(value = "/my-page/out", method = RequestMethod.PUT)
	@ResponseBody
	public Object buyerOutCheck(HttpSession session) {
		//탈퇴 처리
		int resultCode = userService.buyerDelete((String)session.getAttribute("USER_ID"));
		
		System.out.println("[UserController_buyerOutCheck]");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("resultCode", resultCode);
		
		return map;
		
		}

	
	// 아이디/비밀번호 찾기 페이지
	@RequestMapping(value = "/find", method = RequestMethod.GET)
	public String findUser() {
		return "/buyer/user/find-user";
	}

	/*
	 * // 아이디 찾아서 메일로 보내기
	 * 
	 * @RequestMapping(value = "/findid", method = RequestMethod.GET)
	 * 
	 * @ResponseBody public void findIdSendEmail(String email) throws Exception {
	 * System.out.println("[UserController_findIdSendEmail] : " + email);
	 * 
	 * String userId = userService.findId(email);
	 * 
	 * String setFrom = "rudisfarmad@gmail.com"; String toMail = email; String title
	 * = "루디스팜 아이디 찾기 서비스 안내입니다."; String content = "신청하신 이메일로 가입된 아이디는 [" + userId
	 * + "] 입니다." + "<br>" +
	 * "추가로 비밀번호 찾기를 이용하고 싶으실 경우에는 http://localhost:8088/rudisfarm/find 페이지를 참고해주십시오."
	 * ;
	 * 
	 * try { MimeMessage message = mailSender.createMimeMessage(); MimeMessageHelper
	 * helper = new MimeMessageHelper(message, true, "utf-8");
	 * helper.setFrom(setFrom); helper.setTo(toMail); helper.setSubject(title);
	 * helper.setText(content, true); mailSender.send(message);
	 * 
	 * } catch (Exception e) { e.printStackTrace(); } }
	 */

	// 비밀번호 찾기 이메일 보내기, 임시로 쓸 난수 비밀번호 디비에 저장해서 보내기
	/*
	 * @RequestMapping(value = "/findpw", method = RequestMethod.GET)
	 * 
	 * @ResponseBody public boolean findPwSendEmail(String email) throws Exception {
	 * System.out.println("[UserController_findPwSendEmail] : " + email);
	 * 
	 * Random random = new Random(); int radomPw = random.nextInt(888888) + 111111;
	 * String radomStr = String.valueOf(radomPw);
	 * System.out.println("[임시 비밀번호 발급] : " + radomStr);
	 * 
	 * UserVO vo = new UserVO(); vo.setEMAIL(email);
	 * vo.setPASSWORD(pwEncoder.encode(radomStr));
	 * 
	 * userService.issuPw(vo); // 임시 비밀번호 디비에 저장
	 * 
	 * String setFrom = "rudisfarmad@gmail.com"; String toMail = email; String title
	 * = "루디스팜 비밀번호 찾기 서비스 안내입니다."; String content = "임시 비밀번호는 [" + radomPw +
	 * "] 입니다." + "<br>" + "로그인 후 반드시 회원정보 메뉴에서 비밀번호를 변경하여 주십시오.";
	 * 
	 * try { MimeMessage message = mailSender.createMimeMessage(); MimeMessageHelper
	 * helper = new MimeMessageHelper(message, true, "utf-8");
	 * helper.setFrom(setFrom); helper.setTo(toMail); helper.setSubject(title);
	 * helper.setText(content, true); mailSender.send(message);
	 * 
	 * } catch (Exception e) { e.printStackTrace(); }
	 * 
	 * return true; }
	 */
	@RequestMapping(value = "/capjsp", method = RequestMethod.GET)
	public String captcha() {
		return "/buyer/user/captcha2";
	}

	
	
	
	
//	// 페이지 이동
//	// 주문 내역
//	@RequestMapping(value = "/my-page/orders", method = RequestMethod.GET)
//	public String myOdersPage() {
//		return "/buyer/user/my-orders";
//	}

//	// 장바구니 페이지
//	@RequestMapping(value = "/my-page/my-cart", method = RequestMethod.GET)
//	public String myCartPage() {
//		return "/buyer/user/my-cart";
//	}

	/*
	 * // 결제 내역 페이지
	 * 
	 * @RequestMapping(value = "/my-page/orders/{", method = RequestMethod.GET)
	 * public String myPaymentPage() { return "/buyer/user/my-orders"; }
	 */

}
