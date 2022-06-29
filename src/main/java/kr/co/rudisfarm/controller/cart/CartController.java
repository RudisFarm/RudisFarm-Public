package kr.co.rudisfarm.controller.cart;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import kr.co.rudisfarm.model.cart.CartService;
import kr.co.rudisfarm.model.cart.CartVO;
import kr.co.rudisfarm.model.product.ProductService;
@SessionAttributes("USER_ID")
@Controller
public class CartController {
	
		@Autowired
		CartService cartService;

		@Autowired
		ProductService productService;
		
		//상품 리스트 출력
		@RequestMapping(value = "/my-page/my-cart", method = RequestMethod.GET)
		public String cartList(HttpSession session, Model model) {
		String id = (String)session.getAttribute("USER_ID");
		
		if(id != null) { 
		    Map<String, Object> map=new HashMap<>();
		    CartVO vo = new CartVO();
		    vo.setUSER_ID(id);
	        List<CartVO> list=cartService.getCartList(vo);	//장바구니 목록
	        int sumMoney=cartService.sumMoney(id); 	//금액 합계
	        int fee= sumMoney >= 30000 ? 0 : 2500; 
	        
	        map.put("sumMoney", sumMoney); 	//전체 금액
	        map.put("fee", fee); 			//배송료
	        map.put("list", list); 			//장바구니 목록
	        map.put("count", list.size()); 	//레코드 갯수
	        map.put("sum", sumMoney+fee); 	//전체 금액
	        map.put("USER_ID", id);
	       
		
			model.addAttribute("map", map);
	
			return "/buyer/cart/my-cart";
		    }else { //로그인하지 않은 상태
		
		        return "/";
		           //로그인을 하지 않았으면 로그인 페이지로 이동시킨다. 아직 페이지 없음
		    }
		}
		
		//상품 수량 변경
		@RequestMapping(value = "/my-page/my-cart", method = RequestMethod.PUT)
		@ResponseBody
		public Object updateCart(HttpSession session,@RequestBody HashMap<String, Object> jsonData, Model model) {
			String id = (String)session.getAttribute("USER_ID");
			System.out.println("갱신할 유저 : " +id + "카트 ID :" + (int)jsonData.get("CART_ID") + "수량 : "+(int)jsonData.get("COUNT"));
			
			
			HashMap<String, Object> returnMap = new HashMap<String, Object>();
			HashMap<String, Object> countMap = new HashMap<String, Object>();
			
			int productid = Integer.parseInt(jsonData.get("PRODUCT_ID").toString());
			
			countMap.put("COL", "COUNT");
			countMap.put("PRODUCT_ID", productid);
			int count = productService.checkCol(countMap);
			int NumCount = Integer.parseInt(jsonData.get("COUNT").toString());
			System.out.println("해당 상품의 개수"+count);
			
			
			if(count >= NumCount) {
				//1. 사용자가 선택한 상품의 수량 변경
				int result = cartService.cartUpdate(jsonData);
				returnMap.put("result", result);
				
				//2. 사용자가 장바구니에 넣어둔 모든 상품의 총합금액을 다시 계산해서 저장
				int sumMoney=cartService.sumMoney(id);
				int fee= sumMoney >= 30000 ? 0 : 2500; 
				String sumMoneyF=String.format("%,d", sumMoney);
				String sumF = String.format("%,d", sumMoney+fee);
				returnMap.put("sumMoneyF", sumMoneyF);
				returnMap.put("sumF", sumF);
				returnMap.put("fee", fee);
		
				
				return returnMap; //상품의 갯수보다 적거나 같은 갯수만큼 저장 할 시 리턴
			} else {
				return false;  //상품의 갯수보다 많이 저장할 시 false 리턴
			}	
		}
		//상품 전체 삭제
		@RequestMapping(value = "/my-page/my-cart", method = RequestMethod.DELETE)
		@ResponseBody
		public Object deleteCart(HttpSession session,@RequestBody HashMap<String, Object> jsonData, Model model) {
			String id = (String)session.getAttribute("USER_ID");
			System.out.println("갱신할 유저 : " +id + "삭제할 카트 ID :" + (int)jsonData.get("CART_ID"));
			
	
			HashMap<String, Object> returnMap2 = new HashMap<String, Object>();
			CartVO vo = new CartVO();
			vo.setUSER_ID(id);
			//1. 사용자가 선택한 상품의 삭제
			int result = cartService.cartDelete(jsonData);
			List<CartVO> list=cartService.getCartList(vo);
			returnMap2.put("list", list);
			
			if(result > 0) { 	//삭제되면 true
				return returnMap2;
			} else {
				return false;
			}
		}
		
