package com.khotel.Dao;

import java.util.List;

import com.khotel.Vo.QnaVo;

public interface QnaDao {
	
	public void deleteFile(String fullName); //첨부파일 삭제
	
	public List<String> getAttach(int QNACODE); //첨부파일 목록
	
	public void addAttach(String fullName); //첨부파일 저장
	
	public void updateAttach(String fullName, int QNACODE); //첨부파일 수정
	
	public void create(QnaVo vo) throws Exception; //글쓰기
	
	public QnaVo read(int QNACODE) throws Exception; //글읽기
	
	public void update(QnaVo vo) throws Exception; //글수정
	
	public void delete(int QNACODE) throws Exception; //글삭제
	
	public int countQna();
	
	public List<QnaVo> listSome(int start, int end, String UserId) throws Exception; //내 문의만 찾기
	
	
	//목록(페이지 나누기, 검색 기능 포함)
	public List<QnaVo> listAll(
			int start, int end, String search_option, String keyword) throws Exception;
	
	
	//조회수 증가 처리
	public void increaseViewcnt(int QNACODE) throws Exception;
	
	
	//레코드 개수 계산
	public int countArticle(String search_option, String keyword) throws Exception;
}