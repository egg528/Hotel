package com.khotel.ServiceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.khotel.Controller.StaffController;
import com.khotel.Dao.TabletDao;
import com.khotel.Service.TabletService;
import com.khotel.Vo.TabletVo;

@Service("tabletService")
public class TabletServiceImpl implements TabletService {
	private final Logger logger = LoggerFactory.getLogger(StaffController.class);
	
	@Resource(name="tabletDao")
	TabletDao tabletDao;

	@Override
	public List<TabletVo> listTablet() throws Exception {
		return tabletDao.listTablet();
	}

	@Override
	public void insertTablet(TabletVo tabletVo) throws Exception {
		tabletDao.insertTablet(tabletVo);
		
	}

	@Override
	public void updateTablet(TabletVo tabletVo) throws Exception {
		tabletDao.updateTablet(tabletVo);
		
	}

	@Override
	public TabletVo selectTablet(TabletVo tabletVo) throws Exception {
		return tabletDao.selectTablet(tabletVo);
	}
	
	
	
	
}
