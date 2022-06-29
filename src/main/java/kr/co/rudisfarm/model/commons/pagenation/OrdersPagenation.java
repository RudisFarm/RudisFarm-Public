package kr.co.rudisfarm.model.commons.pagenation;

import java.util.List;

public class OrdersPagenation {
	private List<Object> ordersList;    // 전체 상품 리스트
	private int page; 					 // 현재 페이징 번호
	private int maxPage; 			  	 // 전체 페이징 번호
	private int startPage; 				 // 화면에 보여질 페이징 첫번째 번호
	private int endPage; 				 // 화면에 보여질 페이징 마지막 번호
	private int listCount; 				 // 전체 리스트 갯수
	private int limit;
	private String keyword; 			 //키워드
	private String type1; 				 //대분류
	private String type2; 				 //소분류
	private String sort;  				 //정렬타입

	public OrdersPagenation(List<Object> ordersList, int page, int listCount, int limit, String keyword, String type1,
			String type2, String sort) {
		this.ordersList = ordersList;
		this.page = page;
		this.listCount = listCount;
		this.limit = limit;
		this.keyword = keyword;
		this.type1 = type1;
		this.type2 = type2;
		this.sort = sort;
		
		maxPage = (int) ((double) listCount / limit + 0.95);
		startPage = (((int) ((double)page/5+0.9))-1)*5+1;
		endPage = startPage + 5 - 1;
		
		if (endPage > maxPage) {
			endPage = maxPage;
		}
	}
	
	public List<Object> getOrdersList() {
		return ordersList;
	}

	public int getLimit() {
		return limit;
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

}
