package com.khotel.DaoImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.khotel.Controller.HomeController;
import com.khotel.Dao.MemberDao;
import com.khotel.Vo.MemberVo;


@Repository("memberDao")
public class MemberDaoImpl implements MemberDao {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired 
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<MemberVo> selectMemberList(MemberVo memberVo) throws Exception {
		return sqlSession.selectList("member.selectMemberList", memberVo);
	}
	
	@Override
	public MemberVo selectMember(MemberVo memberVo) throws Exception {
		return sqlSession.selectOne("member.selectMember", memberVo);
	};
	
	@Override
	public void insertMember(MemberVo memberVo) throws Exception {
		sqlSession.insert("member.insertMember", memberVo);
	}
	
	@Override
	public void updateMember(MemberVo memberVo) throws Exception {
		sqlSession.update("member.updateMember", memberVo);
	}
	
	@Override
	public void updateLevel(MemberVo memberVo) throws Exception {
		sqlSession.update("member.updateLevel", memberVo);
	}
	
	@Override
	public void deleteMember(MemberVo memberVo) throws Exception {
		sqlSession.delete("member.deleteMember", memberVo);
	}

	@Override
	public MemberVo checkId(String id) throws Exception {
		return sqlSession.selectOne("member.checkId", id);
	}

	@Override
	public List<MemberVo> listMember(int start, int end, String search_option, String keyword) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search_option", "");
		map.put("keyword", "");
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList("member.listMember", map);
	}

	@Override
	public int selectBoardCount() {
		return sqlSession.selectOne("member.selectBoardCount");
	}

	@Override
	public List<MemberVo> listBlockSelect(HashMap<String, Object> map) {
		return sqlSession.selectList("member.listBlockSelect", map);
	}

	@Override
	public MemberVo boardView(String id) {
		return sqlSession.selectOne("member.boardView", id);
	}

	@Override
	public List<MemberVo> listFindName(HashMap<String, Object> map) {
		return sqlSession.selectList("member.listFindName", map);
	}

	@Override
	public int findNameTotal(HashMap<String, Object> map) {
		return sqlSession.selectOne("member.findNameTotal", map);
	}

	@Override
	public List<MemberVo> viewList(HashMap<String, Object> map) {
		return sqlSession.selectList("member.viewList", map);
	}

	@Override
	public int findDateTotal(HashMap<String, Object> map) {
		return sqlSession.selectOne("member.findDateTotal", map);
	}

	@Override
	public void updateMile(MemberVo memberVo) throws Exception {
		sqlSession.update("member.updateMile", memberVo);	
	}

	@Override
	public void updateGrade(MemberVo memberVo) throws Exception {
		sqlSession.update("member.updateGrade", memberVo);
		
	}
	

}