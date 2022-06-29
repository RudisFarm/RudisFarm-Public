package kr.co.rudisfarm.controller.seller_income;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.rudisfarm.model.commons.pagenation.SellerIncomePagenation;
import kr.co.rudisfarm.model.seller_income.SellerIncomeService;

@Controller
public class AdminSellerIncomeController {
	@Autowired
	SellerIncomeService sellerIncomeService;
	
	@RequestMapping(value = "/admin/admin-sellerincome-manage", method = RequestMethod.GET)
	public String getSellerSellerIncomeList(@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "keywordType", required = false, defaultValue = "") String keywordType,
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
			@RequestParam(value = "sort", required = false, defaultValue = "REQUIRE_DATE") String sort,
			Model model) {
		HashMap<String, Object> pageInfo = new HashMap<String, Object>();
		pageInfo.put("page", page);
		pageInfo.put("keywordType", keywordType);
		pageInfo.put("keyword", keyword);
		pageInfo.put("sort", sort);
		pageInfo.put("currentPage", (page - 1) * 10);
		pageInfo.put("limit", 10);
		
		SellerIncomePagenation sllerIncomePagenation = sellerIncomeService.selectAdminSellerIncomeList(pageInfo);
		model.addAttribute("sllerIncomePagenation", sllerIncomePagenation);
		model.addAttribute("keywordType", keywordType);
		model.addAttribute("keyword", keyword);
		model.addAttribute("sort", sort);
		model.addAttribute("keywordTypeUrl", "&keywordType="+keywordType);
		model.addAttribute("keywordUrl", "&keyword="+keyword);
		model.addAttribute("sortUrl", "&sort="+sort);
		
		return "/admin/seller_income/admin-sellerincome-manage";
	}
	
	@RequestMapping(value = "/admin/admin-sellerincome-manage/{SELLER_INCOME_ID}", method = RequestMethod.PUT)
	@ResponseBody
	public Object updateSellerIncomeStatus(@RequestBody HashMap<String, Object> jsonData, @PathVariable int SELLER_INCOME_ID) {
		int resultCode = 0;
		
		jsonData.put("SELLER_INCOME_ID", SELLER_INCOME_ID);
		resultCode = sellerIncomeService.updateSellerIncome(jsonData);
		
		HashMap <String, Object> map = new HashMap<String, Object>();
		map.put("resultCode", resultCode);
		
		return map;
	}
}
