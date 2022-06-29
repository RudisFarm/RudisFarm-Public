package kr.co.rudisfarm.model.seller_income;

import java.util.HashMap;

import kr.co.rudisfarm.model.commons.pagenation.SellerIncomePagenation;

public interface SellerIncomeService {
	public SellerIncomePagenation selectAdminSellerIncomeList(HashMap<String, Object> pageInfo);
	public SellerIncomePagenation selectSellerSellerIncomeList(HashMap<String, Object> pageInfo);
	public int selectSellerCurrentIncome(String USER_ID);
	public int insertSellerIncome(HashMap<String, Object> jsonData);
	public int updateSellerIncome(HashMap<String, Object> jsonData);
	public int deleteSellerIncome(HashMap<String, Object> jsonData);
}
