package com.khotel.Util;

import org.springframework.stereotype.Component;

@Component
public class BoardPaging {
	
	private int currentPage; // 현재페이지
	private int pageBlock; // [이전][1][2][3][다음]
	private int pageSize; // 1페이지당 5개씩
	private int totalBoard;   // 총글수
	
	private StringBuffer paging;
	// 계속 편집할 수 있도록 StringBuffer 설정
	// 어떤 거는 [1] 어떤 거는 [1][2] 이런식으로 설정하기 위함
	//StringBuffer자료형은 append메소드를 이용하여 계속 문자열을 추가해 나갈 수 있다.
	public void makePaging() {
		paging = new StringBuffer();
		
		// 총 페이지 수 ( 총 글 수 필요 )
		int totalP = (totalBoard+pageSize-1) / pageSize;
		
		int startPage = (currentPage - 1)/pageBlock*pageBlock+1;
		int endPage = startPage+pageBlock-1;
		if(endPage > totalP) endPage = totalP; 
		// -> 실제 글개수가 17개있는데 전체 글개수가 20개 일때는 전체 글개수를 실제 글개수로 맞춰야함.
		
		//이전생성
		if(startPage > pageBlock) // startPage가 3 보다 크면
			paging.append("[<span style='cursor:pointer;' id=paging onclick=boardPaging("+(startPage-1)+")>이전<</span>]");
		
		//페이지 리스트 출력
		for(int i=startPage; i<=endPage; i++) {
			if(i==currentPage) { //현재페이지
				paging.append("[<span style='cursor:pointer;' id=currentPaging onclick=boardPaging("+i+")>"+i+"</span>]");
			}else { // 다른페이지 링크
				paging.append("[<span style='cursor:pointer;' id=paging onclick=boardPaging("+i+")>"+i+"</span>]");
			}
		}
		
		//다음생성
		if(endPage < totalP) {
			paging.append("[<span style='cursor:pointer;' id=paging onclick=boardPaging("+(endPage+1)+")>다음</span>]");
		}
	}
	
	public void makePaging2() {
		paging = new StringBuffer();
		
		// 총 페이지 수 ( 총 글 수 필요 )
		int totalP = (totalBoard+pageSize-1) / pageSize;
		
		int startPage = (currentPage - 1)/pageBlock*pageBlock+1;
		int endPage = startPage+pageBlock-1;
		if(endPage > totalP) endPage = totalP; 
		// -> 실제 글개수가 17개있는데 전체 글개수가 20개 일때는 전체 글개수를 실제 글개수로 맞춰야함.
		
		//이전생성
		if(startPage > pageBlock) // startPage가 3 보다 크면
			paging.append("[<span style='cursor:pointer;' id=paging2 onclick=boardPaging2("+(startPage-1)+")>이전<</span>]");
		
		//페이지 리스트 출력
		for(int i=startPage; i<=endPage; i++) {
			if(i==currentPage) { //현재페이지
				paging.append("[<span style='cursor:pointer;' id=currentPaging2 onclick=boardPaging2("+i+")>"+i+"</span>]");
			}else { // 다른페이지 링크
				paging.append("[<span style='cursor:pointer;' id=paging2 onclick=boardPaging2("+i+")>"+i+"</span>]");
			}
		}
		
		//다음생성
		if(endPage < totalP) {
			paging.append("[<span style='cursor:pointer;' id=paging2 onclick=boardPaging2("+(endPage+1)+")>다음</span>]");
		}
	}
	
	
	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getPageBlock() {
		return pageBlock;
	}

	public void setPageBlock(int pageBlock) {
		this.pageBlock = pageBlock;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalBoard() {
		return totalBoard;
	}

	public void setTotalBoard(int totalBoard) {
		this.totalBoard = totalBoard;
	}

	public StringBuffer getPaging() {
		return paging;
	}

	public void setPaging(StringBuffer paging) {
		this.paging = paging;
	}
}