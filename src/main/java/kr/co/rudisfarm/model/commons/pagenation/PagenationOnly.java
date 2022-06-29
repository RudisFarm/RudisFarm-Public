package kr.co.rudisfarm.model.commons.pagenation;

import java.util.List;

public class PagenationOnly {
	private List<Object> productList;    // 전체 상품 리스트
	private int page; 					 // 현재 페이징 번호
	private int maxPage; 			  	 // 전체 페이징 번호
	private int startPage; 				 // 화면에 보여질 페이징 첫번째 번호
	private int endPage; 				 // 화면에 보여질 페이징 마지막 번호
	private int listCount; 				 // 전체 리스트 갯수
	private int limit;

	public PagenationOnly(List<Object> productList, int page, int listCount, int limit) {
		this.productList = productList;
		this.page = page;
		this.listCount = listCount;
		this.limit = limit;
		
		maxPage = (int) ((double) listCount / limit + 0.95);
		startPage = (((int) ((double)page/5+0.9))-1)*5+1;
		endPage = startPage + 5 - 1;
		
		if (endPage > maxPage) {
			endPage = maxPage;
		}
	}
	
	public List<Object> getProductList() {
		return productList;
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

}
