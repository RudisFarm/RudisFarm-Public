package kr.co.rudisfarm.controller.product;


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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.rudisfarm.model.commons.pagenation.Pagenation;
import kr.co.rudisfarm.model.payment.PremiumVO;
import kr.co.rudisfarm.model.product.ProductService;
import kr.co.rudisfarm.model.product.ProductVO;
import kr.co.rudisfarm.model.user.UserService;
import kr.co.rudisfarm.model.user.UserVO;

@Controller
@SessionAttributes({"USER_ID", "EMAIL", "USER_NAME"})
public class SellerProductController {
	
	@Autowired
	ProductService productService;
	
	@Autowired
	UserService userService;
	
	// 등록한 상품 관리 페에지 이동
	@RequestMapping(value = "/seller/seller-product-manage", method = RequestMethod.GET)
	public String getProductListForm(@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
			@RequestParam(value = "type1", required = false, defaultValue = "") String type1,
			@RequestParam(value = "type2", required = false, defaultValue = "") String type2,
			@RequestParam(value = "sort", required = false, defaultValue = "INPUTDATE") String sort,
			@ModelAttribute("USER_ID") String USER_ID, Model model) {
			
		Map<String, Object> map = new HashMap<String, Object>();
		
		int limit=10;
		map.put("user", "판매자");
		map.put("user_id", USER_ID);
		map.put("keyword", keyword);
		map.put("page", page);
		map.put("currentPage", (page - 1) * limit);
		map.put("type1", type1);
		map.put("type2", type2);
		map.put("sort", sort);
		map.put("limit",limit);
		
		List<Object> productList = productService.getProductList(map);
		int listCount = productService.getProductListCount(map);
		
		Pagenation pagenation = new Pagenation(productList, (int) map.get("page"), listCount, (int) map.get("limit"),
				(String) map.get("keyword"), (String) map.get("type1"), (String) map.get("type2"),
				(String) map.get("sort"));
		
		model.addAttribute("productPagenation", pagenation);		
		
		return "/seller/product/seller-product-manage";
	}
	
	// 등록한 상품 상세보기 페이지 이동
	@RequestMapping(value = "/seller/seller-product-manage/{PRODUCT_ID}", method = RequestMethod.GET)
	public Object detailProductForm(@PathVariable int PRODUCT_ID, HttpSession session,Model model) {
		String url = "/seller/seller-product-manage";
		String id = (String)session.getAttribute("USER_ID"); 
		ProductVO productVO = new ProductVO();
		productVO.setPRODUCT_ID(PRODUCT_ID);
		productVO = productService.getProduct(productVO);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("productId", PRODUCT_ID);
		map.put("id", id);
		map.put("chart", 3);
		JSONObject json =  new JSONObject(map);
		
		UserVO userVO = userService.getUserByID(productVO.getUSER_ID());
		model.addAttribute("user", userVO);
		
		if(productVO != null) {
//			System.out.println("리스트 가져옴!");
			try {	
				
				// 소켓에 접속하기 위한 접속 정보를 선언한다.
				Socket socket = new Socket("127.0.0.1", 9999); // 소켓 서버에 접속 
				System.out.println("socket 서버에 접속 성공!");
				
				OutputStream out = socket.getOutputStream(); 
				PrintWriter writer = new PrintWriter(out, true); 
				
				writer.println(json); 
				BufferedReader reader = new BufferedReader(
						new InputStreamReader(socket.getInputStream(),"EUC_KR"));	
				Object a=reader.readLine();
			if(a!=null) {
				ObjectMapper mapper = new ObjectMapper(); 
				String jsonList="";
				jsonList = mapper.writeValueAsString(a); 
				// 서버에서 온 메세지 확인
				model.addAttribute("json", jsonList);
			} else {
				System.out.println("데이터가 없습니다.");
			}
			
			
			System.out.println("CLIENT SOCKET CLOSE");
			socket.close(); // 소켓 종료
			} catch(IOException e) {
//				e.printStackTrace();
				System.err.print("파이썬 통신 불가");
			}  
			
			if (!productVO.getFILES().equals("")) {
				String[] files = productVO.getFILES().split("/");
				model.addAttribute("descFiles", files);
			}
			productVO.setDESCRIPTION(productVO.getDESCRIPTION().replace("\r\n", "<br>"));
			model.addAttribute("product", productVO);
			
			url="/seller/product/seller-product-manage-detail-form";
		}
		return url;
	}
	
	// 상품 등록 페이지 이동
	@RequestMapping(value = "/seller/seller-product-manage-add-form", method = RequestMethod.GET)
	public String addProductForm() {

		return "/seller/product/seller-product-manage-add-form";
	}
	
