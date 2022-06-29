package kr.co.rudisfarm.model.cart.impl;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.rudisfarm.model.cart.AjaxVO;
import kr.co.rudisfarm.model.cart.CartVO;


@Repository("CartDAO")
public class CartDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<CartVO> getCartList(CartVO vo) {
		return mybatis.selectList("CartDAO.getCartList", vo);
	}
	
	public  int sumMoney(String USER_ID) {
		return mybatis.selectOne("CartDAO.sumMoney", USER_ID);
	}

	public int cartUpdate(AjaxVO ajax) {
		System.out.println("장바구니 상품 수량변경");
		return mybatis.update("CartDAO.cartUpdate", ajax);
	}

	public int cartDelete(AjaxVO ajax) {
		System.out.println("장바구니 삭제");
		return mybatis.delete("CartDAO.cartDelete", ajax);
	}

	public List<AjaxVO> cartChoice(AjaxVO ajax) {
		System.out.println("결제할 리스트 정보");
		return mybatis.selectList("CartDAO.cartChoice", ajax);
	}
	
	public int cartAdd(HashMap<String, Object> product) {
		return mybatis.insert("CartDAO.addCart",product);
	}
	public CartVO getCart(CartVO vo) {
		return mybatis.selectOne("CartDAO.getCart",vo);
	}
}