package com.khotel.ServiceImpl;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.khotel.Dao.QnaDao;
import com.khotel.Service.QnaService;
import com.khotel.Vo.QnaVo;

@Service("QnaService")
public class QnaServiceImpl implements QnaService{
	
	@Inject
	QnaDao qnaDao;
	
	@Override
	public void deleteFile(String fullName) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<String> getAttach(int QNACODE) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addAttach(String fullName) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateAttach(String fullName, int QNACODE) {
		
	}

	@Override
	public void create(QnaVo vo) throws Exception {
		qnaDao.create(vo);
		
	}

	@Override
	public QnaVo read(int QNACODE) throws Exception {
		return qnaDao.read(QNACODE);
	}

	@Override
	public void update(QnaVo vo) throws Exception {
		qnaDao.update(vo);
		
	}

	@Override
	public void delete(int QNACODE) throws Exception {
		qnaDao.delete(QNACODE);
		
	}

	@Override
	public List<QnaVo> listAll(int start, int end, String search_option, String keyword) throws Exception {
		
		return qnaDao.listAll(start, end, search_option, keyword);
	}
	
	@Override
	public void increaseViewcnt(int QNACODE) throws Exception {
		qnaDao.increaseViewcnt(QNACODE);
		
	}

	@Override
	public int countArticle(String search_option, String keyword) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<QnaVo> listSome(int start, int end, String UserId) throws Exception {
		// TODO Auto-generated method stub
		return qnaDao.listSome(start, end, UserId);
	}

	@Override
	public int countQna() {
		
		return qnaDao.countQna();
	}

}