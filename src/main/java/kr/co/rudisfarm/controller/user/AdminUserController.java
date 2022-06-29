package kr.co.rudisfarm.controller.user;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import kr.co.rudisfarm.model.chart.ChartService;
import kr.co.rudisfarm.model.chart.ChartVO;
import kr.co.rudisfarm.model.payment.RudisPaymentService;
import kr.co.rudisfarm.model.commons.pagenation.UserPagenation;
import kr.co.rudisfarm.model.payment.PaymentService;
import kr.co.rudisfarm.model.payment.PaymentVO;
import kr.co.rudisfarm.model.payment.RudisPaymentService;
import kr.co.rudisfarm.model.product.ProductService;
import kr.co.rudisfarm.model.product.ProductVO;
import kr.co.rudisfarm.model.user.UserService;
import kr.co.rudisfarm.model.user.UserVO;
import kr.co.rudisfarm.model.user.impl.UserDAO;

/**
 * Handles requests for the application home page.
 */
@Controller
@SessionAttributes({"USER_ID", "EMAIL", "NAME", "LEVEL"})
public class AdminUserController {
	String adminUnique = "";
	@Autowired
	UserService userService;
	
	@Autowired
	ChartService chartService;

	@Autowired
	ProductService productService;
	
	@Autowired
	PaymentService paymentService;
	
	@Autowired
	RudisPaymentService rudisPaymentService;

	@Autowired
	BCryptPasswordEncoder pwEncoder;
	
	@Autowired
	UserDAO userDAO;
	
	@RequestMapping(value = "/admin/admin-login", method = RequestMethod.GET)
	public String adminLogin(Model model, HttpSession session, HttpServletRequest request) {
//		if(session.getAttribute("USER_ID")==null) {
		UserVO vo = new UserVO();
		vo.setLEVEL(0);
		String USERID = userService.isAdminExists(vo);
		System.out.println(USERID);

		if(USERID!=null) {
//			model.addAttribute("isExist", true);
//			model.addAttribute("USERID", USERID);
			System.out.println("ID있음");
			} else {
//				model.addAttribute("isExist", false);
//				model.addAttribute("USERID", USERID);
				vo.setUSER_ID("Admin"+adminUnique);
				vo.setPASSWORD("Admin");
				vo.setEMAIL("Admin");
				vo.setUSER_NAME("Admin");
				vo.setLEVEL(0);
				vo.setSTATUS(0);
				userService.createAdmin(vo);
				
				List<UserVO> list = userDAO.allUser();
				for(UserVO vo1 : list) {
					vo1.setPASSWORD(pwEncoder.encode(vo1.getUSER_ID()));
					userDAO.encode(vo1);
				}
			}
//		return "/admin/user/admin-login";
//		} else {
//			return "/admin/user/admin-index";
//		}
		
		// 요청 시점의 사용자 URI 정보를 Session의 Attribute에 담아서 전달(잘 지워줘야 함)
		// 로그인이 틀려서 다시 하면 요청 시점의 URI가 로그인 페이지가 되므로 조건문 설정
		String uri = request.getHeader("Referer");
		System.out.println(uri);
		if (uri != null && uri.contains("/admin/") && !uri.contains("/admin-find") && !uri.contains("/admin-login")) {
			request.getSession().setAttribute("prevPage",
					request.getHeader("Referer"));
		}
		System.out.println("로그인 페이지 표시");
		
		return "/admin/user/admin-login";
	}
	
