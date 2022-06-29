package kr.co.rudisfarm.model.commons.pagenation;

import java.util.List;

import kr.co.rudisfarm.model.payment.RudisPaymentVO;

public class PaymentPagenation {
	private List<RudisPaymentVO> paymentList; // 전체 상품 리스트
	private int page; 					 // 현재 페이징 번호
	private int maxPage; 			  	 // 전체 페이징 번호
	private int startPage; 				 // 화면에 보여질 페이징 첫번째 번호
	private int endPage; 				 // 화면에 보여질 페이징 마지막 번호
	private int listCount; 				 // 전체 리스트 갯수
	private String keyword; 			 //키워드
	private String type1; 				 //대분류
	private String type2; 				 //소분류
	private String sort;  				 //정렬타입
	private String keywordType;
	private List<RudisPaymentVO> paymentCancelList;
	private List<RudisPaymentVO> superAdminPaymentList;
	private List<RudisPaymentVO> superAdminCancelPaymentList;
	private List<RudisPaymentVO> orderschangeList;





	public PaymentPagenation(List<RudisPaymentVO> paymentList, List<RudisPaymentVO> paymentCancelList, List<RudisPaymentVO> superAdminPaymentList, 
			List<RudisPaymentVO> superAdminCancelPaymentList, List<RudisPaymentVO> orderschangeList, int page, int listCount, String keyword, String type1, String type2, String sort, String keywordType) {
		this.paymentList = paymentList;
		this.paymentCancelList = paymentCancelList;
		this.superAdminPaymentList = superAdminPaymentList;
		this.superAdminCancelPaymentList = superAdminCancelPaymentList;
		this.orderschangeList = orderschangeList;
		this.page = page;
		this.listCount = listCount;
		this.keyword = keyword;
		this.type1 = type1;
		this.type2 = type2;
		this.sort = sort;
		this.keywordType = keywordType;
		
		maxPage = listCount / 10;
		if(listCount % 10 != 0) {
			maxPage++;
		}
		
		int modVal = page % 5;
		startPage = page / 5 * 5 +1;
		if(modVal == 0) page = page-5;
		endPage = startPage + 4;
		if(endPage> maxPage) endPage = maxPage;
		
//		maxPage = (int) ((double) listCount / 12 + 0.95);
//		startPage = (((int) ((double)page/5+0.9))-1)*5+1;
//		endPage = startPage + 5 - 1;
//		
//		if (endPage > maxPage) {
//			endPage = maxPage;
//		}
		
		
	}
	public List<RudisPaymentVO> getOrderschangeList() {
		return orderschangeList;
	}
	
	public String getKeywordType() {
		return keywordType;
	}

	public List<RudisPaymentVO> getSuperAdminPaymentList() {
		return superAdminPaymentList;
	}



	public List<RudisPaymentVO> getSuperAdminCancelPaymentList() {
		return superAdminCancelPaymentList;
	}

	public List<RudisPaymentVO> getPaymentList() {
		return paymentList;
	}

	public List<RudisPaymentVO> getPaymentCancelList() {
		return paymentCancelList;
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
