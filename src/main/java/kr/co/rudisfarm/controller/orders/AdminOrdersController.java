package kr.co.rudisfarm.controller.orders;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.rudisfarm.model.commons.pagenation.OrdersPagenation;
import kr.co.rudisfarm.model.orders.OrdersService;
import kr.co.rudisfarm.model.orders.OrdersVO;
/*import kr.co.rudisfarm.model.orders_detail.Orders_DetailService;
import kr.co.rudisfarm.model.orders_detail.Orders_DetailVO;*/

@Controller
public class AdminOrdersController {

	@Autowired
	OrdersService ordersService;

	/*
	 * @Autowired Orders_DetailService orders_detailService;
	 */
	// 관리자 주문 관리 페이지 이동
	@RequestMapping(value = "/admin/admin-orders-manage", method = RequestMethod.GET)
	public String getOrdersListForm(@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
			@RequestParam(value = "type1", required = false, defaultValue = "") String type1,
			@RequestParam(value = "type2", required = false, defaultValue = "") String type2,
			@RequestParam(value = "sort", required = false, defaultValue = "ORDERSDATE") String sort,
			@RequestParam(value = "status", required = false, defaultValue = "1") int status,
			@RequestParam(value = "keywordType", required = false, defaultValue = "ORDERS_NAME") String keywordType,
			@ModelAttribute("USER_ID") String USER_ID, Model model) {

		Map<String, Object> map = new HashMap<String, Object>();

		System.out.println(keywordType);

		int limit = 10;
		map.put("user", "관리자");
		map.put("user_id", USER_ID);
		map.put("keyword", keyword);
		map.put("page", page);
		map.put("currentPage", (page - 1) * limit);
		map.put("type1", type1);
		map.put("type2", type2);
		map.put("sort", sort);
		map.put("status", status);
		map.put("limit", limit);
		map.put("keywordType", keywordType);

		List<Object> ordersList = ordersService.getAdminOrdersList(map);
		int listCount = ordersService.getOrdersAdminListCount(map);

		OrdersPagenation pagenation = new OrdersPagenation(ordersList, (int) map.get("page"), listCount,
				(int) map.get("limit"), (String) map.get("keyword"), null, null, sort);

		System.out.println(pagenation.getSort());

		model.addAttribute("ordersPagenation", pagenation);
		model.addAttribute("status", status);

		return "/admin/orders/admin-orders-manage";
	}

	// 카테고리 리스트 불러오기
	@RequestMapping(value = "/orders-sort", method = RequestMethod.POST)
	@ResponseBody
	public Object getOrdersSort() {
		Map<String, Object> map = new LinkedHashMap<String, Object>();

		map.put("최신 순", "ORDERSDATE");
		/* map.put("조회 순","COUNT"); */
		map.put("가격 높은 순", "PRICEUP");
		map.put("가격 낮은 순", "PRICEDOWN");

		return map;
	}

	// 등록된 주문 삭제 기능 *ajax
	@ResponseBody
	@RequestMapping(value = "/admin/admin-orders-manage/{ORDERS_ID}", method = RequestMethod.DELETE)
	public Object deleteOrders(@PathVariable int ORDERS_ID) {

		boolean whether = false;

		OrdersVO ordersVO = new OrdersVO();
		ordersVO.setORDERS_ID(ORDERS_ID);
		int result = ordersService.deleteOrders(ORDERS_ID);

		if (result > 0) {
			whether = true;
		}

		return whether;
	}

	// 관리자 주문상세내역
	@RequestMapping(value = "/admin/admin-orders-manage/{ORDERS_ID}", method = RequestMethod.GET)
	public String getOrdersDetail(@PathVariable int ORDERS_ID, Model model, HttpServletRequest request,
			OrdersVO getOrdersDetail) throws Exception {
		HttpSession session = request.getSession();
		session.getAttribute("USER_ID");

		model.addAttribute("getorders", ordersService.getOrdersDetail(getOrdersDetail));

		return "/admin/orders/admin-orders-manage-detail";
	}
}
