package kr.co.rudisfarm.model.orders.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.rudisfarm.model.orders.OrdersVO;
import kr.co.rudisfarm.model.user.UserVO;


@Repository("OrdersDAO")
public class OrdersDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int getBuyerOrdersListCount (Map<String, Object> map) {
		return mybatis.selectOne("OrdersDAO.getBuyerOrdersListCount", map);
	}
	
	public List<OrdersVO> getAdminOrdersList(OrdersVO vo) {
		System.out.println("실행");
		return mybatis.selectList("OrdersDAO.getAdminOrdersList", vo);
	}
	public List<Object> getBuyerOrdersList(Map<String, Object> map) {
		System.out.println("실행");
		return mybatis.selectList("OrdersDAO.getBuyerOrdersList", map);
	}
	
	public List<OrdersVO> getSellerOrdersList(OrdersVO vo) {
		System.out.println("실행");
		return mybatis.selectList("OrdersDAO.getSellerOrdersList", vo);
	}
	
	
	
	public OrdersVO getOrders(OrdersVO vo) {
		System.out.println("실행");
		return mybatis.selectOne("OrdersDAO.getOrders", vo);
	}
	
	public OrdersVO getOrdersbyOrdersName(OrdersVO vo) {
		System.out.println("실행");
		return mybatis.selectOne("OrdersDAO.getOrdersbyOrdersName", vo);
	}
	
	
	public int insertOrders(OrdersVO vo) {
//		System.out.println(vo.toString());
		return mybatis.update("OrdersDAO.insertOrders", vo);
	};
	

	
	
	public List<OrdersVO> sellerExchangeList(OrdersVO vo) {
		System.out.println("DAO sellerExchangeList mybatis시작 전");
		List<OrdersVO> list = mybatis.selectList("OrdersDAO.getsellerReqexchangeManageList", vo);
		System.out.println("DAO sellerExchangeList mybatis시작 후");
		return list;
	}

	
	
	public int getOrdersReqExchangeListCount(Map<String, Object> map) {

		return mybatis.selectOne("OrdersDAO.SellerExchangeListCount", map);
	}
	
	
	
	public OrdersVO sellerExchangeDetail(OrdersVO vo) {
		System.out.println("DAO sellerExchangeDetail mybatis시작 전");
		return mybatis.selectOne("OrdersDAO.sellerExchangeDetail", vo);
	}
	
	
	
	public int sellerExchangeComplete(OrdersVO ordersVO) {
		System.out.println("DAO sellerExchangeComplete mybatis시작 전 getORDERS_NAME : " + ordersVO.getORDERS_NAME());
		return mybatis.update("OrdersDAO.sellerExchangeComplete", ordersVO);
	}

	public List<Object> getOrdersList(Map<String, Object> map) {
		List<Object> list = mybatis.selectList("OrdersDAO.getOrdersList", map);
		return list;
	}
	
	public int getOrdersListCount(Map<String, Object> map) {
		return mybatis.selectOne("OrdersDAO.getOrdersListCount", map);
	}
	
	public int updateOrders(OrdersVO vo) {
		
		return mybatis.update("OrdersDAO.updateOrders", vo);
	}
	
	public int deleteOrders(int ORDERS_ID) {
		System.out.println("상품 주문취소로 업데이트");
		return mybatis.update("OrdersDAO.deleteOrders", ORDERS_ID);
	}
	
	public OrdersVO getOrdersDetail (OrdersVO ordersVO) {
		return mybatis.selectOne("OrdersDAO.getOrdersDetail", ordersVO);
	}
	
	public UserVO getSellerInfo(OrdersVO vo) {
		System.out.println("seller실행");
		return mybatis.selectOne("OrdersDAO.getSellerInfo", vo);
	}
	
	
	
	public int exchangeOrders(OrdersVO vo) {
		System.out.println("교환 신청으로 업데이트");
		return mybatis.update("OrdersDAO.exchangeOrders", vo);
	}
	
	public int cancelOrders(OrdersVO vo) {
		System.out.println("반품 신청으로 업데이트");
		return mybatis.update("OrdersDAO.cancelOrders", vo);
	}
	
	public OrdersVO exchangeCancel(OrdersVO vo) {
		System.out.println("교환, 반품신청 실행");
		return mybatis.selectOne("OrdersDAO.exchangeCancel", vo);
	}
	
