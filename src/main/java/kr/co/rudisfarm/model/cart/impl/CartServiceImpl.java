package kr.co.rudisfarm.model.cart.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.rudisfarm.model.cart.AjaxVO;
import kr.co.rudisfarm.model.cart.CartService;
import kr.co.rudisfarm.model.cart.CartVO;

@Service("CartService")
public class CartServiceImpl implements CartService{
	
	@Autowired
	CartDAO cartDAO;

	@Override
	public List<CartVO> getCartList(CartVO vo) {
		return cartDAO.getCartList(vo);
	}
	@Override
	public int sumMoney(String USER_ID) {
		return cartDAO.sumMoney(USER_ID);
	}
	@Override
	public int cartUpdate(HashMap<String, Object> jsonData) {
		AjaxVO vo = new AjaxVO();
		vo.setCART_ID((int)jsonData.get("CART_ID"));
		vo.setCOUNT((int)jsonData.get("COUNT"));
		
		System.out.println("카트 ID :" + vo.getCART_ID());
		System.out.println("변경 수량 : " + vo.getCOUNT());
		return cartDAO.cartUpdate(vo);
	}
	
	@Override
	public int cartDelete(HashMap<String, Object> jsonData) {
		AjaxVO vo = new AjaxVO();
		vo.setCART_ID((int)jsonData.get("CART_ID"));
		
		return cartDAO.cartDelete(vo);
	}
	
	@Override
	public CartVO getCart(CartVO vo) {
		return cartDAO.getCart(vo);
	}
	@Override
	public int cartDelete(String no) {
		AjaxVO vo = new AjaxVO();
		vo.setCART_ID(Integer.parseInt(no));
		return cartDAO.cartDelete(vo);
	}
	
	@Override
	public List<AjaxVO> cartChoice(AjaxVO no) {

		return cartDAO.cartChoice(no);
	}
	
	@Override
	public int cartAdd(HashMap<String, Object> product) {
		return cartDAO.cartAdd(product);
	}
}
