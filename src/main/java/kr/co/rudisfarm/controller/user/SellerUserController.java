package kr.co.rudisfarm.controller.user;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.Socket;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.rudisfarm.model.chart.ChartService;
import kr.co.rudisfarm.model.chart.ChartVO;
import kr.co.rudisfarm.model.commons.api.BizRegInfoChecker;
import kr.co.rudisfarm.model.commons.pagenation.SuperAdminSellerPagenation;
import kr.co.rudisfarm.model.commons.pagenation.UserPagenation;
import kr.co.rudisfarm.model.commons.service.emailCheck.EmailCheckService;
import kr.co.rudisfarm.model.orders.OrdersService;
import kr.co.rudisfarm.model.orders.OrdersVO;
import kr.co.rudisfarm.model.product.ProductService;
import kr.co.rudisfarm.model.product.ProductVO;
import kr.co.rudisfarm.model.user.UserService;
import kr.co.rudisfarm.model.user.UserVO;
import kr.co.rudisfarm.model.user.impl.UserDAO;

@Controller
//@SessionAttributes({"USER_ID", "EMAIL", "NAME"})
public class SellerUserController {
	@Autowired
	UserService userService;
	
	@Autowired
	ProductService productService;

	@Autowired
	OrdersService ordersService;
	
	@Autowired
	EmailCheckService emailCheckService;
	
	@Autowired
	BCryptPasswordEncoder pwEncoder;
	
	@Autowired
	UserDAO userDAO;
	
	@Autowired
	ChartService chartService;

	// 비번 인코딩용, 나중에 삭제하기
	@RequestMapping(value = "/userEncode", method = RequestMethod.POST)
	@ResponseBody
	public Object encode() {
		List<UserVO> list = userDAO.allUser();
		for(UserVO vo : list) {
			vo.setPASSWORD(pwEncoder.encode(vo.getUSER_ID()));
			userDAO.encode(vo);
		}
		
		return true;
	}
	
	// 판매자 회원가입 form 표시
	@RequestMapping(value = "/seller-join", method = RequestMethod.GET)
	public String getSellerJoinView() {
		
		return "/seller/user/seller-join";
	}
	
//	// 판매자 회원가입
//	@RequestMapping(value = "/seller-join1", method = RequestMethod.POST)
//	@ResponseBody
//	public Object insertSeller(UserVO userVo, Model model) {
//		int insertResult = userService.sellerJoin(userVo);
//		
//		System.out.println(insertResult);
//		
//		HashMap<String, Object> map = new HashMap<String, Object>();
//		map.put("insertResult", insertResult);
//		
//		return map;
//	}

