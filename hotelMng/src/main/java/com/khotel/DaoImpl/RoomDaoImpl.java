package com.khotel.DaoImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.khotel.Controller.HomeController;
import com.khotel.Dao.RoomDao;
import com.khotel.Vo.ReservationVo;
import com.khotel.Vo.RoomVo;

@Repository("roomDao")
public class RoomDaoImpl implements RoomDao{
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired 
	SqlSessionTemplate sqlSession;

	@Override
	public List<RoomVo> selectRoomList(RoomVo roomVo) throws Exception {
		return sqlSession.selectList("room.selectRoomList", roomVo);
	}

	@Override
	public RoomVo selectRoom(RoomVo roomVo) throws Exception {
		return sqlSession.selectOne("room.selectRoom", roomVo);
	}

	@Override
	public void insertRoom(RoomVo roomVo) throws Exception {
		sqlSession.insert("room.insertRoom", roomVo);
		
	}

	@Override
	public void updateRoom(RoomVo roomVo) throws Exception {
		sqlSession.update("room.updateRoom", roomVo);
		
	}

	@Override
	public void deleteRoom(RoomVo roomVo) throws Exception {
		sqlSession.delete("room.deleteRoom", roomVo);
		
	}
	
	@Override
	public List<RoomVo> listRoomReservation(String roomNo) throws Exception {
		return sqlSession.selectList("room.listRoomReservation", roomNo);
	}
	
	@Override
	public int findRoomReservation(HashMap<String, Object> map) {
		return sqlSession.selectOne("room.findRoomReservation", map);
	}
	
	@Override
	public List<RoomVo> listRoom(int start, int end, String search_option, String keyword) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search_option", "");
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList("room.listRoom");
	}

	@Override
	public List<RoomVo> listBlockSelect(HashMap<String, Object> map) {
		return sqlSession.selectList("room.listBlockSelect", map);
	}

	@Override
	public RoomVo boardView(String id) {
		return sqlSession.selectOne("room.boardView", id);
	}

	@Override
	public List<RoomVo> listFindRoom(HashMap<String, Object> map) {
		return sqlSession.selectList("room.listFindRoom", map);
	}

	@Override
	public int findRoomTotal(HashMap<String, Object> map) {
		return sqlSession.selectOne("room.findRoomTotal", map);
	}

	@Override
	public List<RoomVo> viewList(HashMap<String, Object> map) {
		return sqlSession.selectList("room.viewList", map);
	}

	@Override
	public int findDateTotal(HashMap<String, Object> map) {
		return sqlSession.selectOne("room.findDateTotal", map);
	}

	@Override
	public int findRoom(HashMap<String, Object> map) {
		return sqlSession.selectOne("room.findRoom", map);
	}
	
	@Override
	public List<RoomVo> searchRoomList(ReservationVo reservation) throws Exception {
		return sqlSession.selectList("room.findEmptyRoomList", reservation);
	}

	@Override
	public List<RoomVo> searchSelectRoomList(ReservationVo reservation) throws Exception {
		return sqlSession.selectList("room.findEmptySelectRoomList", reservation);
	}

	@Override
	public List<RoomVo> searchRoomListCnt(ReservationVo reservation) throws Exception {
		return sqlSession.selectList("room.findEmptyRoomListCnt", reservation);
	}

	@Override
	public List<RoomVo> searchSelectRoomListCnt(ReservationVo reservation) throws Exception {
		return sqlSession.selectList("room.findEmptySelectRoomListCnt", reservation);
	}	
	
	@Override
	public List<RoomVo> listclassRoom(String room) throws Exception {
		System.out.println(room);

		return sqlSession.selectList("roomlistclass", room);
	}

	@Override
	public List<RoomVo> listRoom2() throws Exception {
		return sqlSession.selectList("room.listRoom2");
	}	
}
