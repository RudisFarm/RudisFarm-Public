package kr.co.rudisfarm.model.commons.pagenation;

import java.util.List;

import kr.co.rudisfarm.model.seller_income.SellerIncomeVO;


public class SellerIncomePagenation {
	private int page; // 현재 페이징 번호
	private int maxPage; // 전체 페이징 번호
	private int startPage; // 화면에 보여질 페이징 첫번째 번호
	private int endPage; // 화면에 보여질 페이징 마지막 번호
	private int listCount; // 전체 리스트 갯수
	private String keyword; // 검색어
	private String sort; // 정렬타입
	private String keywordType;	//검색 키워드
	private List<SellerIncomeVO> list;
	
	public SellerIncomePagenation(List<SellerIncomeVO> list, int page, int listCount, String keyword, String sort, String keywordType) {
		int limit = 10;
		
		this.list = list;
		this.page = page;
		this.listCount = listCount;
		this.keyword = keyword;
		this.sort = sort;
		this.keywordType = keywordType;

		maxPage = listCount / limit;
		if (listCount % limit != 0) {
			maxPage++;
		}

		int modVal = page % 5;
		startPage = page / 5 * 5 + 1;
		if (modVal == 0)
			startPage = startPage - 5;
		endPage = startPage + 4;
		if (endPage > maxPage)
			endPage = maxPage;

	}
	
	public List<SellerIncomeVO> getList() {
		return list;
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

	public String getSort() {
		return sort;
	}

	public String getKeywordType() {
		return keywordType;
	}
}
