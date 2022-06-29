package kr.co.rudisfarm.model.commons.pagenation;

import java.util.List;

import kr.co.rudisfarm.model.orders.OrdersVO;

public class OrdersBuyerPagenation {
	//private List<OrdersVO> paymentList; // 전체 상품 리스트
	private int page; // 현재 페이징 번호
	private int maxPage; // 전체 페이징 번호
	private int startPage; // 화면에 보여질 페이징 첫번째 번호
	private int endPage; // 화면에 보여질 페이징 마지막 번호
	private int listCount; // 전체 리스트 갯수
	private String keyword; // 키워드
	private String type1; // 대분류
	private String type2; // 소분류
	private String sort; // 정렬타입
	private String keywordType;
	private List<OrdersVO> sellerExchangeList;
	private List<OrdersVO> sellerReturnList;
	private List<OrdersVO> sellerExchangeListCount;
	private List<OrdersVO> sellerReturnListCount;



	public OrdersBuyerPagenation(List<OrdersVO> sellerExchangeList, List<OrdersVO> sellerReturnList, int page,
			int listCount, String keyword, String type1, String type2, String sort, String keywordType) {
		
		this.sellerExchangeList = sellerExchangeList;
		this.sellerReturnList = sellerReturnList;
		this.page = page;
		this.listCount = listCount;
		this.keyword = keyword;
		this.type1 = type1;
		this.type2 = type2;
		this.sort = sort;
		this.keywordType = keywordType;

		maxPage = listCount / 10;
		if (listCount % 10 != 0) {
			maxPage++;
		}

		int modVal = page % 5;
		startPage = page / 5 * 5 + 1;
		if (modVal == 0)
			page = page - 5;
		endPage = startPage + 4;
		if (endPage > maxPage)
			endPage = maxPage;

//		maxPage = (int) ((double) listCount / 12 + 0.95);
//		startPage = (((int) ((double)page/5+0.9))-1)*5+1;
//		endPage = startPage + 5 - 1;
//		
//		if (endPage > maxPage) {
//			endPage = maxPage;
//		}

	}

//	public List<OrdersVO> getPaymentList() {
//		return paymentList;
//	}
	
	public List<OrdersVO> getSellerExchangeListCount() {
		return sellerExchangeListCount;
	}

	public List<OrdersVO> getSellerReturnListCount() {
		return sellerReturnListCount;
	}

	public int getPage() {
		return page;
	}

	public int getMaxPage() {
		return maxPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public int getListCount() {
		return listCount;
	}

	public String getKeyword() {
		return keyword;
	}

	public String getType1() {
		return type1;
	}

	public String getType2() {
		return type2;
	}

	public String getSort() {
		return sort;
	}

	public String getKeywordType() {
		return keywordType;
	}

	public List<OrdersVO> getSellerExchangeList() {
		return sellerExchangeList;
	}

	public List<OrdersVO> getSellerReturnList() {
		return sellerReturnList;
	}

}