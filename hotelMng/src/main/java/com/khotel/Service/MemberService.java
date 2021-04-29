package com.khotel.Service;

import java.util.HashMap;
import java.util.List;

import com.khotel.Vo.MemberVo;

public interface MemberService {

	public List<MemberVo> selectMemberList(MemberVo memberVo) throws Exception;
	public MemberVo selectMember(MemberVo memberVo) throws Exception;
	public void insertMember(MemberVo memberVo) throws Exception;
	public void updateMember(MemberVo memberVo) throws Exception;
	public void updateLevel(MemberVo memberVo) throws Exception;
	public void updateMile(MemberVo memberVo) throws Exception;
	public void updateGrade(MemberVo memberVo) throws Exception;
	public void deleteMember(MemberVo memberVo) throws Exception;
	MemberVo checkId(String id) throws Exception;
	public List<MemberVo> listMember(int start, int end, String search_option, String keyword) throws Exception;
	public int selectBoardCount();
	public List<MemberVo> listBlockSelect(HashMap<String, Object> map);
	public MemberVo boardView(String id);
	public List<MemberVo> listFindName(HashMap<String, Object> map);
	public int findNameTotal(HashMap<String, Object> map);
	public List<MemberVo> viewList(HashMap<String, Object> map);
	public int findDateTotal(HashMap<String, Object> map);


}