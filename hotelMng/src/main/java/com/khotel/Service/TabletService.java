package com.khotel.Service;

import java.util.List;

import com.khotel.Vo.ReservationVo;
import com.khotel.Vo.TabletVo;

public interface TabletService {
	public List<TabletVo> listTablet() throws Exception;
	public void insertTablet(TabletVo tabletVo) throws Exception;
	public void updateTablet(TabletVo tabletVo) throws Exception;
	public TabletVo selectTablet(TabletVo tabletVo) throws Exception;

	
}
