package kr.co.rudisfarm.controller.index;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.rudisfarm.model.cart.CartService;
import kr.co.rudisfarm.model.cart.CartVO;
import kr.co.rudisfarm.model.product.ProductTypeService;
import kr.co.rudisfarm.model.product.ProductTypeVO;
import kr.co.rudisfarm.model.index.IndexService;
import kr.co.rudisfarm.model.product.ProductVO;
import kr.co.rudisfarm.model.user.UserVO;

/**
 * Handles requests for the application home page.
 */
@Controller
@SessionAttributes("USER_ID")
public class IndexController {
	@Autowired
	CartService cartService;
	
	@Autowired
	ProductTypeService productTypeService;

	@Autowired
	IndexService indexService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index(HttpSession session, Model model) {
		Map<String, Object> map=new HashMap<String, Object>();
		String id = (String)session.getAttribute("USER_ID");

		List<ProductTypeVO> productType = productTypeService.getProductType1();
		for(int i=6; i < productType.size(); i++) {
			productType.remove(i);
		}
		map.put("productTypeList", productType); 	
		
		CartVO vo = new CartVO();
		vo.setUSER_ID(id);		
		List<CartVO> list=cartService.getCartList(vo);
		int sumMoney=cartService.sumMoney(id); 
		//session.getAttribute("USER_ID");
		map.put("list", list);			//장바구니 목록
		map.put("count", list.size()); 	//레코드 갯수
		map.put("sumMoney", sumMoney); 	//전체 금액
		
		model.addAttribute("map", map);
		
		//파이썬 API 서버와 통신 테스트
//		List<CartVO> listxx = new ArrayList<CartVO>();
//		CartVO cartVO = new CartVO();
//		cartVO.setUSER_ID("ImUser");
//		cartVO.setPRICE(100000);
//		listxx.add(cartVO);
//		listxx.add(cartVO);
//		listxx.add(cartVO);
//		listxx.add(cartVO);
//		listxx.add(cartVO);
//		
//		HashMap<String, Object> postJsonData = new HashMap<String, Object>();
//		postJsonData.put("data", "can you see this?");
//		
//		String jsonList = new Gson().toJson(listxx);
//		postJsonData.put("jsonList", jsonList);
//		
//		RestTemplate restTemplate = new RestTemplate();
//		restTemplate.getMessageConverters().add(new StringHttpMessageConverter());
//		
//		String url = "http://0.0.0.0:80/hello";
//		HashMap<String, Object> mapTest = restTemplate.postForObject(url, postJsonData, HashMap.class);
//		List<HashMap<String, Object>> ListTest = restTemplate.postForObject("http://0.0.0.0:80/hello2", postJsonData, List.class);
//		if(mapTest != null) {
//			System.out.println("응답이 왔다.");
//			System.out.println((int)mapTest.get("hello"));
//			
//			System.out.println("리스트로 오나요?");
//			System.out.println(ListTest.size());
//			System.out.println( (int)(ListTest.get(0).get("hello")) );
//			System.out.println( (int)(ListTest.get(1).get("hello")) );
//		}
		   
		return "index";
	}
	
	@RequestMapping(value = "/error404", method = RequestMethod.GET)
	public String error404(HttpServletResponse response, HttpSession session, Model model) {
		response.setStatus(HttpServletResponse.SC_OK);
		
		
		String url = "";
		if(session.getAttribute("LEVEL") != null) {
			if(session.getAttribute("LEVEL").equals(0)) {
				url = "/rudisfarm/admin/admin-index";
			} else if(session.getAttribute("LEVEL").equals(1)) {
				url = "/rudisfarm/seller/seller-index";
			} else if(session.getAttribute("LEVEL").equals(2)) {
				url = "/rudisfarm/";
			}
			
			model.addAttribute("url", url);
		}
		
	
		return "error404";
	}
	
	@RequestMapping(value = "/error403", method = RequestMethod.GET)
	public String error403(HttpServletResponse response, HttpSession session, Model model) {
		String url = "";
		if(session.getAttribute("LEVEL").equals(0)) {
			url = "/rudisfarm/admin/admin-index";
		} else if(session.getAttribute("LEVEL").equals(1)) {
			url = "/rudisfarm/seller/seller-index";
		} else if(session.getAttribute("LEVEL").equals(2)) {
			url = "/rudisfarm/";
		}
		
		model.addAttribute("url", url);
	
		return "error403";
	}
	
	// 인덱스 프리미엄 상품 보기
	@RequestMapping(value = "/index-premiumproduct", method = RequestMethod.POST)
	@ResponseBody
	public Object getIndexPremiumProduct() {
		System.out.println("[controller:인덱스 프리미엄 회원 상품 보기]");
		List<ProductVO> list = indexService.getIndexPremiumProduct();
		
		for(ProductVO pVo : list) {
			if(pVo.getPRODUCT_NAME().length() > 9) {
				pVo.setPRODUCT_NAME(pVo.getPRODUCT_NAME().substring(0, 8)+"...");
			}
		}
		
		return list;
	}
	
	// 인덱스 신규 상품 보기
	@RequestMapping(value = "/index-newproduct", method = RequestMethod.POST)
	@ResponseBody
	public Object getIndexNewProduct() {
		System.out.println("[controller:인덱스 신규 상품 보기]");
		List<ProductVO> list = indexService.getIndexNewProduct();
		
		for(ProductVO pVo : list) {
			if(pVo.getPRODUCT_NAME().length() > 9) {
				pVo.setPRODUCT_NAME(pVo.getPRODUCT_NAME().substring(0, 8)+"...");
			}
		}
		
		return list;
	}
		
	// 인덱스 추천 상품 보기(랜덤)
	@RequestMapping(value = "/index-randomproduct", method = RequestMethod.POST)
	@ResponseBody
	public Object getIndexRecommendProduct() {
		System.out.println("[controller:인덱스 추천 상품 보기]");
		List<ProductVO> list = indexService.getIndexRecommendProduct();
		System.out.println("[controller:랜덤 리스트]" + list);
		
		for(ProductVO pVo : list) {
			if(pVo.getPRODUCT_NAME().length() > 9) {
				pVo.setPRODUCT_NAME(pVo.getPRODUCT_NAME().substring(0, 8)+"...");
			}
		}
		
		return list;
	}
}