	    //상품 선택삭제
	    @RequestMapping(value = "/my-page/my-cart/delete")
	    @ResponseBody
	    public Object deleteCartCk(@RequestParam(value="valueArr") List<String> valueArr) {
	    	List<String> resList = valueArr;

	    	   for(int i=0; i<resList.size(); i++) {
	    	        System.out.println("삭제할 CART_ID : "+resList.get(i).toString());
	    	        cartService.cartDelete(resList.get(i));
	    	    }
	    	   if(resList.size()>0) {
	    		   return true;
	    	   } else {
	    		   return false;
	    	   }
	    }
	    
	    //상품 장바구니에 추가
	    @RequestMapping(value = "/my-page/my-cart", method = RequestMethod.POST)
	    @ResponseBody
	    public Object addCart(@RequestBody HashMap<String, Object> cart) {
	    	
			HashMap<String, Object> countMap = new HashMap<String, Object>();
			
			countMap.put("COL", "COUNT");
			countMap.put("PRODUCT_ID", (int) cart.get("PRODUCT_ID"));
			int count = productService.checkCol(countMap);
			
			System.out.println("현재 상품의 남은 갯수 : "+count);
			System.out.println("찜할 갯수 :"+  cart.get("COUNT"));
			int NumCount = Integer.parseInt(cart.get("COUNT").toString());

			String user_id= (String) cart.get("USER_ID");
			if(count >= NumCount) {
				int result = cartService.cartAdd(cart);
					CartVO vo = new CartVO();
					vo.setUSER_ID(user_id);
					int sumMoney=cartService.sumMoney(user_id); 
					List<CartVO> list=cartService.getCartList(vo);
					cart.put("list", list);			//장바구니 목록
					cart.put("count", list.size()); 	//레코드 갯수
					cart.put("sumMoney", sumMoney); 	//전체 금액
					cart.put("result",result);
		    
				return cart;
			} else {
				return false;
			}
			
			
			
//			
//	    	String user_id= (String) cart.get("USER_ID");
//	    	int result = cartService.cartAdd(cart);
//	    	
//	    	if(result > 0) {
//				CartVO vo = new CartVO();
//				vo.setUSER_ID(user_id);
//				int sumMoney=cartService.sumMoney(user_id); 
//				List<CartVO> list=cartService.getCartList(vo);
//				cart.put("list", list);			//장바구니 목록
//				cart.put("count", list.size()); 	//레코드 갯수
//				cart.put("sumMoney", sumMoney); 	//전체 금액
//				cart.put("result",result);
//	    	} else {
//	    		cart.put("result",result);
//	    	}
//	    	
//	    	return cart;
	    }
	    
	    @RequestMapping(value = "/my-page/my-cart-list", method = RequestMethod.POST)
	    @ResponseBody
	    public Object cartList(HttpSession session) {
	    	
	    	HashMap<String, Object> cart = new HashMap<String, Object>();
	    	String user_id= (String)session.getAttribute("USER_ID");
	    	
	    	if(user_id != null) {
				CartVO vo = new CartVO();
				vo.setUSER_ID(user_id);
				int sumMoney=cartService.sumMoney(user_id); 
				List<CartVO> list=cartService.getCartList(vo);
				cart.put("list", list);			//장바구니 목록
				cart.put("count", list.size()); 	//레코드 갯수
				cart.put("sumMoney", sumMoney); 	//전체 금액
				cart.put("result",1);
	    	} else {
	    		cart.put("result",0);
	    	}
	    	
	    	return cart;
	    }
}