	//판매자 회원가입 및 상품등록 신청 (이미지 업로드)
	@RequestMapping(value = "/seller-join", method = RequestMethod.POST)
	@ResponseBody
	public Object testPutfile(UserVO uVo, ProductVO pVo, MultipartHttpServletRequest mtf, HttpServletRequest req) throws Exception  {
		boolean result=false;
		
		String serialPath = req.getSession().getServletContext().getRealPath("/").concat("resources\\upload\\images\\user\\"+uVo.getUSER_ID());
		File serialFolder = new File(serialPath);
		if(!serialFolder.exists()) {
			try {
				serialFolder.mkdir();
				System.out.println(uVo.getUSER_ID()+"유저의 폴더가 생성되었습니다/");
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
		
		System.out.println(mtf.getFileMap().size());
		System.out.println(serialImage);
		
		//사업자 등록 번호 증빙 파일 업로드
		fileName = serialImage.getOriginalFilename();
		if(fileName.length() < 1) {
			System.out.println("증빙사진이 없습니다.");
		} else {
			extension = fileName.substring(fileName.lastIndexOf("."),fileName.length());
			newFileName = format1.format(System.currentTimeMillis())+"-"+unique+extension; 
			ImageFile = new File(serialPath+"\\"+newFileName);
			serialImage.transferTo(ImageFile);
		}
		uVo.setFILE(newFileName);
		
		// 사업자 번호 등록정보 확인(API 이용)
		BizRegInfoChecker bizRegInfoChecker = new BizRegInfoChecker();
		uVo.setSERIAL_RESULT(bizRegInfoChecker.postCRN(uVo.getSERIAL()));
		
		// 비밀번호 암호화
		uVo.setPASSWORD(pwEncoder.encode(uVo.getPASSWORD()));
		
		if(userService.sellerJoinAndProduct(uVo) > 0) {
			System.out.println("SellerController:User => db저장 성공");
			productService.insertProduct(pVo);
			if(pVo.getPRODUCT_ID() > 0) {
				System.out.println("SellerController:Product => 저장된 게시글에 product_id : "+pVo.getPRODUCT_ID());
				
				String path = req.getSession().getServletContext().getRealPath("/")+"resources\\upload\\images\\product\\"+pVo.getPRODUCT_ID();
				File Folder = new File(path);
				
				if (!Folder.exists()) {
					try{
					    Folder.mkdir(); //폴더 생성합니다.
					    System.out.println(pVo.getPRODUCT_ID()+"번 폴더가 생성되었습니다.");
				        } 
				        catch(Exception e){
					    e.getStackTrace();
					}  
		         }else {
		     		System.out.println("이미 폴더가 생성되어 있습니다.");
		     	}
				
//				int unique=1;
				MultipartFile thumImage = mtf.getFile("thum-image");
				List<MultipartFile> descImage = mtf.getFiles("desc-image");
//				SimpleDateFormat format1 = new SimpleDateFormat ("MM-dd-yyyy");
//				String fileName, extension, newFileName = "", files="";
//				File ImageFile;
				
				//단일 파일 업로드
				fileName = thumImage.getOriginalFilename();
				if(fileName.length() < 1) {
					System.out.println("대표사진이 없습니다.");
				} else {
					extension = fileName.substring(fileName.lastIndexOf("."),fileName.length());
					newFileName = format1.format(System.currentTimeMillis())+"-"+unique+extension; 
					ImageFile = new File(path+"\\"+newFileName);
					thumImage.transferTo(ImageFile);
				}
				pVo.setSUMNAIL(newFileName);
				
				//다중 파일 업로드
				if(descImage.get(0).getOriginalFilename().length() < 1) {
					System.out.println("설명사진이 없습니다.");
				} else {
					for(int i=0; i<descImage.size(); i++) {
						if(i > 0) files = files + "/";
						unique++;
						fileName = descImage.get(i).getOriginalFilename();
						extension = fileName.substring(fileName.lastIndexOf("."),fileName.length());
						newFileName = format1.format(System.currentTimeMillis())+"-"+unique+extension; 
						
						ImageFile = new File(path+"\\"+newFileName);
						descImage.get(i).transferTo(ImageFile);
						files = files + newFileName;
					}
				}
				pVo.setFILES(files);
				
				//유저 정보를 DB에 넣는 서비스 메소드
				//userService.~~~~();
				
				//상품 정보를 DB에 넣는 서비스 메소드
				productService.updateProductImage(pVo);
				
				emailCheckService.sellerJoinSuccess(uVo.getEMAIL());
				
				result = true;
			} else {
				System.out.println("SellerController:Product => db저장 실패");
			}
		}

		return result;
	}
	
	// 판매자 회원가입 이메일 인증 버튼 클릭(인증코드 생성 및 메일 전송)
	@RequestMapping(value = "/seller-join/emailcheck", method = RequestMethod.POST)
	@ResponseBody
	public Object insertEmailcheck(@RequestBody HashMap<String, Object> jsonData) {
		int resultCode;
		
		//이미 존재하는 이메일인지 체크
		if(userService.emailCheck((String)jsonData.get("EMAIL")) != 0) {
			 resultCode = 0;
		} else {
			resultCode = emailCheckService.sellerJoinEmailCheck(jsonData);
		}
		
		//기존 방식(이메일 중복 검사 없이 바로 인증 시도)
//		resultCode = emailCheckService.sellerJoinEmailCheck(jsonData);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("resultCode", resultCode);
		
		return map;
	}
	
	// 판매자 회원가입 인증코드 조회(비교)
	@RequestMapping(value = "/seller-join/emailcheckresult", method = RequestMethod.POST)
	@ResponseBody
	public Object selectEmailcheck(@RequestBody HashMap<String, Object> jsonData) {
		int resultCode = emailCheckService.sellerJoinEmailCheckResult(jsonData);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("resultCode", resultCode);
		
		return map;
	}
	
	// 판매자 로그아웃
	@RequestMapping(value = "/seller/seller-logout", method = RequestMethod.GET)
	public String logoutSeller() {
		
		return "redirect:/";
	}
	
	// 판매자 메인 화면(인덱스)
	@RequestMapping(value = "/seller/seller-index", method = RequestMethod.GET)
	public String getSellerIndex(Model model, HttpSession session) {
		OrdersVO ordersVO = new OrdersVO();
		ordersVO.setUSER_ID((String)session.getAttribute("USER_ID"));
		
		model.addAttribute("orderSeller", ordersService.getSellerindexOrder(ordersVO));
		model.addAttribute("orderExchange", ordersService.getSellerindexExchange(ordersVO));
		model.addAttribute("orderReturn", ordersService.getSellerindexRetern(ordersVO));
		
		System.out.println(ordersService.getSellerindexOrder(ordersVO).size());

		String id = (String)session.getAttribute("USER_ID");
		ChartVO vo = new ChartVO();
		vo.setUSER_ID(id);
		Map<String, Object> map=new HashMap<>();
		Map<String, Object> sellerMap=new HashMap<>();
		List<ChartVO> list=chartService.getType2List(vo);	//장바구니 목록
		int total = chartService.getSellerPrice(id);
		List<ChartVO> totalList = chartService.getSellerPriceList(id); // 연도별 매출 현황
		int orders = chartService.getSellerOrders(id);
		List<ChartVO> orderList = chartService.getSellerOrderList(id); // 연도별 판매량 현황
		int count = chartService.getSellerCount(id);
		List<ChartVO> itemList = chartService.getSellerItemList(id); // 연도별 상품수량 현황
		int reviews = chartService.getSellerReview(id);
		List<ChartVO> reviewList = chartService.getSellerReviewList(id); // 연도별 상품수량 현황
		
		map.put("list", list); 	//전체 금액 
		model.addAttribute("type2", map);
		
		sellerMap.put("total", total);
		sellerMap.put("totalList", totalList);
		sellerMap.put("orders", orders);
		sellerMap.put("orderList", orderList);
		sellerMap.put("count", count);
		sellerMap.put("itemList", itemList);
		sellerMap.put("reviews", reviews);
		sellerMap.put("reviewList", reviewList);
		model.addAttribute("sellerMap", sellerMap);
		
		
		return "/seller/seller-index";
	}
	
	// 판매자 회원 정보 표시
	@RequestMapping(value = "/seller/seller-info", method = RequestMethod.GET)
	public String getSellerInfo(HttpSession session, Model model) {
		UserVO userVO = new UserVO();
		userVO.setUSER_ID((String)session.getAttribute("USER_ID"));
		UserVO resultUserVO = userService.selectSeller(userVO);
			
		if(userVO.getUSER_ID().equals(resultUserVO.getUSER_ID())) {
			model.addAttribute("resultUserVO", resultUserVO);
		}
		
		return "/seller/user/seller-info";
	}
	
	// 판매자 회원 정보 수정폼 표시
	@RequestMapping(value = "seller/seller-info-modify-form", method = RequestMethod.GET)
	public String showSellerInfoModifyForm(HttpSession session, Model model) {
		UserVO userVO = new UserVO();
		userVO.setUSER_ID((String)session.getAttribute("USER_ID"));
		UserVO resultUserVO = userService.selectSeller(userVO);
		
		if(userVO.getUSER_ID().equals(resultUserVO.getUSER_ID())) {
			model.addAttribute("resultUserVO", resultUserVO);
		}
		
		return "/seller/user/seller-info-modify-form";
	}
	
	// 판매자 회원 정보 수정
	@RequestMapping(value = "/seller/seller-info", method = RequestMethod.PUT)
	@ResponseBody
	public Object updateSellerInfo(HttpSession session, @RequestBody HashMap<String, Object> jsonData) {
		int resultCode = userService.updateSeller((String)session.getAttribute("USER_ID"), jsonData, session);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("resultCode", resultCode);
		
		return map;
	}
	
	// 판매자 비밀번호 수정폼 표시
	@RequestMapping(value = "/seller/seller-password", method = RequestMethod.GET)
	public String showSellerPasswordModifyForm() {
		
		return "/seller/user/seller-password";
	}
	
	// 판매자 비밀번호 수정
	@RequestMapping(value = "/seller/seller-password", method = RequestMethod.PUT)
	@ResponseBody
	public Object updateSellerPassword(@RequestBody HashMap<String, Object> jsonData, HttpSession session) {
		int resultCode = userService.updateSellerPassword((String)session.getAttribute("USER_ID"), jsonData);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("resultCode", resultCode);
		
		return map;
	}
	
	// 판매자 재승인 요청폼 표시
	@RequestMapping(value = "/seller/seller-reconfirm", method = RequestMethod.GET)
	public String showSellerSerialModifyeForm(HttpSession session, Model model) {
		UserVO userVO = new UserVO();
		userVO.setUSER_ID((String)session.getAttribute("USER_ID"));
		UserVO resultUserVO = userService.selectSeller(userVO);
			
		if(userVO.getUSER_ID().equals(resultUserVO.getUSER_ID())) {
			model.addAttribute("resultUserVO", resultUserVO);
		}
		
		return "/seller/user/seller-reconfirm";
	}
	
	// 판매자 재승인 요청
	@RequestMapping(value = "/seller/seller-info", method = RequestMethod.POST)
	@ResponseBody
	public Object updateSellerSerial(HttpSession session, UserVO userVO, MultipartHttpServletRequest mtf, HttpServletRequest req) {
		System.out.println("재승이 신청한 유저"+(String)session.getAttribute("USER_ID"));
		int resultCode = userService.updateSellerSerial((String)session.getAttribute("USER_ID"), userVO, mtf, req);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("resultCode", resultCode);
		
		return map;
	}
	
	// 판매자 회원 탈퇴폼 표시
	@RequestMapping(value = "/seller/seller-out", method = RequestMethod.GET)
	public String showDeleteSellerForm() {
		
		return "/seller/user/seller-out";
	}
	
	// 판매자 회원 탈퇴
	@RequestMapping(value = "/seller/seller-info", method = RequestMethod.DELETE)
	@ResponseBody
	public Object deleteSeller(@RequestBody HashMap<String, Object> jsonData, HttpSession session) {
		int resultCode = userService.deleteSeller((String)session.getAttribute("USER_ID"), jsonData);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("resultCode", resultCode);
		
		return map;
	}

	// 판매자 리뷰 조회
	
	// 판매자 QnA 조회 및 답변
	
	
	// <관리자>
	// 판매자 목록 조회
	@RequestMapping(value = "/admin/admin-seller-manage", method = RequestMethod.GET)
	public String getAdminSellerInfoList(@RequestParam(value = "page", required = false, defaultValue = "1") int page,
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
		
		UserPagenation sellerPagenation = userService.selectAdminSellerList(pageInfo);
		
		model.addAttribute("sellerPagenation", sellerPagenation);
		model.addAttribute("keywordType", keywordType);
		model.addAttribute("keyword", keyword);
		model.addAttribute("sort", sort);
		model.addAttribute("keywordTypeUrl", "&keywordType="+keywordType);
		model.addAttribute("keywordUrl", "&keyword="+keyword);
		model.addAttribute("sortUrl", "&sort="+sort);
		
		return "/admin/user/admin-seller-manage";
	}
	
	// 판매자 상세보기
	@RequestMapping(value = "/admin/admin-seller-manage/{USER_ID}", method = RequestMethod.GET)
	public String getAdminSellerInfoDetail(@RequestParam(value = "prevPage", required = false, defaultValue = "1") int prevPage,
			@RequestParam(value = "keywordType", required = false, defaultValue = "") String keywordType,
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
			@RequestParam(value = "sort", required = false, defaultValue = "JOINDATE") String sort,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@PathVariable String USER_ID, Model model) {

		//판매자 정보
		UserVO userVO = new UserVO();
		userVO.setUSER_ID(USER_ID);
		UserVO resultUserVO = userService.selectSeller(userVO);
		
		model.addAttribute("resultUserVO", resultUserVO);
		model.addAttribute("prevPage", prevPage);
		model.addAttribute("keywordType", keywordType);
		model.addAttribute("keyword", keyword);
		model.addAttribute("sort", sort);
		model.addAttribute("pageUrl", "?page="+prevPage);
		model.addAttribute("keywordTypeUrl", "&keywordType="+keywordType);
		model.addAttribute("keywordUrl", "&keyword="+keyword);
		model.addAttribute("sortUrl", "&sort="+sort);

		//결제 정보
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("user", "판매자");
		map.put("USER_ID", USER_ID);
		map.put("page", page);
		map.put("currentPage", (page - 1) * 10);
		
		List<OrdersVO> adminsellerList = ordersService.getsuperAdminSellerPaymentList(map);
		int listCount = ordersService.getsuperAdminSellerPaymentListCount(map);
		
		SuperAdminSellerPagenation superAdminSellerPagenation = 
				new  SuperAdminSellerPagenation(adminsellerList, (int) map.get("page"), listCount);
		
		System.out.println("adminsellerList 실행");
		System.out.println("adminsellerList 리스트 카운트 : " + listCount);
		System.out.println("adminsellerList 사이즈 : " + adminsellerList.size());
		
		model.addAttribute("superadminseller", superAdminSellerPagenation);
		
		return "/admin/user/admin-seller-manage-detail";
	}
	
	// 최고관리자의 판매자 회원 상태 수정
	@RequestMapping(value = "/admin/admin-seller-manage/{USER_ID}", method = RequestMethod.PUT)
	@ResponseBody
	public Object updateAdminSellerInfo(@PathVariable String USER_ID, @RequestBody HashMap<String, Object> jsonData) {
		int resultCode = userService.updateAdminSeller(USER_ID, jsonData);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("resultCode", resultCode);
		
		return map;
	}
	
	// 최고관리자의 판매자 회원 가입 거부
	@RequestMapping(value = "/admin/admin-seller-manage/{USER_ID}", method = RequestMethod.DELETE)
	@ResponseBody
	public Object deleteAdminSellerInfo(@PathVariable String USER_ID, @RequestBody HashMap<String, Object> jsonData) {
		int resultCode = userService.deleteAdminSeller(USER_ID);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("resultCode", resultCode);
		
		return map;
	}

	// 파이썬 데이터 통신 
		//chart1 데이터 통신 월별 통계
		@RequestMapping(value = "/seller/seller-index", method = RequestMethod.POST)	  
		@ResponseBody
		public Object chart1( @RequestBody HashMap<String, Object> jsonData,HttpSession session,  Model model,HttpServletRequest request) {
			String id = (String)session.getAttribute("USER_ID");  
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("month", jsonData.get("MONTH"));
			map.put("year", jsonData.get("YEAR"));
			map.put("id", id);
			map.put("chart", 1);
			JSONObject json =  new JSONObject(map);
			try {	

					// 소켓에 접속하기 위한 접속 정보를 선언한다.
				Socket socket = new Socket("127.0.0.1", 9999); // 소켓 서버에 접속 
				System.out.println("socket 서버에 접속 성공!");
				
	                        // OutputStream - 클라이언트에서 Server로 메세지 발송
	                        OutputStream out = socket.getOutputStream(); 
	                        // socket의 OutputStream 정보를 OutputStream out에 넣은 뒤 
	                        PrintWriter writer = new PrintWriter(out, true); 
	                        // PrintWriter에 위 OutputStream을 담아 사용

	                        writer.println(json); 
	                        // 클라이언트에서 서버로 메세지 보내기

	                        // InputStream - Server에서 보낸 메세지 클라이언트로 가져옴
	                        // socket의 InputStream 정보를 InputStream in에 넣은 뒤
	                        BufferedReader reader = new BufferedReader(
	                        		new InputStreamReader(socket.getInputStream(),"EUC_KR"));

	                        // BufferedReader에 위 InputStream을 담아 사용
	                        
	                        Object a=reader.readLine();
	                        
	                        HashMap<String, Object> chart;
	                        try {
	                        	chart= new ObjectMapper().readValue((String)a, HashMap.class);
	                        	List<HashMap<String, Object>> result = (List<HashMap<String, Object>>)chart.get("result");
	        					
	        					// 서버에서 온 메세지 확인
	        					System.out.println("CLIENT SOCKET CLOSE");
	        					socket.close(); // 소켓 종료
	        					if(chart != null)  
	        						return chart; 
	        				} catch (Exception e) {
	        					System.err.print("파이썬 통신 오류");
	        					
	        					return false;
	        				}
	                                             
	                        // 서버에서 온 메세지 확인
	                        System.out.println("CLIENT SOCKET CLOSE");
	                        socket.close(); // 소켓 종료
	                     if(chart != null)  
	                     return chart; 	               
			} catch(IOException e) {
//				e.printStackTrace();
				System.err.print("파이썬 통신 에러");
				return false;
			}  
			return true;
		}
		//chart2 데이터 통신 남녀 통계
		@RequestMapping(value = "/seller/seller-index/chart", method = RequestMethod.POST)	  
		@ResponseBody
		public Object chart2( @RequestBody HashMap<String, Object> jsonData,HttpSession session,  Model model,HttpServletRequest request) {
			String id = (String)session.getAttribute("USER_ID");  
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("type", jsonData.get("TYPE"));
			map.put("id", id);
			map.put("chart", 2);
			JSONObject json =  new JSONObject(map);
			try {	
				
				// 소켓에 접속하기 위한 접속 정보를 선언한다.
				Socket socket = new Socket("127.0.0.1", 9999); // 소켓 서버에 접속 
				System.out.println("socket 서버에 접속 성공!");
				
				// OutputStream - 클라이언트에서 Server로 메세지 발송
				OutputStream out = socket.getOutputStream(); 
				// socket의 OutputStream 정보를 OutputStream out에 넣은 뒤 
				PrintWriter writer = new PrintWriter(out, true); 
				// PrintWriter에 위 OutputStream을 담아 사용
				
				writer.println(json); 
				// 클라이언트에서 서버로 메세지 보내기
				
				// InputStream - Server에서 보낸 메세지 클라이언트로 가져옴
				// socket의 InputStream 정보를 InputStream in에 넣은 뒤
				BufferedReader reader = new BufferedReader(
						new InputStreamReader(socket.getInputStream(),"EUC_KR"));
				
				// BufferedReader에 위 InputStream을 담아 사용
				
				Object a=reader.readLine();
				
				
				HashMap<String, Object> chart;
				try {
					chart = new ObjectMapper().readValue((String)a, HashMap.class);
					List<HashMap<String, Object>> result = (List<HashMap<String, Object>>)chart.get("result");
					
					// 서버에서 온 메세지 확인
					System.out.println("CLIENT SOCKET CLOSE");
					socket.close(); // 소켓 종료
					if(chart != null)  
						return chart; 
				} catch (Exception e) {
					System.err.print("파이썬 통신 오류");
					
					return false;
				}
				
				
			} catch(IOException e) {
//				e.printStackTrace();
				System.err.print("파이썬 통신 오류");
				
				return false;
			}  
			return true;
		}
	
//	// 프리미엄 판매자 등록 이동
//	@RequestMapping(value = "/seller/seller-product-manage-premium-form", method = RequestMethod.GET)
//	public String addProductPremium() {
//		
//		
//		
//		return "/seller/product/seller-product-manage-premium-form";
//	}

	//프리미엄 판매자 등록
	@RequestMapping(value = "/seller/seller-product-manage-premium", method = RequestMethod.POST)
	public String addProductPremiumSeller(HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String user_id = (String)session.getAttribute("USER_ID");
		
		map.put("USER_ID", user_id);
		map.put("isPremium", 1);
		
		int result = userService.isPremiumUpdate(map);
		System.out.println("실행 결과 :"+result);
		return "redirect:seller-product-manage";
	}
}
