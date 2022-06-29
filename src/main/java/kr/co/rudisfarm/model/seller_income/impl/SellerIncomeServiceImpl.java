package kr.co.rudisfarm.model.seller_income.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.rudisfarm.model.commons.pagenation.SellerIncomePagenation;
import kr.co.rudisfarm.model.commons.pagenation.UserPagenation;
import kr.co.rudisfarm.model.seller_income.SellerIncomeService;
import kr.co.rudisfarm.model.seller_income.SellerIncomeVO;
import kr.co.rudisfarm.model.user.UserVO;
import kr.co.rudisfarm.model.user.impl.UserDAO;

@Service("SellerIncomeService")
public class SellerIncomeServiceImpl implements SellerIncomeService {
	@Autowired
	SellerIncomeDAO sellerIncomeDAO;
	
	@Autowired
	UserDAO userDAO;
	
	@Override
	public SellerIncomePagenation selectAdminSellerIncomeList(HashMap<String, Object> pageInfo) {
		List<SellerIncomeVO> sellerIncomeList = sellerIncomeDAO.selectAdminSellerIncomeList(pageInfo);
		int listCount = sellerIncomeDAO.selectAdminSellerIncomeListCount(pageInfo);
		
		SellerIncomePagenation sellerIncomePagenation = new SellerIncomePagenation(sellerIncomeList, 
														(int)pageInfo.get("page"), 
														listCount, 
														(String)pageInfo.get("keyword"), 
														(String)pageInfo.get("sort"), 
														(String)pageInfo.get("keywordType"));
		
		return sellerIncomePagenation;
	}

	@Override
	public SellerIncomePagenation selectSellerSellerIncomeList(HashMap<String, Object> pageInfo) {
		List<SellerIncomeVO> sellerIncomeList = sellerIncomeDAO.selectSellerSellerIncomeList(pageInfo);
		int listCount = sellerIncomeDAO.selectSellerSellerIncomeListCount(pageInfo);
		SellerIncomePagenation sellerIncomePagenation = new SellerIncomePagenation(sellerIncomeList, 
														(int)pageInfo.get("page"), 
														listCount, 
														(String)pageInfo.get("keyword"), 
														(String)pageInfo.get("sort"), 
														(String)pageInfo.get("keywordType"));
		
		return sellerIncomePagenation;
	}
	
	@Override
	public int selectSellerCurrentIncome(String USER_ID) {
		
		return userDAO.selectSellerCurrentIncome(USER_ID);
	}

	@Override
	public int insertSellerIncome(HashMap<String, Object> jsonData) {
		SellerIncomeVO sellerIncomeVO = new SellerIncomeVO();
		sellerIncomeVO.setUSER_ID((String)jsonData.get("USER_ID"));
		sellerIncomeVO.setREQUIRE_INCOME(Integer.parseInt((String)jsonData.get("REQUIRE_INCOME")));
		sellerIncomeVO.setACTUAL_INCOME((int)(Integer.parseInt((String)jsonData.get("REQUIRE_INCOME")) * 0.9));
		sellerIncomeVO.setFEES((int)(Integer.parseInt((String)jsonData.get("REQUIRE_INCOME")) * 0.1));
		sellerIncomeVO.setACCOUNT_NAME((String)jsonData.get("ACCOUNT_NAME"));
		sellerIncomeVO.setACCOUNT_BANK((String)jsonData.get("ACCOUNT_BANK"));
		sellerIncomeVO.setACCOUNT_NUMBER((String)jsonData.get("ACCOUNT_NUMBER"));
		
		UserVO userVO = new UserVO();
		userVO.setCURRENT_INCOME(-Integer.parseInt((String)jsonData.get("REQUIRE_INCOME")));
		userVO.setUSER_ID((String)jsonData.get("USER_ID"));
		
		if(userDAO.updateSellerCurrentIncome(userVO) == 1) {
			return sellerIncomeDAO.insertSellerIncome(sellerIncomeVO);
		} else {
			return 0;
		}
	}

	@Override
	public int updateSellerIncome(HashMap<String, Object> jsonData) {
		SellerIncomeVO sellerIncomeVO = new SellerIncomeVO();
		sellerIncomeVO.setSELLER_INCOME_ID((int)jsonData.get("SELLER_INCOME_ID"));
		sellerIncomeVO.setRESULT(Integer.parseInt((String)jsonData.get("RESULT")));
		
		if(sellerIncomeDAO.updateSellerIncome(sellerIncomeVO) == 1) {
			UserVO userVO = userDAO.getUserByID(sellerIncomeDAO.selectSellerIncome(sellerIncomeVO).getUSER_ID());
			userVO.setCURRENT_INCOME(sellerIncomeDAO.selectSellerIncome(sellerIncomeVO).getREQUIRE_INCOME());
			
			if(Integer.parseInt((String)jsonData.get("RESULT")) == 1) {
				return 1;
			} else if(Integer.parseInt((String)jsonData.get("RESULT")) == 2) {
				return userDAO.updateSellerCurrentIncome(userVO);
			}
		} else {
			return 0;
		}
		
		return 0;
	}

	@Override
	public int deleteSellerIncome(HashMap<String, Object> jsonData) {
		SellerIncomeVO sellerIncomeVO = new SellerIncomeVO();
		sellerIncomeVO.setSELLER_INCOME_ID(Integer.parseInt((String)jsonData.get("SELLER_INCOME_ID")));
		sellerIncomeVO.setRESULT((int)jsonData.get("RESULT"));
		
		return 0;
	}

	
}
