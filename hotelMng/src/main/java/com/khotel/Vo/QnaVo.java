package com.khotel.Vo;

import java.util.Arrays;

import oracle.sql.DATE;

public class QnaVo {
	private int QNACODE;
	private String QNATITLE;
	private String QNACONTENT;
	private String QNAWRITER;
	private String QNAREGISTERDATE;
	private int QNAVIEWCOUNT;

	public int getQNACODE() {
		return QNACODE;
	}
	public void setQNACODE(int qNACODE) {
		QNACODE = qNACODE;
	}
	public String getQNATITLE() {
		return QNATITLE;
	}
	public void setQNATITLE(String qNATITLE) {
		QNATITLE = qNATITLE;
	}
	public String getQNACONTENT() {
		return QNACONTENT;
	}
	public void setQNACONTENT(String qNACONTENT) {
		QNACONTENT = qNACONTENT;
	}
	public String getQNAWRITER() {
		return QNAWRITER;
	}
	public void setQNAWRITER(String qNAWRITER) {
		QNAWRITER = qNAWRITER;
	}
	public String getQNAREGISTERDATE() {
		return QNAREGISTERDATE;
	}
	public void setQNAREGISTERDATE(String qNAREGISTERDATE) {
		QNAREGISTERDATE = qNAREGISTERDATE;
	}
	public int getQNAVIEWCOUNT() {
		return QNAVIEWCOUNT;
	}
	public void setQNAVIEWCOUNT(int qNAVIEWCOUNT) {
		QNAVIEWCOUNT = qNAVIEWCOUNT;
	}

}
