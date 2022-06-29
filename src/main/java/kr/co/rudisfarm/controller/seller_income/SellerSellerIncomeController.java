package kr.co.rudisfarm.controller.seller_income;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.rudisfarm.model.seller_income.SellerIncomeService;
import kr.co.rudisfarm.model.commons.pagenation.SellerIncomePagenation;

@Controller
public class SellerSellerIncomeController {
	@Autowired
	SellerIncomeService sellerIncomeService;
	
	@RequestMapping(value = "/seller/seller-sellerincome-manage", method = RequestMethod.GET)
	public String getSellerSellerIncomeList(@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "keywordType", required = false, defaultValue = "") String keywordType,
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
			@RequestParam(value = "sort", required = false, defaultValue = "REQUIRE_DATE") String sort,
			HttpSession session,
			Model model) {
		HashMap<String, Object> pageInfo = new HashMap<String, Object>();
		pageInfo.put("page", page);
		pageInfo.put("keywordType", keywordType);
		pageInfo.put("keyword", keyword);
		pageInfo.put("sort", sort);
		pageInfo.put("currentPage", (page - 1) * 10);
		pageInfo.put("limit", 10);
		pageInfo.put("USER_ID", (String)session.getAttribute("USER_ID"));
		
		SellerIncomePagenation sllerIncomePagenation = sellerIncomeService.selectSellerSellerIncomeList(pageInfo);
		int selectSellerCurrentIncome = sellerIncomeService.selectSellerCurrentIncome((String)session.getAttribute("USER_ID"));
		model.addAttribute("selectSellerCurrentIncome", selectSellerCurrentIncome);
		model.addAttribute("sllerIncomePagenation", sllerIncomePagenation);
		model.addAttribute("keywordType", keywordType);
		model.addAttribute("keyword", keyword);
		model.addAttribute("sort", sort);
		model.addAttribute("keywordTypeUrl", "&keywordType="+keywordType);
		model.addAttribute("keywordUrl", "&keyword="+keyword);
		model.addAttribute("sortUrl", "&sort="+sort);
		
		return "/seller/seller_income/seller-sellerincome-manage";
	}
	
	@RequestMapping(value = "/seller/seller-sellerincome-manage", method = RequestMethod.POST)
	@ResponseBody
	public Object insertNewSellerIncomeRequest(@RequestBody HashMap<String, Object> jsonData, HttpSession session) {
		jsonData.put("USER_ID", (String)session.getAttribute("USER_ID"));
		int resultCode = 0;
		int currentIncome = sellerIncomeService.selectSellerCurrentIncome((String)session.getAttribute("USER_ID"));
		
		if(currentIncome < Integer.parseInt((String)jsonData.get("REQUIRE_INCOME"))) {
			resultCode = -1;
		} else {
			resultCode = sellerIncomeService.insertSellerIncome(jsonData);
		}
		
		HashMap <String, Object> map = new HashMap<String, Object>();
		map.put("resultCode", resultCode);
		
		return map;
	}
}
