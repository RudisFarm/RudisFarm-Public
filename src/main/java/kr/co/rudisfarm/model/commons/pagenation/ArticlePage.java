package kr.co.rudisfarm.model.commons.pagenation;

import java.util.List;

public class ArticlePage {
	private int total;				// 전체 게시글의 개수
	private int currentPage;		// 사용자가 요청한 페이지 번호
	private List<Object> content;	// 화면에 출력할 게시글 목록을 보관
	private int totalPages;			// 전체 페이지 개수
	private int startPage;			// 화면 하단에 보여줄 화면 시작 번호
	private int endPage;			// 화면 하단에 보여줄 화면 끝 번호
	
	public ArticlePage(int total, int currentPage, int size, List<Object> content) {
		this.total = total;
		this.currentPage = currentPage;
		this.content = content;
		
		if (total == 0) {	// 게시글의 개수가 0개면 세 변수를 모두 0으로 할당
			totalPages = 0;
			startPage = 0;
			endPage = 0;
		} else {
			totalPages = total / size;	// 게시글 개수를 이용해서 전체 페이지 개수를 구함
			if (total % size > 0) {
				totalPages++;
			}
			int modVal = currentPage % 5;	// 화면 하단에 보여줄 이동 링크의 시작 페이지 번호를 구한다.
			startPage = currentPage / 5 * 5 + 1;
			if (modVal == 0) startPage = startPage - 5;
			endPage = startPage + 4;
			if (endPage > totalPages) endPage = totalPages;
		}
	}
	
	public int getTotal() {
		return total;
	}

	public boolean hasNoArticles() {
		return total == 0;
	}

	public boolean hasArticles() {
		return total > 0;
	}
	
	public int getCurrentPage() {
		return currentPage;
	}

	public int getTotalPages() {
		return totalPages;
	}

	public List<Object> getContent() {
		return content;
	}

	public int getStartPage() {
		return startPage;
	}
	
	public int getEndPage() {
		return endPage;
	}
}