//	//주문 정보
//	public void ordersInfo(OrdersVO orders) throws Exception {
//		
//	}

	public int sellerExchangeFalse(OrdersVO ordersVO) {
		System.out.println("DAO sellerExchangeFalse mybatis시작 전 getORDERS_NAME : " + ordersVO.getORDERS_NAME());
		
		return mybatis.update("OrdersDAO.sellerExchangeFalse", ordersVO);
		
	}
	
	
	
	public List<OrdersVO> sellerReTurnManageList(OrdersVO vo) {
		System.out.println("DAO sellerReTurnManageList mybatis시작 전");
		List<OrdersVO> list = mybatis.selectList("OrdersDAO.getsellerReTurnManageList", vo);
		System.out.println("DAO sellerReTurnManageList mybatis시작 후");
		return list;
	}

	
	
	public OrdersVO sellerReturnDetail(OrdersVO vo) {
		System.out.println("DAO sellerReturnDetail mybatis시작 전");
		return mybatis.selectOne("OrdersDAO.sellerReturnDetail", vo);
	}

	
	
	public int sellerReturnComplete(OrdersVO odersVO) {
		System.out.println("DAO sellerReturnComplete mybatis시작 전 getORDERS_NAME : " + odersVO.getORDERS_NAME());
		return mybatis.update("OrdersDAO.sellerReturnComplete", odersVO);
	}

	
	
	
	public int sellerReturnFalse(OrdersVO odersVO) {
		System.out.println("DAO sellerReturnFalse mybatis시작 전 getORDERS_NAME : " + odersVO.getORDERS_NAME());
		return mybatis.update("OrdersDAO.sellerReturnFalse", odersVO);
	}

	
	
	
	public List<OrdersVO> sellerOrdersExchangeList(Map<String, Object> map) {
		List<OrdersVO> list = mybatis.selectList("OrdersDAO.sellerOrdersExchangeList", map); return list;}
	public int sellerOrdersExchangeListCount(Map<String, Object> map) {
		return mybatis.selectOne("OrdersDAO.sellerOrdersExchangeListCount", map);}	

	
	
	
	
	public List<OrdersVO> sellerOrdersReturnList(Map<String, Object> map) {
		List<OrdersVO> list = mybatis.selectList("OrdersDAO.sellerOrdersReturnList", map); return list;}
	public int sellerOrdersReturnListCount(Map<String, Object> map) {
		return mybatis.selectOne("OrdersDAO.sellerOrdersReturnListCount", map);}


	// payment admin seller view
	public List<OrdersVO> getsuperAdminSellerPaymentList(Map<String, Object> map) {
		List<OrdersVO> list = mybatis.selectList("OrdersDAO.getsuperAdminSellerPaymentList", map);
		return list;
	}
	public int getsuperAdminSellerPaymentListCount(Map<String, Object> map) {
		return mybatis.selectOne("OrdersDAO.getsuperAdminSellerPaymentListCount", map);
	}

	public List<OrdersVO> sellerOrderList(Map<String, Object> map) {
		List<OrdersVO> list = mybatis.selectList("OrdersDAO.sellerOrderList", map); return list;}
	public int sellerOrderListCount(Map<String, Object> map) {
		return mybatis.selectOne("OrdersDAO.sellerOrderListCount", map);}

	public OrdersVO orderslistdetail(OrdersVO vo) {
		System.out.println("DAO orderslistdetail mybatis시작 전");
		return mybatis.selectOne("OrdersDAO.orderslistdetail", vo);}
	public OrdersVO orderslistdetailproductname(OrdersVO vo) {
		System.out.println("DAO orderslistdetailproductname mybatis시작 전");
		return mybatis.selectOne("OrdersDAO.orderslistdetailproductname", vo);}
	public OrdersVO ordersemailsearch(OrdersVO vo) {
		System.out.println("DAO ordersemailsearch mybatis시작 전");
		return mybatis.selectOne("OrdersDAO.ordersemailsearch", vo);}
	public OrdersVO ordersphonesearch(OrdersVO vo) {
		System.out.println("DAO ordersphonesearch mybatis시작 전");
		return mybatis.selectOne("OrdersDAO.ordersphonesearch", vo);}
	public OrdersVO selectproductnamesearch(OrdersVO ordersVO) {
		System.out.println("DAO selectproductnamesearch mybatis시작 전");
		return mybatis.selectOne("OrdersDAO.selectproductnamesearch", ordersVO);}
	
	public int sellerOrderslistComplete(OrdersVO ordersVO) {
		System.out.println("DAO sellerOrderslistComplete mybatis시작 전 getORDERS_NAME : " + ordersVO.getORDERS_NAME());
		return mybatis.update("OrdersDAO.sellerOrderslistComplete", ordersVO);
	}
	public int getTrackingNumberUpdate(OrdersVO ordersVO) {
		System.out.println("DAO getTrackingNumberUpdate mybatis시작 전 getORDERS_NAME : " + ordersVO.getORDERS_NAME());
		return mybatis.update("OrdersDAO.getTrackingNumberUpdate", ordersVO);
	}
	
	
	
	

	
	public List<OrdersVO> sellerdeliverylist(Map<String, Object> map) {
		List<OrdersVO> list = mybatis.selectList("OrdersDAO.sellerdeliverylist", map); return list;}
	public int sellerdeliverylistCount(Map<String, Object> map) {
		return mybatis.selectOne("OrdersDAO.sellerdeliverylistCount", map);}

	
	
	
	public OrdersVO deliverylistdetail(OrdersVO vo) {
		System.out.println("DAO deliverylistdetail mybatis시작 전");
		return mybatis.selectOne("OrdersDAO.deliverylistdetail", vo);}
	public OrdersVO deliverylistdetailname(OrdersVO vo) {
		System.out.println("DAO deliverylistdetailname mybatis시작 전");
		return mybatis.selectOne("OrdersDAO.deliverylistdetailname", vo);}

	
	
	
	public int exchangecompleteListCount(Map<String, Object> map) {
		return mybatis.selectOne("OrdersDAO.exchangecompleteListCount", map);}
	public List<OrdersVO> exchangecompleteList(Map<String, Object> map) {
		List<OrdersVO> list = mybatis.selectList("OrdersDAO.exchangecompleteList", map); return list;}


	

	public OrdersVO exchcompldetail(OrdersVO vo) {
		System.out.println("DAO exchcompldetail mybatis시작 전");
		return mybatis.selectOne("OrdersDAO.exchcompldetail", vo);}
	public OrdersVO exchcompldetailname(OrdersVO vo) {
		System.out.println("DAO exchcompldetailname mybatis시작 전");
		return mybatis.selectOne("OrdersDAO.exchcompldetailname", vo);}

	

	public List<OrdersVO> exchangeimpossibleList(Map<String, Object> map) {
		List<OrdersVO> list = mybatis.selectList("OrdersDAO.exchangeimpossibleList", map); return list;}
	public int exchangeimpossibleListCount(Map<String, Object> map) {
		return mybatis.selectOne("OrdersDAO.exchangeimpossibleListCount", map);}


	
	public OrdersVO exchImpossibledetail(OrdersVO vo) {
		System.out.println("DAO exchImpossibledetail mybatis시작 전");
		return mybatis.selectOne("OrdersDAO.exchImpossibledetail", vo);}
	public OrdersVO exchImpossibledetailname(OrdersVO vo) {
		System.out.println("DAO exchImpossibledetailname mybatis시작 전");
		return mybatis.selectOne("OrdersDAO.exchImpossibledetailname", vo);}

	

	public List<OrdersVO> returncompleteList(Map<String, Object> map) {
		List<OrdersVO> list = mybatis.selectList("OrdersDAO.returncompleteList", map); return list;}
	public int returncompleteListCount(Map<String, Object> map) {
		return mybatis.selectOne("OrdersDAO.returncompleteListCount", map);}



	public OrdersVO returncompletedetail(OrdersVO vo) {
		System.out.println("DAO returncompletedetail mybatis시작 전");
		return mybatis.selectOne("OrdersDAO.returncompletedetail", vo);}
	public OrdersVO returncompletedetailname(OrdersVO vo) {
		System.out.println("DAO returncompletedetailname mybatis시작 전");
		return mybatis.selectOne("OrdersDAO.returncompletedetailname", vo);}



	public List<OrdersVO> returnimpossibleList(Map<String, Object> map) {
		List<OrdersVO> list = mybatis.selectList("OrdersDAO.returnimpossibleList", map); return list;}
	public int returnimpossibleListCount(Map<String, Object> map) {
		return mybatis.selectOne("OrdersDAO.returnimpossibleListCount", map);}



	public OrdersVO returnimpossibledetail(OrdersVO vo) {
		System.out.println("DAO returnimpossibledetail mybatis시작 전");
		return mybatis.selectOne("OrdersDAO.returnimpossibledetail", vo);}
	public OrdersVO returnimpossibledetailname(OrdersVO vo) {
		System.out.println("DAO returnimpossibledetailname mybatis시작 전");
		return mybatis.selectOne("OrdersDAO.returnimpossibledetailname", vo);}
	
	public List<OrdersVO> getSellerindexOrder(OrdersVO vo) {
		return mybatis.selectList("OrdersDAO.getSellerindexOrder", vo);
	}
	public List<OrdersVO> getSellerindexExchange(OrdersVO vo) {
		return mybatis.selectList("OrdersDAO.getSellerindexExchange", vo);
	}
	public List<OrdersVO> getSellerindexRetern(OrdersVO vo) {
		return mybatis.selectList("OrdersDAO.getSellerindexRetern", vo);
	}
	
	public int isReviewed(int ORDERS_ID) {
		return mybatis.update("OrdersDAO.isReviewed", ORDERS_ID);
	}
}



	








	
	
	
	
	
	
	
	
	