	@RequestMapping(value = "/admin/admin-login", method = RequestMethod.POST)
	public String failLogin(Model model, HttpSession session) {
		
		return "/admin/user/admin-login";
	}

//	@RequestMapping(value = "/admin/admin*"/*(/admin*으로 변경하기)*/, method = RequestMethod.GET)
//	public String sessionCheck(HttpSession session) {
//		String ok;
//		if(session.getAttribute("USER_ID")!=null) {
//		ok ="/admin/user/admin-index"; 
//		return ok;}
//		else {
//			return "redirect:/admin/admin-login";
//		}
//	}
	@RequestMapping(value = "/admin/admin-index", method = RequestMethod.GET)
	public Object adminIndex(HttpSession session, Model model) {
		Map<String, Object> map=new HashMap<>();
		if(session.getAttribute("USER_ID")!=null) {
			int userNum = chartService.getUserCount();
			List<ChartVO> userList=chartService.getYearList();
			int productNum = chartService.getProductCount();
			List<ChartVO> productList=chartService.getProductYearList();
			int orderNum = chartService.getOrderCount();
			List<ChartVO> orderList = chartService.getOrderYearList();
			int totalPrice = chartService.getTotalPrice();
			List<ChartVO> PriceList = chartService.getPriceYearList();
			
			map.put("userList", userList);
			map.put("userNum",userNum);
			map.put("productNum", productNum);
			map.put("productList", productList);
			map.put("orderNum", orderNum);
			map.put("orderList", orderList);
			map.put("totalPrice", totalPrice);
			map.put("PriceList", PriceList);
			
			model.addAttribute("map", map);

			UserVO userVO = new UserVO();
			userVO.setUSER_ID((String)session.getAttribute("USER_ID"));
			userVO=userService.getAdmin(userVO);
			model.addAttribute("admin", userVO);
			System.out.println("야"+userVO.getSTATUS());

//			int userCount = userService.adminIndexUser(userVO);
//			ProductVO productVO = new ProductVO();
			//int productCount = productService.adminIndexProduct(productVO);
//			PaymentVO paymentVO = new PaymentVO();
//			int paymentCount = paymentService.adminIndexPayment(paymentVO);
//			int paymentTotal = paymentService.adminIndexPaymentTotal(paymentVO);
//			
//			model.addAttribute("userCount", userCount);
//			model.addAttribute("productCount", productCount);
//			model.addAttribute("paymentCount", paymentCount);
//			model.addAttribute("paymentTotal", paymentTotal);
//				
//				
			
			return "/admin/user/admin-index"; 
		} else {
			return "redirect:/admin/admin-login";
		}
	}
	@RequestMapping(value = "/admin/admin-info", method = RequestMethod.GET)
	public String adminInfo(Model model, HttpSession session) {
		UserVO vo = new UserVO();
		vo.setUSER_ID((String)session.getAttribute("USER_ID"));
		vo.setLEVEL((int)session.getAttribute("LEVEL"));
		UserVO vo2 = new UserVO();
		vo2 = userService.getAdmin(vo);
		String url;
		if(session.getAttribute("USER_ID")!=null) {model.addAttribute("admin",vo2); url = "/admin/user/admin-info"; return url;}
		else{return "redirect:/admin/admin-login";}
	}
	@RequestMapping(value = "/admin/admin-info", method = RequestMethod.POST)
	public String adminInfoSet(HttpServletRequest req, Model model, HttpSession session) {
		UserVO vo = new UserVO();
		String id = req.getParameter("id")+adminUnique;
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String pass = req.getParameter("pass");
		String phone = req.getParameter("phone");
		String phone1 = req.getParameter("phone1");
		String phone2 = req.getParameter("phone2");
		vo.setUSER_ID(id);
		vo.setUSER_NAME(name);
		vo.setEMAIL(email);
		vo.setPASSWORD(pass);
//		String[] phone=phoneReq.split("-");
//		vo.setPHONE(phone[0]+phone[1]+phone[2]);
		vo.setPHONE(phone+phone1+phone2);
		if(phone==""||phone1==""||phone2=="") {
			vo.setPHONE("00000000000");
		}
		vo.setLEVEL(0);
		vo.setSTATUS(1);
		// 김승수 통합할때 userService 오류가서 임시로 막아놈(확인 요망)
		userService.changeAdmin(vo);
		
		List<UserVO> list = userDAO.allUser();
		for(UserVO vo1 : list) {
			vo1.setPASSWORD(pwEncoder.encode(vo1.getUSER_ID()));
			userDAO.encode(vo1);
		}
		session.invalidate();
		return "/admin/user/admin-login";
//		vo.setUSER_ID(vo.getUSER_ID().substring(0, vo.getUSER_ID().length()-adminUnique.length()));
//		session.setAttribute("user", vo);
//		return "/admin/user/admin-index";
	}
	@RequestMapping(value = "/admin-logout", method = RequestMethod.GET)
	public String adminLogout(HttpSession session) {
		session.invalidate();
		return "redirect:/admin/admin-login";
	}
	@RequestMapping(value = "/admin/admin-find", method = RequestMethod.GET)
	public String adminFindPasswordForm(HttpSession session) {
//		String ok;
//		if(session.getAttribute("USER_ID")==null) {
		return "/admin/user/admin-find"; 
//		System.out.println("찾기");
//		return ok;}
//		else {
//			return "redirect:/admin/admin-index";
//		}
	}
	
