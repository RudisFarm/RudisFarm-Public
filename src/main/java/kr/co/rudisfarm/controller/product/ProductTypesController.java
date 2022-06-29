package kr.co.rudisfarm.controller.product;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.rudisfarm.model.product.ProductTypeService;
import kr.co.rudisfarm.model.product.ProductTypeVO;

@Controller
public class ProductTypesController {
	
	@Autowired
	ProductTypeService productTypeService;
	
	//admin쪽 카테고리 관리 페이지
	@RequestMapping(value = "/admin/admin-keyword-manage", method = RequestMethod.GET)
	public String keyword(Model model) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		List<ProductTypeVO> Type = productTypeService.getProductType1();
		
		for(ProductTypeVO type : Type) {
			map.put(type.getTYPE1(), productTypeService.getProductType2(type.getTYPE1()));
		}
		model.addAttribute("type", map);
			
		return "/admin/product_types/admin-keyword-manage";
	}
	
	//카테고리 리스트 불러오기
	@RequestMapping(value = "/product-type", method = RequestMethod.POST)
	@ResponseBody
	public Object getProductType1() {
		Map<String, Object> map = new HashMap<String, Object>();
		List<ProductTypeVO> Type = productTypeService.getProductType1();
		
		for(ProductTypeVO type : Type) {
			List<ProductTypeVO> list = productTypeService.getProductType2(type.getTYPE1());
				map.put(type.getTYPE1(), list);
		}
		
		return map;
	}
	
	//카테고리1 추가하기
	@RequestMapping(value = "/product-type1-add", method = RequestMethod.POST)
	@ResponseBody
	public Object addProductType1(@RequestBody Map<String, Object> type) {
		
		ProductTypeVO productTypeVO = new ProductTypeVO();
		productTypeVO.setTYPE1((String) type.get("type1")); 
		productTypeVO.setTYPE2((String) type.get("type2")); 
		
		int result =  productTypeService.checkType1(productTypeVO);
		System.out.println("가져온 값 : "+result);
		
		if(result < 1) {
			productTypeService.addProductType(productTypeVO);
		} 
		System.out.println("결과 값 : "+result);
		return result;
	}	
	
	//카테고리2 추가하기
	@RequestMapping(value = "/product-type2-add", method = RequestMethod.POST)
	@ResponseBody
	public Object addProductType2(@RequestBody Map<String, Object> type) {
		
		ProductTypeVO productTypeVO = new ProductTypeVO();
		productTypeVO.setTYPE1((String) type.get("type1")); 
		productTypeVO.setTYPE2((String) type.get("type2")); 
		
		int result =  productTypeService.checkType2(productTypeVO);
		System.out.println("가져온 값 : "+result);
		
		if(result < 1) {
			productTypeService.addProductType(productTypeVO);
		} 
		System.out.println("결과 값 : "+result);
		return result;
	}	
	
	//카테고리 삭제
	@RequestMapping(value = "/product-type-delete", method = RequestMethod.DELETE)
	@ResponseBody
	public Object deleteProductType(@RequestBody Map<String, Object> type) {
		
		ProductTypeVO productTypeVO = new ProductTypeVO();
		productTypeVO.setTYPE1((String) type.get("type1")); 
		productTypeVO.setTYPE2((String) type.get("type2")); 
		
		int result = productTypeService.deleteProductType(productTypeVO);;
		
		System.out.println("결과 값 : "+result);
		return result;
	}	
	
	//정렬 옵션 가져오기
	@RequestMapping(value = "/product-sort", method = RequestMethod.POST)
	@ResponseBody
	public Object getProductSort() {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		
		map.put("최신 순","INPUTDATE");
		map.put("조회 순","COUNT");
		map.put("가격 높은 순","PRICEUP");
		map.put("가격 낮은 순","PRICEDOWN");
		
		return map;
	}
	
	//정렬 옵션 가져오기
	@RequestMapping(value = "/product-status", method = RequestMethod.POST)
	@ResponseBody
	public Object getProductStatus() {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		
		map.put("미승인", 0);
		map.put("승인", 1);
		map.put("정지", 2);
		map.put("재승인신청", 3);
		map.put("재승인거부", 4);
		map.put("탈퇴", 5);
		
		return map;
	}

	//카테고리
	@RequestMapping(value = "/product-categori-header", method = RequestMethod.POST)
	@ResponseBody
	public Object getHeader() {
		List<ProductTypeVO> productType = productTypeService.getProductType1();
		for(int i=6; i < productType.size(); i++) {
			productType.remove(i);
		}
		
		return productType;
	}
}
