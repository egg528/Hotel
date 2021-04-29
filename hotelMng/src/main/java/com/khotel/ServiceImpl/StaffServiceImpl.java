package com.khotel.ServiceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.khotel.Controller.HomeController;
import com.khotel.Controller.StaffController;
import com.khotel.Dao.MemberDao;
import com.khotel.Dao.StaffDao;
import com.khotel.Service.StaffService;
import com.khotel.Vo.MemberVo;
import com.khotel.Vo.StaffVo;

@Service("staffService")
public class StaffServiceImpl implements StaffService {
	private final Logger logger = LoggerFactory.getLogger(StaffController.class);
	
	@Resource(name="staffDao")
	StaffDao staffDao;

	@Override
	public List<StaffVo> listStaff() throws Exception {
		return staffDao.listStaff();
	}

	@Override
	public StaffVo selectStaff(StaffVo staffVo) throws Exception {
		return staffDao.selectStaff(staffVo);
	}
}
