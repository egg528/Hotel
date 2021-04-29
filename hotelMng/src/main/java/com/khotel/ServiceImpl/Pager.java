package com.khotel.ServiceImpl;

public class Pager {
	public static final int PAGE_SCALE = 10;
	
	public static final int BLOCK_SCALE = 10;
	
	private int curPage;
	
	private int prevPage;
	
	private int nextPage;
	
	private int totPage;
	
	private int totBlock;
	
	private int curBlock;
	
	private int prevBlock;
	
	private int nextBlock;
	
	private int pageBegin;
	
	private int pageEnd;
	
	private int blockBegin;
	
	private int blockEnd;
	
	
	
	//생성자
	public Pager(int count, int curPage) {
		curBlock = 1;
		this.curPage = curPage;
		setTotPage(count);
		setPageRange();
		setTotBlock();
		
		setBlockRange();
		
	}
	
	public void setBlockRange() {
		curBlock = (int)Math.ceil((curPage-1)/BLOCK_SCALE)+1;
		
		blockBegin = (curBlock-1) * BLOCK_SCALE+1;
		blockEnd = blockBegin+BLOCK_SCALE-1;
		
		if(blockEnd > totPage) blockEnd=totPage;
		
		prevPage = (curBlock==1)?1:(curBlock-1)*BLOCK_SCALE;
		nextPage = curBlock>totBlock ? (curBlock*BLOCK_SCALE) : (curBlock*BLOCK_SCALE)+1;
		
		if(nextPage >= totPage) nextPage=totPage;
		
	}
	
	public void setTotBlock() {
		totBlock = (int)Math.ceil(totPage / BLOCK_SCALE);
		
	}

	
	public void setPageRange() {
		pageBegin = (curPage-1)*PAGE_SCALE+1;
		pageEnd = pageBegin + PAGE_SCALE-1;
	}


	public int getCurPage() {
		return curPage;
	}



	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}



	public int getPrevPage() {
		return prevPage;
	}



	public void setPrevPage(int prevPage) {
		this.prevPage = prevPage;
	}



	public int getNextPage() {
		return nextPage;
	}



	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}



	public int getTotPage() {
		return totPage;
	}



	public void setTotPage(int totPage) {
		this.totPage = (int)Math.ceil(totPage*1.0 / PAGE_SCALE);
	}



	public int getTotBlock() {
		return totBlock;
	}






	public int getCurBlock() {
		return curBlock;
	}



	public void setCurBlock(int curBlock) {
		this.curBlock = curBlock;
	}



	public int getPrevBlock() {
		return prevBlock;
	}



	public void setPrevBlock(int prevBlock) {
		this.prevBlock = prevBlock;
	}



	public int getNextBlock() {
		return nextBlock;
	}



	public void setNextBlock(int nextBlock) {
		this.nextBlock = nextBlock;
	}



	public int getPageBegin() {
		return pageBegin;
	}



	public void setPageBegin(int pageBegin) {
		this.pageBegin = pageBegin;
	}



	public int getPageEnd() {
		return pageEnd;
	}



	public void setPageEnd(int pageEnd) {
		this.pageEnd = pageEnd;
	}



	public int getBlockBegin() {
		return blockBegin;
	}



	public void setBlockBegin(int blockBegin) {
		this.blockBegin = blockBegin;
	}



	public int getBlockEnd() {
		return blockEnd;
	}



	public void setBlockEnd(int blockEnd) {
		this.blockEnd = blockEnd;
	}



	public static int getPageScale() {
		return PAGE_SCALE;
	}



	public static int getBlockScale() {
		return BLOCK_SCALE;
	}
	

}