	@RequestMapping(value = "/admin-emailcheck", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	@ResponseBody
	public String adminEmailCheck(HttpServletRequest request) {
		
		String EMAIL = request.getParameter("EMAIL");
		System.out.println("////// adminEmailCheck :" + EMAIL);
		
		int result = userService.checkAdmin(EMAIL);

		System.out.println("////// AdminController_adminEmailCheck :" + result);
		return Integer.toString(result);
		
	}
	
//	@RequestMapping(value = "/admin/admin-find", method = RequestMethod.POST)
//	public String adminFindPassword(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
//		String host="smtp.naver.com";
//		String to=req.getParameter("email");
//		Properties props = new Properties();
//		props.put("mail.smtp.host", host);
//		props.put("mail.smtp.port", 587);
//		props.put("mail.smtp.auth", "true");
////		props.put("mail.smtp.ssl.enable", "true");
////		props.put("mail.smtp.ssl.trust", "smtp.naver.com");
//		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
//			protected PasswordAuthentication getPasswordAuthentication() {
//				return new PasswordAuthentication(user,password);
//			}
//		});
//		try {
//			UserVO vo = new UserVO();
//			vo.setEMAIL(to);
//			vo.setLEVEL(0);
//			vo = userService.findAdmin(vo);
//			MimeMessage message = new MimeMessage(session);
//			message.setFrom(new InternetAddress(user));
//			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
//			message.setSubject("RudisFarm 관리자 계정 정보");
//			message.setText("ID : "+vo.getUSER_ID().substring(0, vo.getUSER_ID().length()-adminUnique.length())+"\nPassword : "+vo.getPASSWORD());
//			Transport.send(message);
//			res.setContentType("text/html; charset=utf-8");
//			PrintWriter out=res.getWriter();
//			out.print("<script>");
//			out.print("alert('입력하신 이메일로 전송 되었습니다.');");
//			out.print("document.location.href='admin-login';");
//			out.print("</script>");
//			System.out.println("Success Message Send");
//		} catch(Exception e) {
//			e.printStackTrace();
//			System.out.println("Fail Message Send");
//			res.setContentType("text/html; charset=utf-8");
//			PrintWriter out=res.getWriter();
//			out.print("<script>");
//			out.print("alert('등록되지 않은 이메일입니다.');");
//			out.print("document.location.href='admin-find';");
//			out.print("</script>");
//		}
//		return null;
//	}
//	@RequestMapping(value = "/admin/admin-find/ajax", method = RequestMethod.POST)
//	@ResponseBody
//	public Object adminFindPassword(@RequestBody HashMap<String, Object> jsonData) throws ServletException, IOException {
//		if(jsonData != null) {
//		System.out.println("입력한 이메일");
//		System.out.println(jsonData.get("email"));
//		String host="smtp.naver.com";
//		final String user="mmkkcceellookkhh@naver.com";
//		final String password="088989"+"kh";
//		String to=(String)jsonData.get("email");
//		Properties props = new Properties();
//		props.put("mail.smtp.host", host);
//		props.put("mail.smtp.port", 587);
//		props.put("mail.smtp.auth", "true");
////		props.put("mail.smtp.ssl.enable", "true");
////		props.put("mail.smtp.ssl.trust", "smtp.naver.com");
//		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
//			protected PasswordAuthentication getPasswordAuthentication() {
//				return new PasswordAuthentication(user,password);
//			}
//		});
//		UserVO vo = new UserVO();
//		vo.setEMAIL(to);
//		vo.setLEVEL(0);
//		vo = userService.findAdmin(vo);
//		HashMap<String, Object> returnData = new HashMap<String, Object>();
//		if(vo != null) {
//		try {
//			MimeMessage message = new MimeMessage(session);
//			message.setFrom(new InternetAddress(user));
//			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
//			message.setSubject("RudisFarm 관리자 계정 정보");
//			message.setText("ID : "+vo.getUSER_ID().substring(0, vo.getUSER_ID().length()-adminUnique.length())+"\nPassword : "+vo.getPASSWORD());
//			Transport.send(message);
//			System.out.println("Success Message Send");
//			returnData.put("result", "1");
//			return returnData;
//			
//		} catch(Exception e) {
//			e.printStackTrace();
//			System.out.println("Fail Message Send");
//			return null;
//		}}else {
//			returnData.put("result", "0");
//			System.out.println("맞는 유저 없음.");
//			return returnData;
//		}
//		}else {
//			System.out.println("데이터가 존재안함.");
//			return null;
//		}
//		
//	}
	@RequestMapping(value = "/admin-login/ajax", method = RequestMethod.POST)
	@ResponseBody
	public Object testPut(@RequestBody HashMap<String, Object> jsonData, HttpServletRequest req, Model model)throws ServletException, IOException {
		if(jsonData != null) {
			System.out.println("입력한 아이디");
			System.out.println(jsonData.get("id"));
			System.out.println("입력한 비번");
			System.out.println(jsonData.get("pass"));
			String id = (String)jsonData.get("id");
			String pass = (String)jsonData.get("pass");
			UserVO vo = new UserVO();
			vo.setUSER_ID(id+adminUnique);
			vo.setPASSWORD(pass);
			vo.setLEVEL(0);
//			vo = userService.getAdmin(vo);
			HashMap<String, Object> returnData = new HashMap<String, Object>();
			if(vo != null) {
				vo.setUSER_ID(vo.getUSER_ID().substring(0, vo.getUSER_ID().length()-adminUnique.length()));
				System.out.println("로그인 성공");
				
				HttpSession session = req.getSession();
				session.setAttribute("user", vo);
				model.addAttribute("admin", vo);
				
				returnData.put("result", "/rudisfarm/admin/admin-index");
				
				return returnData;
			}else {
				returnData.put("result", "admin-login");
				
				return returnData;
			}
		}else {
			System.out.println("데이터가 존재안함.");
			return null;
		}
	}
//	@RequestMapping(value = "/admin-index", method = RequestMethod.POST)
//	public String adminIndex(Model model, HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
//		req.setCharacterEncoding("utf-8");
//		String id = req.getParameter("id");
//		String pass = req.getParameter("pass");
//		UserVO vo = new UserVO();
//		vo.setUSER_ID(id+adminUnique);
//		vo.setPASSWORD(pass);
//		vo.setLEVEL(0);
//		vo = userService.getAdmin(vo);
//		
//		
//		try {
//		if(vo.getLEVEL() == 0) {
//			vo.setUSER_ID(vo.getUSER_ID().substring(0, vo.getUSER_ID().length()-".X3j!9".length())); 
//			HttpSession session = req.getSession();
//			session.setAttribute("user", vo);
//			model.addAttribute("admin", vo);
//		}
//		} catch(Exception e){
//			res.setContentType("text/html; charset=utf-8");
//			PrintWriter out=res.getWriter();
//			out.print("<script>");
//			out.print("alert('로그인 실패.');");
//			out.print("document.location.href='admin-login';");
//			out.print("</script>");
//		}
//
//
//		return "/admin/admin/admin-index";
//	}
	@RequestMapping(value = "/admin/admin-change", method = RequestMethod.POST)
	public String adminChange(HttpSession session, HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String id = req.getParameter("id")+adminUnique;
		String name = req.getParameter("name");
		System.out.println(name);
		String email = req.getParameter("email");
		System.out.println(email);
		String pass = req.getParameter("pass");
		System.out.println(pass);
		UserVO vo = new UserVO();
		System.out.println(vo.getUSER_ID());
//		vo = (kr.co.rudisfarm.model.user.UserVO)session.getAttribute("USER_ID");
		vo.setUSER_ID(id);
		vo.setUSER_NAME(name);
		vo.setEMAIL(email);
		vo.setPASSWORD(pass);
		String phoneReq="000-0000-0000";
		String[] phone=phoneReq.split("-");
		vo.setPHONE(phone[0]+phone[1]+phone[2]);
		vo.setSTATUS(1);
		vo.setLEVEL(0);
		userService.changeAdmin(vo);
		
		List<UserVO> list = userDAO.allUser();
		for(UserVO vo1 : list) {
			vo1.setPASSWORD(pwEncoder.encode(vo1.getUSER_ID()));
			userDAO.encode(vo1);
		}
		
		session.invalidate();
		return "/admin/user/admin-login";
	}
	@RequestMapping(value = "/admin/admin-buyerlist-manage", method = RequestMethod.GET)
//	public String buyerList(Model model, HttpSession session) {
//		UserVO vo = new UserVO();
//		List<UserVO> list = userService.getBuyerList(vo);
//		model.addAttribute("buyerList", list);
//		return "/admin/user/admin-buyerlist-manage";
//	}
	public String getAdminBuyerInfoList(@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "keywordType", required = false, defaultValue = "") String keywordType,
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
			@RequestParam(value = "sort", required = false, defaultValue = "JOINDATE") String sort,
			Model model) {
		HashMap<String, Object> pageInfo = new HashMap<String, Object>();
		pageInfo.put("page", page);
		pageInfo.put("keywordType", keywordType);
		pageInfo.put("keyword", keyword);
		pageInfo.put("sort", sort);
		pageInfo.put("currentPage", (page - 1) * 10);
		pageInfo.put("limit", 10);
		
		UserPagenation sellerPagenation = userService.selectAdminBuyerList(pageInfo);
		
		model.addAttribute("sellerPagenation", sellerPagenation);
		model.addAttribute("keywordType", keywordType);
		model.addAttribute("keyword", keyword);
		model.addAttribute("sort", sort);
		model.addAttribute("keywordTypeUrl", "&keywordType="+keywordType);
		model.addAttribute("keywordUrl", "&keyword="+keyword);
		model.addAttribute("sortUrl", "&sort="+sort);
		
		return "/admin/user/admin-buyerlist-manage";
	}
	@RequestMapping(value = "/admin/admin-buyer-manage/{user_id}", method = RequestMethod.GET)
	public String buyer(Model model, HttpSession session, @PathVariable String user_id) {
//		String ok;
//		if(session.getAttribute("user")!=null) {
//		ok ="/admin/user/admin-buyer-manage";
		System.out.println(user_id);
		model.addAttribute("user_id", user_id);
		UserVO vo = new UserVO();
		vo.setUSER_ID(user_id);
		vo=userService.getBuyer(vo);
		model.addAttribute("buyer", vo);
		System.out.println(vo);
		return "/admin/user/admin-buyer-manage";
//		}
//		else {
//			System.out.println("로그인필요");
//			return "redirect:/admin-login";
//		}
	}
//	@RequestMapping(value = "/admin/admin-cart-manage", method = RequestMethod.GET)
//	public String cartList(Model model, HttpSession session) {
//		String ok;
//		if(session.getAttribute("USER_ID")!=null) {
//		ok ="/admin/cart/admin-cart-manage";
//		return ok;}
//		else {
//			System.out.println("로그인필요");
//			return "redirect:/admin/admin-login";
//		}
//	}
//	@RequestMapping(value = "/admin/admin-requestedsellerlist-manage", method = RequestMethod.GET)
//	public String requestedSellerList(Model model, HttpSession session) {
//		String ok;
//		if(session.getAttribute("USER_ID")!=null) {
//		ok ="/admin/user/admin-requestedsellerlist-manage";
//		return ok;}
//		else {
//			System.out.println("로그인필요");
//			return "redirect:/admin/admin-login";
//		}
//	}
//	@RequestMapping(value = "/admin/admin-requestedseller-manage/{number}", method = RequestMethod.GET)
//	public String requestedSeller(Model model, HttpSession session, @PathVariable int number) {
//		String ok;
//		if(session.getAttribute("USER_ID")!=null) {
//		ok ="/admin/user/admin-requestedseller-manage";
//		System.out.println(number);
//		model.addAttribute("name", number);
//		return ok;}
//		else {
//			System.out.println("로그인필요");
//			return "redirect:/admin/admin-login";
//		}
//	}
//	@RequestMapping(value = "/admin/admin-approvedsellerlist-manage", method = RequestMethod.GET)
//	public String approvedSellerList(Model model, HttpSession session) {
//		String ok;
//		if(session.getAttribute("USER_ID")!=null) {
//		ok ="/admin/user/admin-approvedsellerlist-manage";
//		return ok;}
//		else {
//			System.out.println("로그인필요");
//			return "redirect:/admin/admin-login";
//		}
//	}
//	@RequestMapping(value = "/admin/admin-approvedseller-manage/{number}", method = RequestMethod.GET)
//	public String approvedseller(Model model, HttpSession session, @PathVariable int number) {
//		String ok;
//		if(session.getAttribute("USER_ID")!=null) {
//		ok ="/admin/user/admin-approvedseller-manage";
//		System.out.println(number);
//		model.addAttribute("name", number);
//		return ok;}
//		else {
//			System.out.println("로그인필요");
//			return "redirect:/admin/admin-login";
//		}
//	}
//	@RequestMapping(value = "/admin/admin-rejectedsellerlist-manage", method = RequestMethod.GET)
//	public String rejectedSellerList(Model model, HttpSession session) {
//		String ok;
//		if(session.getAttribute("USER_ID")!=null) {
//		ok ="/admin/user/admin-rejectedsellerlist-manage";
//		return ok;}
//		else {
//			System.out.println("로그인필요");
//			return "redirect:/admin/admin-login";
//		}
//	}
//	@RequestMapping(value = "/admin/admin-rejectedseller-manage/{number}", method = RequestMethod.GET)
//	public String rejectedseller(Model model, HttpSession session, @PathVariable int number) {
//		String ok;
//		if(session.getAttribute("USER_ID")!=null) {
//		ok ="/admin/user/admin-rejectedseller-manage";
//		System.out.println(number);
//		model.addAttribute("name", number);
//		return ok;}
//		else {
//			System.out.println("로그인필요");
//			return "redirect:/admin/admin-login";
//		}
//	}
//	@RequestMapping(value = "/admin/admin-premiumproductlist-manage", method = RequestMethod.GET)
//	public String pmproductList(Model model, HttpSession session) {
//		String ok;
//		if(session.getAttribute("USER_ID")!=null) {
//		ok ="/admin/product/admin-premiumproductlist-manage"; 
//		return ok;}
//		else {
//			System.out.println("로그인필요");
//			return "redirect:/admin/admin-login";
//		}
//	}



//	@RequestMapping(value = "/admin/admin-premiumproduct-manage/{number}", method = RequestMethod.GET)
//	public String pproduct(Model model, HttpSession session, @PathVariable int number) {
//		String ok;
//		if(session.getAttribute("USER_ID")!=null) {
//		ok ="/admin/product/admin-premiumproduct-manage"; 
//		System.out.println(number);
//		model.addAttribute("name", number);
//		return ok;}
//		else {
//			System.out.println("로그인필요");
//			return "redirect:/admin/admin-login";
//		}
//	}
//	@RequestMapping(value = "/admin/admin-productlist-manage", method = RequestMethod.GET)
//	public String productList(Model model, HttpSession session) {
//		String ok;
//		if(session.getAttribute("USER_ID")!=null) {
//		ok ="/admin/product/admin-productlist-manage"; 
//		return ok;}
//		else {
//			System.out.println("로그인필요");
//			return "redirect:/admin/admin-login";
//		}
//	}
//	@RequestMapping(value = "/admin/admin-product-manage/{number}", method = RequestMethod.GET)
//	public String product(Model model, HttpSession session, @PathVariable int number) {
//		String ok;
//		if(session.getAttribute("USER_ID")!=null) {
//		ok ="/admin/product/admin-product-manage"; 
//		System.out.println(number);
//		model.addAttribute("name", number);
//		return ok;}
//		else {
//			System.out.println("로그인필요");
//			return "redirect:/admin/admin-login";
//		}
//	}
//	@RequestMapping(value = "/admin/admin-keyword-manage", method = RequestMethod.GET)
//	public String keyword(Model model, HttpSession session) {
//		String ok;
//		if(session.getAttribute("USER_ID")!=null) {
//		ok ="/admin/product_types/admin-keyword-manage"; 
//		return ok;}
//		else {
//			System.out.println("로그인필요");
//			return "redirect:/admin/admin-login";
//		}
//	}
//	@RequestMapping(value = "/admin/admin-orderlist-manage", method = RequestMethod.GET)
//	public String orderList(Model model, HttpSession session) {
//		String ok;
//		if(session.getAttribute("USER_ID")!=null) {
//		ok ="/admin/orders/admin-orderlist-manage"; 
//		return ok;}
//		else {
//			System.out.println("로그인필요");
//			return "redirect:/admin/admin-login";
//		}
//	}
//	@RequestMapping(value = "/admin/admin-order-manage/{number}", method = RequestMethod.GET)
//	public String order(Model model, HttpSession session, @PathVariable int number) {
//		String ok;
//		if(session.getAttribute("USER_ID")!=null) {
//		ok ="/admin/orders/admin-order-manage";
//		System.out.println(number);
//		model.addAttribute("name", number);
//		return ok;}
//		else {
//			System.out.println("로그인필요");
//			return "redirect:/admin/admin-login";
//		}
//		
//	}
//	@RequestMapping(value = "/admin/admin-canceledpaymentlist-manage", method = RequestMethod.GET)
//	public String canceledpaymentList(Model model, HttpSession session) {
//		String ok;
//		if(session.getAttribute("user")!=null) {
//		ok ="/admin/payment/admin-canceledpaymentlist-manage"; 
//		return ok;}
//		else {
//			System.out.println("로그인필요");
//			return "redirect:/admin-login";
//		}
//	}
//	@RequestMapping(value = "/admin/admin-paymentlist-manage", method = RequestMethod.GET)
//	public String paymentList(Model model, HttpSession session) {
//		String ok;
//		if(session.getAttribute("user")!=null) {
//		ok ="/admin/payment/admin-paymentlist-manage"; 
//		return ok;}
//		else {
//			System.out.println("로그인필요");
//			return "redirect:/admin-login";
//		}
//	}
//	@RequestMapping(value = "/admin/admin-reviewlist-manage", method = RequestMethod.GET)
//	public String reviewList(Model model, HttpSession session) {
//		String ok;
//		if(session.getAttribute("USER_ID")!=null) {
//		ok ="/admin/review/admin-reviewlist-manage"; 
//		return ok;}
//		else {
//			System.out.println("로그인필요");
//			return "redirect:/admin/admin-login";
//		}
//	}
//	@RequestMapping(value = "/admin/admin-review-manage/{number}", method = RequestMethod.GET)
//	public String review(Model model, HttpSession session, @PathVariable int number) {
//		String ok;
//		if(session.getAttribute("USER_ID")!=null) {
//		ok ="/admin/review/admin-review-manage";
//		System.out.println(number);
//		model.addAttribute("name", number);
//		return ok;}
//		else {
//			System.out.println("로그인필요");
//			return "redirect:/admin/admin-login";
//		}
//	}
//	@RequestMapping(value = "/admin/admin-qnalist-manage", method = RequestMethod.GET)
//	public String qnaList(Model model, HttpSession session) {
//		String ok;
//		if(session.getAttribute("USER_ID")!=null) {
//		ok ="/admin/qna/admin-qnalist-manage"; 
//		return ok;}
//		else {
//			System.out.println("로그인필요");
//			return "redirect:/admin/admin-login";
//		}
//	}
//	@RequestMapping(value = "/admin/admin-qna-manage/{number}", method = RequestMethod.GET)
//	public String qna(Model model, HttpSession session, @PathVariable int number) {
//		String ok;
//		if(session.getAttribute("USER_ID")!=null) {
//		ok ="/admin/qna/admin-qna-manage";
//		System.out.println(number);
//		model.addAttribute("name", number);
//		return ok;}
//		else {
//			System.out.println("로그인필요");
//			return "redirect:/admin/admin-login";
//		}
//	}
}
