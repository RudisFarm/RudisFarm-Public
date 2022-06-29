package kr.co.rudisfarm.model.cart;

import java.util.HashMap;
import java.util.List;

public interface CartService {
	public List<CartVO> getCartList(CartVO vo);
	public int cartUpdate(HashMap<String, Object> jsonData);
	public int sumMoney(String USER_ID);
	public int cartDelete(HashMap<String, Object> jsonData);
	public int cartDelete(String no);
	public List<AjaxVO> cartChoice(AjaxVO ajax);
	public int cartAdd(HashMap<String, Object> product);
	public CartVO getCart(CartVO vo);
}
