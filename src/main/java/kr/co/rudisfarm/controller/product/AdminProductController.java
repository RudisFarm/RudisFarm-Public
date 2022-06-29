package kr.co.rudisfarm.controller.product;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.rudisfarm.model.commons.pagenation.Pagenation;
import kr.co.rudisfarm.model.product.ProductService;
import kr.co.rudisfarm.model.product.ProductTypeVO;
import kr.co.rudisfarm.model.product.ProductVO;
import kr.co.rudisfarm.model.user.UserService;
import kr.co.rudisfarm.model.user.UserVO;

@Controller
public class AdminProductController {
	
	@Autowired
	ProductService productService;
	
	@Autowired
	UserService userService;
	
	// 관리자 상품 관리 페에지 이동
	@RequestMapping(value = "/admin/admin-product-manage", method = RequestMethod.GET)
	public String getProductListForm(@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
			@RequestParam(value = "type1", required = false, defaultValue = "") String type1,
			@RequestParam(value = "type2", required = false, defaultValue = "") String type2,
			@RequestParam(value = "sort", required = false, defaultValue = "INPUTDATE") String sort,
			@RequestParam(value = "status", required = false, defaultValue = "1") int status,
			@ModelAttribute("USER_ID") String USER_ID, Model model) {
			
		Map<String, Object> map = new HashMap<String, Object>();
		
		int limit=10;
		map.put("user", "관리자");
		map.put("user_id", USER_ID);
		map.put("keyword", keyword);
		map.put("page", page);
		map.put("currentPage", (page - 1) * limit);
		map.put("type1", type1);
		map.put("type2", type2);
		map.put("sort", sort);
		map.put("status", status);
		map.put("limit",limit);
		
		List<Object> productList = productService.getProductList(map);
		int listCount = productService.getProductListCount(map);
		
		Pagenation pagenation = new Pagenation(productList, (int) map.get("page"), listCount, (int) map.get("limit"),
				(String) map.get("keyword"), (String) map.get("type1"), (String) map.get("type2"),
				(String) map.get("sort"));
		
		model.addAttribute("productPagenation", pagenation);
		model.addAttribute("status", status);
		
		return "/admin/product/admin-product-manage";
	}
	
	// 등록된 상품 상세보기 페이지 이동
	@RequestMapping(value = "/admin/admin-product-manage/{PRODUCT_ID}", method = RequestMethod.GET)
	public String detailProductForm(@PathVariable int PRODUCT_ID,Model model) {
		String url = "/admin/product/admin-product-manage";
		
		ProductVO productVO = new ProductVO();
		productVO.setPRODUCT_ID(PRODUCT_ID);
		productVO = productService.getProduct(productVO);
		UserVO userVO = userService.getUserByID(productVO.getUSER_ID());
		model.addAttribute("user", userVO);
		
		if(productVO != null) {
			System.out.println("리스트 가져옴!");
			if (!productVO.getFILES().equals("")) {
				String[] files = productVO.getFILES().split("/");
				model.addAttribute("descFiles", files);
			}
			productVO.setDESCRIPTION(productVO.getDESCRIPTION().replace("\r\n", "<br>"));
			
			model.addAttribute("product", productVO);
			url="/admin/product/admin-product-manage-detail-form";
		}
		return url;
	}
	
	// 등록된 상품 삭제 기능 *ajax
	@ResponseBody
	@RequestMapping(value = "/admin/admin-product-manage/{PRODUCT_ID}", method = RequestMethod.DELETE)
	public Object deleteProduct(@PathVariable int PRODUCT_ID) {
		
		boolean whether=false;
		
		ProductVO productVO = new ProductVO();
		productVO.setPRODUCT_ID(PRODUCT_ID);
		int result = productService.deleteProduct(productVO);
		
		if(result > 0) {
			whether=true;
		} 
		
		return whether;			
	}
	
}