	// 등록한 상품 등록 및 수정 기능 (Product_id 값 여부에 따라 등록 수정 함) *ajax
	@ResponseBody
	@RequestMapping(value = "/seller/seller-product-manage/{PRODUCT_ID}", method = RequestMethod.POST)
	public Object updateProduct(@PathVariable int PRODUCT_ID, ProductVO pVo, MultipartHttpServletRequest mtf,
			HttpServletRequest req) throws Exception {
		boolean result=false;
		
		//상품 새로 등록시
		if(PRODUCT_ID == 0) {
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
				
				int unique=1;
				MultipartFile thumImage = mtf.getFile("thum-image");
				List<MultipartFile> descImage = mtf.getFiles("desc-image");
				SimpleDateFormat format1 = new SimpleDateFormat ("MM-dd-yyyy");
				String fileName, extension, newFileName = "", files="";
				File ImageFile;
				
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
						if(i > 5) continue;  // 파일 업로드 갯수 제한
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
				
				productService.updateProductImage(pVo);
				result = true;
			} else {
				System.out.println("SellerProductController:Product => db저장 실패");
			}
			
		//상품 수정 시	
		} else {
			System.out.println(pVo.getCOUNT());
			productService.updateProduct(pVo);
			if(pVo.getPRODUCT_ID() > 0) {
				System.out.println("SellerProductController:Product => 업데이트된 product_id : "+pVo.getPRODUCT_ID());
				
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
				
				int unique=1;
				MultipartFile thumImage = mtf.getFile("thum-image");
				List<MultipartFile> descImage = mtf.getFiles("desc-image");
				SimpleDateFormat format1 = new SimpleDateFormat ("MM-dd-yyyy");
				String fileName, extension, newFileName = "", files="";
				File ImageFile;
				
				//단일 파일 업로드
				fileName = thumImage.getOriginalFilename();
				if(fileName.length() < 1) {
					System.out.println("대표사진이 없습니다.");
				} else {
					extension = fileName.substring(fileName.lastIndexOf("."),fileName.length());
					newFileName = format1.format(System.currentTimeMillis())+"-"+unique+extension; 
					ImageFile = new File(path+"\\"+newFileName);
					thumImage.transferTo(ImageFile);
					pVo.setSUMNAIL(newFileName);
					productService.updateProductImageSumnail(pVo);
				}
				
				//다중 파일 업로드
				if(descImage.get(0).getOriginalFilename().length() < 1) {
					System.out.println("설명사진이 없습니다.");
				} else {
					for(int i=0; i<descImage.size(); i++) {
						if(i > 5) continue;  // 파일 업로드 갯수 제한
						if(i > 0) files = files + "/"; 		// 파일 : file/file/file 이런식으로 나오게 하기 위해서
						unique++;
						fileName = descImage.get(i).getOriginalFilename();
						extension = fileName.substring(fileName.lastIndexOf("."),fileName.length());
						newFileName = format1.format(System.currentTimeMillis())+"-"+unique+extension; 
						
						ImageFile = new File(path+"\\"+newFileName);
						descImage.get(i).transferTo(ImageFile);
						files = files + newFileName;
					}
					pVo.setFILES(files);
					productService.updateProductImageFile(pVo);
				}
				
				result = true;
			} else {
				System.out.println("SellerProductController:Product => db저장 실패");
			}
			
		}
		return result;
	}
	
	// 등록한 상품 수정 페이지 이동
	@RequestMapping(value = "/seller/seller-product-manage-update-form/{PRODUCT_ID}", method = RequestMethod.GET)
	public String updateProductForm(@PathVariable int PRODUCT_ID, Model model) {
			String url = "/seller/seller-product-manage";
		
			ProductVO productVO = new ProductVO();
			productVO.setPRODUCT_ID(PRODUCT_ID);
			productVO = productService.getProduct(productVO);
			
			if(productVO != null) {
				System.out.println("리스트 가져옴!");
				model.addAttribute("product", productVO);
				url="/seller/product/seller-product-manage-update-form";
			}
			
		return url;
	}
	
	// 등록한 상품 삭제 기능 *ajax
	@ResponseBody
	@RequestMapping(value = "/seller/seller-product-manage/{PRODUCT_ID}", method = RequestMethod.DELETE)
	public Object deleteProduct(@PathVariable int PRODUCT_ID) {
		
		boolean whether=false;
		
		ProductVO productVO = new ProductVO();
		productVO.setPRODUCT_ID(PRODUCT_ID);
		productService.deleteCart(PRODUCT_ID);
		int result = productService.deleteProduct(productVO);
		
		
		if(result > 0) {
			whether=true;
		} 
		
		return whether;
	}
	
	// 프리미엄 판매자 등록 이동
	@RequestMapping(value = "/seller/seller-product-manage-premium-form", method = RequestMethod.GET)
	public String addProductPremium(Model model, HttpSession session,@RequestParam(value = "page", required = false, defaultValue = "1") int page) {
		String id = (String)session.getAttribute("USER_ID");
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("USER_ID",id);
			map.put("COL","PREMIUM_COUNT");
			
			int count = productService.checkColUser(map);
			List<PremiumVO> premiumList = productService.getPremiumList(id);
			
			model.addAttribute("primiumCount", count);
			model.addAttribute("premiumList", premiumList);
		return "/seller/product/seller-product-manage-premium-form";
	}
}
