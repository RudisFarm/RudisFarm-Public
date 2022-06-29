package kr.co.rudisfarm.model.commons.pagenation;

import java.util.List;

import kr.co.rudisfarm.model.orders.OrdersVO;

public class SuperAdminSellerPagenation {
	
	private List<OrdersVO> adminsellerList;
	private int page; // 현재 페이징 번호
	private int maxPage; // 전체 페이징 번호
	private int startPage; // 화면에 보여질 페이징 첫번째 번호
	private int endPage; // 화면에 보여질 페이징 마지막 번호
	private int listCount; // 전체 리스트 갯수
	
	
	public SuperAdminSellerPagenation(List<OrdersVO> adminsellerList, int page, int listCount) {
		super();
		this.adminsellerList = adminsellerList;
		this.page = page;
		this.listCount = listCount;
	
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
	}


	public List<OrdersVO> getAdminsellerList() {
		return adminsellerList;
	}


	public void setAdminsellerList(List<OrdersVO> adminsellerList) {
		this.adminsellerList = adminsellerList;
	}


	public int getPage() {
		return page;
	}


	public void setPage(int page) {
		this.page = page;
	}


	public int getMaxPage() {
		return maxPage;
	}


	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}


	public int getStartPage() {
		return startPage;
	}


	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}


	public int getEndPage() {
		return endPage;
	}


	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}


	public int getListCount() {
		return listCount;
	}


	public void setListCount(int listCount) {
		this.listCount = listCount;
	}
}
