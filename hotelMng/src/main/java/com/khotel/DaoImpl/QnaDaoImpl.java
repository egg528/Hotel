package com.khotel.DaoImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.khotel.Dao.QnaDao;
import com.khotel.Vo.QnaVo;


@Repository("QnaDao")
public class QnaDaoImpl implements QnaDao {
	
	@Inject
	SqlSessionTemplate sqlSession;

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
		// TODO Auto-generated method stub
		
	}

	@Override
	public void create(QnaVo vo) throws Exception {
		sqlSession.insert("QNA.create", vo);
		
	}

	@Override
	public QnaVo read(int QNACODE) throws Exception {
		return sqlSession.selectOne("QNA.view", QNACODE);
	}

	@Override
	public void update(QnaVo vo) throws Exception {
		sqlSession.update("QNA.updateArticle", vo);
		
	}

	@Override
	public void delete(int QNACODE) throws Exception {
		sqlSession.delete("QNA.deleteArticle", QNACODE);
		
	}

	@Override
	public List<QnaVo> listAll(int start, int end, String search_option, String keyword) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search_option", "");
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);		
		return sqlSession.selectList("QNA.listAll", map);
	}

	@Override
	public void increaseViewcnt(int QNACODE) throws Exception {
		sqlSession.update("QNA.increaseViewcnt", QNACODE);
		
	}

	@Override
	public int countArticle(String search_option, String keyword) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<QnaVo> listSome(int start, int end, String UserId) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("UserId", UserId);
		return sqlSession.selectList("QNA.listSome", map);
		
	}

	@Override
	public int countQna() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("QNA.count");
	}

}