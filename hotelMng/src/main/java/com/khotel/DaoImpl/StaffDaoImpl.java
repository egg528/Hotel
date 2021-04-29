package com.khotel.DaoImpl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.khotel.Dao.StaffDao;
import com.khotel.Vo.MemberVo;
import com.khotel.Vo.StaffVo;

@Repository("staffDao")
public class StaffDaoImpl implements StaffDao {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired 
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<StaffVo> listStaff() throws Exception {
		return sqlSession.selectList("staff.listStaff");
	}

	@Override
	public StaffVo selectStaff(StaffVo staffVo) throws Exception {
		return sqlSession.selectOne("staff.selectStaff", staffVo);
	}
}
