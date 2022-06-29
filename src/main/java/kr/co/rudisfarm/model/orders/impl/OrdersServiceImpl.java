package kr.co.rudisfarm.model.orders.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.rudisfarm.model.orders.OrdersService;
import kr.co.rudisfarm.model.orders.OrdersVO;
import kr.co.rudisfarm.model.product.ProductVO;
import kr.co.rudisfarm.model.product.impl.ProductDAO;
import kr.co.rudisfarm.model.user.UserVO;
import kr.co.rudisfarm.model.user.impl.UserDAO;

@Service("OrdersService")
public class OrdersServiceImpl implements OrdersService {

	@Autowired
	OrdersDAO ordersDAO;
	
	@Autowired
	UserDAO userDAO;
	
	@Autowired
	ProductDAO productDAO;

	// 관리자 주문 리스트 내역
	@Override
	public int getBuyerOrdersListCount (Map<String, Object> map) {
		return ordersDAO.getBuyerOrdersListCount(map);
	}
	
	// 유저 주문 리스트 내역
	@Override
	public List<Object> getBuyerOrdersList(Map<String, Object> map) {
		return ordersDAO.getBuyerOrdersList(map);
	}

	// 중간관리자 주문 리스트 내역
	@Override
	public List<OrdersVO> getSellerOrdersList(OrdersVO vo) {
		return ordersDAO.getSellerOrdersList(vo);
	}
     
	//주문 상세내역
	@Override
	public OrdersVO getOrders(OrdersVO vo) {
		return ordersDAO.getOrders(vo);
	}
	
	@Override
	public OrdersVO getOrdersbyOrdersName(OrdersVO vo) {
		return ordersDAO.getOrdersbyOrdersName(vo);
	}
	

//	@Override
//	public List<OrdersVO> sellerExchangeList(Map<String, Object> map) {
//		// TODO Auto-generated method stub
//		return ordersDAO.getSellerReqExchangeList(map);
//	}

	@Override
	public int getOrdersExchangeListCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return ordersDAO.getOrdersReqExchangeListCount(map);
	}
	
	@Override
	public List<OrdersVO> sellerExchangeList(OrdersVO ordersVO) {
		// TODO Auto-generated method stub
		System.out.println("Serviceimpl sellerExchangeList까지");
		return ordersDAO.sellerExchangeList(ordersVO);
	}	

	@Override
	public int insertOrders(OrdersVO vo) {
//		System.out.println("인서트오더 : " +vo.toString());
		return ordersDAO.insertOrders(vo);
	}
	
	@Override
	public OrdersVO getOrdersExchangeListDetail(OrdersVO ordersVO) {
		System.out.println("Serviceimpl getOrdersExchangeListDetail까지");
		return ordersDAO.sellerExchangeDetail(ordersVO);
	}
	@Override
	public int getOrdersExchangeComplete(OrdersVO ordersVO) {
		System.out.println("Serviceimpl getOrdersExchangeComplete까지 getORDERS_NAME : " + ordersVO.getORDERS_NAME());
		
		return ordersDAO.sellerExchangeComplete(ordersVO);
	}
	@Override
	public int getOrdersExchangeFalse(OrdersVO ordersVO) {
		System.out.println("Serviceimpl getOrdersExchangeFalse까지 getORDERS_NAME : " + ordersVO.getORDERS_NAME());
		
		return ordersDAO.sellerExchangeFalse(ordersVO);
	}

	@Override
	public List<OrdersVO> getsellerReTurnManageList(OrdersVO ordersVO) {
		System.out.println("Serviceimpl getsellerReTurnManageList까지");
		return  ordersDAO.sellerReTurnManageList(ordersVO);
	}

	@Override
	public OrdersVO getOrdersRetrunListDetail(OrdersVO vo) {
		System.out.println("Serviceimpl getOrdersRetrunListDetail까지");
		return ordersDAO.sellerReturnDetail(vo);
	}

	
	@Override
	public List<Object> getAdminOrdersList(Map<String, Object> map) {
		return ordersDAO.getOrdersList(map);
	}

	@Override
	public int getOrdersAdminListCount(Map<String, Object> map) {
		return ordersDAO.getOrdersListCount(map);
	}
	
	@Override
	public int updateOrders(int ORDERS_ID, String STATUS) {
		OrdersVO ordersVO = new OrdersVO();
		ordersVO.setORDERS_ID(ORDERS_ID);
		ordersVO.setSTATUS(STATUS);
		System.out.println(ordersVO.toString());
		
		OrdersVO getOrdersVO = ordersDAO.getOrders(ordersVO);
		ProductVO productVO = new ProductVO();
		productVO.setPRODUCT_ID(getOrdersVO.getPRODUCT_ID());
		
		UserVO userVO = new UserVO();
		userVO.setCURRENT_INCOME(getOrdersVO.getTOTAL_PRICE());
		userVO.setUSER_ID(productDAO.getProduct(productVO).getUSER_ID());
		
		if(userDAO.updateSellerCurrentIncome(userVO) == 1) {
			return ordersDAO.updateOrders(ordersVO);
		} else {
			return 0;
		}
	}

	@Override
	public int deleteOrders(int ORDERS_ID) {
		// TODO Auto-generated method stub
		return ordersDAO.deleteOrders(ORDERS_ID);
	}

	@Override
	public OrdersVO getOrdersDetail(OrdersVO ordersVO) {
		return ordersDAO.getOrdersDetail(ordersVO);
	}
	
	@Override
	public UserVO getSellerInfo(OrdersVO ordersVO) {
		return ordersDAO.getSellerInfo(ordersVO);
	}
	
	@Override
	public int exchangeOrders(OrdersVO vo) {
		// TODO Auto-generated method stub
		return ordersDAO.exchangeOrders(vo);
	}
	
	// 주문정보
	@Override
	public int getOrdersReturnComplete(OrdersVO odersVO) {
		System.out.println("Serviceimpl getOrdersReturnComplete까지 getORDERS_NAME : " + odersVO.getORDERS_NAME());
		return ordersDAO.sellerReturnComplete(odersVO);
	}
	
	@Override
	public int cancelOrders(OrdersVO vo) {
		// TODO Auto-generated method stub
		return ordersDAO.cancelOrders(vo);
	}
	
	@Override
	public OrdersVO exchangeCancel(OrdersVO ordersVO) {
		// TODO Auto-generated method stub
		return ordersDAO.exchangeCancel(ordersVO);
	}
	
	
