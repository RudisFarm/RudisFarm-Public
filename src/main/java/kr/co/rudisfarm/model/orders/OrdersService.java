package kr.co.rudisfarm.model.orders;

import java.util.List;
import java.util.Map;

import kr.co.rudisfarm.model.user.UserVO;

public interface OrdersService {

	public List<Object> getBuyerOrdersList(Map<String, Object> map);

	public int getBuyerOrdersListCount(Map<String, Object> map);

	public List<OrdersVO> getSellerOrdersList(OrdersVO vo);

	public OrdersVO getOrders(OrdersVO vo);
	
	public OrdersVO getOrdersbyOrdersName(OrdersVO vo);

	int insertOrders(OrdersVO vo);

	public List<Object> getAdminOrdersList(Map<String, Object> map);

	public int getOrdersAdminListCount(Map<String, Object> map);

	public int updateOrders(int ORDERS_ID, String STATUS);

	public int deleteOrders(int ORDERS_ID);

	public OrdersVO getOrdersDetail(OrdersVO ordersVO);

	public UserVO getSellerInfo(OrdersVO ordersVO);

	public List<OrdersVO> sellerExchangeList(OrdersVO ordersVO);

	public int getOrdersExchangeListCount(Map<String, Object> map);

	public OrdersVO getOrdersExchangeListDetail(OrdersVO vo);

	public int getOrdersExchangeComplete(OrdersVO ordersVO);

	public int getOrdersExchangeFalse(OrdersVO ordersVO);

	public int exchangeOrders(OrdersVO vo);

	public int cancelOrders(OrdersVO vo);

	public OrdersVO exchangeCancel(OrdersVO vo);

	public List<OrdersVO> getsellerReTurnManageList(OrdersVO ordersVO);

	public OrdersVO getOrdersRetrunListDetail(OrdersVO vo);

	public int getOrdersReturnComplete(OrdersVO odersVO);

	// 주문 정보
//	public void ordersInfo(OrdersVO orders) throws Exception;

	public int getOrdersReturnFalse(OrdersVO odersVO);

	public List<OrdersVO> sellerOrdersExchangeList(Map<String, Object> map);

	public int sellerOrdersExchangeListCount(Map<String, Object> map);

	public List<OrdersVO> sellerOrdersReturnList(Map<String, Object> map);

	public int sellerOrdersReturnListCount(Map<String, Object> map);

	public List<OrdersVO> getsuperAdminSellerPaymentList(Map<String, Object> map);

	public int getsuperAdminSellerPaymentListCount(Map<String, Object> map);

	public List<OrdersVO> sellerOrderList(Map<String, Object> map);

	public int sellerOrderListCount(Map<String, Object> map);

	public OrdersVO orderslistdetail(OrdersVO vo);

	public OrdersVO orderslistdetailproductname(OrdersVO vo);
	public OrdersVO ordersemailsearch(OrdersVO vo);
	public OrdersVO ordersphonesearch(OrdersVO vo);
	public OrdersVO selectproductnamesearch(OrdersVO ordersVO);

	public int getOrderslistComplete(OrdersVO ordersVO);

	public int getTrackingNumberUpdate(OrdersVO ordersVO);

	public List<OrdersVO> sellerdeliverylist(Map<String, Object> map);

	public int sellerdeliverylistCount(Map<String, Object> map);

	public OrdersVO deliverylistdetail(OrdersVO vo);

	public OrdersVO deliverylistdetailname(OrdersVO vo);

	public List<OrdersVO> exchangecompleteList(Map<String, Object> map);

	public int exchangecompleteListCount(Map<String, Object> map);

	public OrdersVO exchcompldetail(OrdersVO vo);

	public OrdersVO exchcompldetailname(OrdersVO vo);

	public List<OrdersVO> exchangeimpossibleList(Map<String, Object> map);

	public int exchangeimpossibleListCount(Map<String, Object> map);

	public OrdersVO exchImpossibledetail(OrdersVO vo);

	public OrdersVO exchImpossibledetailname(OrdersVO vo);

	public List<OrdersVO> returncompleteList(Map<String, Object> map);

	public int returncompleteListCount(Map<String, Object> map);

	public OrdersVO returncompletedetail(OrdersVO vo);

	public OrdersVO returncompletedetailname(OrdersVO vo);

	public List<OrdersVO> returnimpossibleList(Map<String, Object> map);

	public int returnimpossibleListCount(Map<String, Object> map);

	public OrdersVO returnimpossibledetail(OrdersVO vo);

	public OrdersVO returnimpossibledetailname(OrdersVO vo);
	
	public List<OrdersVO> getSellerindexOrder(OrdersVO vo);
	public List<OrdersVO> getSellerindexExchange(OrdersVO vo);
	public List<OrdersVO> getSellerindexRetern(OrdersVO vo);
	
	public int isReviewed(int ORDERS_ID);
}
