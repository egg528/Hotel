package com.khotel.Service;

import java.util.List;

import com.khotel.Vo.MemberVo;
import com.khotel.Vo.StaffVo;

public interface StaffService {
	public List<StaffVo> listStaff() throws Exception;
	public StaffVo selectStaff(StaffVo staffVo) throws Exception;
}
