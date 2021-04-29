package com.khotel.DaoImpl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.khotel.Dao.TabletDao;
import com.khotel.Vo.TabletVo;

@Repository("tabletDao")
public class TabletDaoImpl implements TabletDao{

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired 
	SqlSessionTemplate sqlSession;

	@Override
	public List<TabletVo> listTablet() throws Exception {
		return sqlSession.selectList("tablet.listTablet");
	}

	@Override
	public void insertTablet(TabletVo tabletVo) throws Exception {
		sqlSession.insert("tablet.insertTablet", tabletVo);
		
	}

	@Override
	public void updateTablet(TabletVo tabletVo) throws Exception {
		sqlSession.update("tablet.updateTablet", tabletVo);
		
	}

	@Override
	public TabletVo selectTablet(TabletVo tabletVo) throws Exception {
		return sqlSession.selectOne("tablet.selectTablet", tabletVo);
	}
	
	
}