//	// 주문정보
//	@Override
//	public void ordersInfo(OrdersVO orders) throws Exception {
//		ordersDAO.ordersInfo(orders);
//
//	}

	public int getOrdersReturnFalse(OrdersVO odersVO) {
		System.out.println("Serviceimpl getOrdersReturnFalse까지 getORDERS_NAME : " + odersVO.getORDERS_NAME());
		return ordersDAO.sellerReturnFalse(odersVO);
	}

	
	@Override
	public List<OrdersVO> sellerOrdersExchangeList(Map<String, Object> map) {return ordersDAO.sellerOrdersExchangeList(map);}
	@Override
	public int sellerOrdersExchangeListCount(Map<String, Object> map) {return ordersDAO.sellerOrdersExchangeListCount(map);}

	
	
	@Override
	public List<OrdersVO> sellerOrdersReturnList(Map<String, Object> map) {return ordersDAO.sellerOrdersReturnList(map);}
	@Override
	public int sellerOrdersReturnListCount(Map<String, Object> map){return ordersDAO.sellerOrdersReturnListCount(map);}

	
	
	@Override
	public List<OrdersVO> sellerOrderList(Map<String, Object> map) {return ordersDAO.sellerOrderList(map);}
	@Override
	public int sellerOrderListCount(Map<String, Object> map) {return ordersDAO.sellerOrderListCount(map);}

	
	
	
	@Override
	public OrdersVO orderslistdetail(OrdersVO vo) {
		System.out.println("Serviceimpl orderslistdetail까지");
		return ordersDAO.orderslistdetail(vo);}
	@Override
	public OrdersVO orderslistdetailproductname(OrdersVO vo) {
		System.out.println("Serviceimpl orderslistdetailproductname까지");
		return ordersDAO.orderslistdetailproductname(vo);}
	@Override
	public OrdersVO ordersemailsearch(OrdersVO vo) {
		System.out.println("Serviceimpl ordersemailsearch까지");
		return ordersDAO.ordersemailsearch(vo);}
	@Override
	public OrdersVO ordersphonesearch(OrdersVO vo) {
		System.out.println("Serviceimpl ordersphonesearch까지");
		return ordersDAO.ordersphonesearch(vo);}
	@Override
	public OrdersVO selectproductnamesearch(OrdersVO ordersVO) {
		System.out.println("Serviceimpl selectproductnamesearch까지");
		return ordersDAO.selectproductnamesearch(ordersVO);}
	
	
	
	@Override
	public int getOrderslistComplete(OrdersVO ordersVO) {
		System.out.println("Serviceimpl getOrderslistComplete까지 getORDERS_NAME : " + ordersVO.getORDERS_NAME());
		return ordersDAO.sellerOrderslistComplete(ordersVO);
	}
	@Override
	public int getTrackingNumberUpdate(OrdersVO ordersVO) {
		System.out.println("Serviceimpl getTrackingNumberUpdate까지 getORDERS_NAME : " + ordersVO.getTRACKING_NUMBER());
		return ordersDAO.getTrackingNumberUpdate(ordersVO);
	}
	
	
	
	

	
	@Override
	public List<OrdersVO> sellerdeliverylist(Map<String, Object> map) {return ordersDAO.sellerdeliverylist(map);}
	@Override
	public int sellerdeliverylistCount(Map<String, Object> map) {return ordersDAO.sellerdeliverylistCount(map);}

	
	
	
	@Override
	public OrdersVO deliverylistdetail(OrdersVO vo) {
		System.out.println("Serviceimpl deliverylistdetail까지");
		return ordersDAO.deliverylistdetail(vo);}
	@Override
	public OrdersVO deliverylistdetailname(OrdersVO vo) {
		System.out.println("Serviceimpl deliverylistdetailname까지");
		return ordersDAO.deliverylistdetailname(vo);}

	
	
	
	
	@Override
	public List<OrdersVO> exchangecompleteList(Map<String, Object> map) {return ordersDAO.exchangecompleteList(map);}
	@Override
	public int exchangecompleteListCount(Map<String, Object> map) {return ordersDAO.exchangecompleteListCount(map);}

	
	
	
	
	
	@Override
	public OrdersVO exchcompldetail(OrdersVO vo) {
		System.out.println("Serviceimpl exchcompldetail까지");
		return ordersDAO.exchcompldetail(vo);}
	@Override
	public OrdersVO exchcompldetailname(OrdersVO vo) {
		System.out.println("Serviceimpl exchcompldetailname까지");
		return ordersDAO.exchcompldetailname(vo);}

	
	
	
	
	
	@Override
	public List<OrdersVO> exchangeimpossibleList(Map<String, Object> map) {return ordersDAO.exchangeimpossibleList(map);}
	@Override
	public int exchangeimpossibleListCount(Map<String, Object> map) {return ordersDAO.exchangeimpossibleListCount(map);}

	
	
	
	
	
	@Override
	public OrdersVO exchImpossibledetail(OrdersVO vo) {
		System.out.println("Serviceimpl exchImpossibledetail까지");
		return ordersDAO.exchImpossibledetail(vo);}
	@Override
	public OrdersVO exchImpossibledetailname(OrdersVO vo) {
		System.out.println("Serviceimpl exchImpossibledetailname까지");
		return ordersDAO.exchImpossibledetailname(vo);}

	
	
	
	@Override
	public List<OrdersVO> returncompleteList(Map<String, Object> map) {return ordersDAO.returncompleteList(map);}
	@Override
	public int returncompleteListCount(Map<String, Object> map) {return ordersDAO.returncompleteListCount(map);}

	
	
	
	
	
	@Override
	public OrdersVO returncompletedetail(OrdersVO vo) {
		System.out.println("Serviceimpl returncompletedetail까지");
		return ordersDAO.returncompletedetail(vo);}
	@Override
	public OrdersVO returncompletedetailname(OrdersVO vo) {
		System.out.println("Serviceimpl returncompletedetailname까지");
		return ordersDAO.returncompletedetailname(vo);}

	
	
	
	
	@Override
	public List<OrdersVO> returnimpossibleList(Map<String, Object> map) {return ordersDAO.returnimpossibleList(map);}
	@Override
	public int returnimpossibleListCount(Map<String, Object> map) {return ordersDAO.returnimpossibleListCount(map);}


	
	


	@Override
	public OrdersVO returnimpossibledetail(OrdersVO vo) {
		System.out.println("Serviceimpl returnimpossibledetail까지");
		return ordersDAO.returnimpossibledetail(vo);}
	@Override
	public OrdersVO returnimpossibledetailname(OrdersVO vo) {
		System.out.println("Serviceimpl returnimpossibledetailname까지");
		return ordersDAO.returnimpossibledetailname(vo);}


	// Payment Admin seller view 
	@Override
	public List<OrdersVO> getsuperAdminSellerPaymentList(Map<String, Object> map) {
		return ordersDAO.getsuperAdminSellerPaymentList(map);
	}
	@Override
	public int getsuperAdminSellerPaymentListCount(Map<String, Object> map) {
		return ordersDAO.getsuperAdminSellerPaymentListCount(map);
	}

	@Override
	public List<OrdersVO> getSellerindexOrder(OrdersVO vo) {
		return ordersDAO.getSellerindexOrder(vo);
	}

	@Override
	public List<OrdersVO> getSellerindexExchange(OrdersVO vo) {
		return ordersDAO.getSellerindexExchange(vo);
	}

	@Override
	public List<OrdersVO> getSellerindexRetern(OrdersVO vo) {
		return ordersDAO.getSellerindexRetern(vo);
	}

	@Override
	public int isReviewed(int ORDERS_ID) {
		
		return ordersDAO.isReviewed(ORDERS_ID);
	}
}
