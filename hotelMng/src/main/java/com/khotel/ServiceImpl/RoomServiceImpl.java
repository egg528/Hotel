package com.khotel.ServiceImpl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.khotel.Controller.HomeController;
import com.khotel.Dao.RoomDao;
import com.khotel.Service.RoomService;
import com.khotel.Vo.ReservationVo;
import com.khotel.Vo.RoomVo;

@Service("roomService")
public class RoomServiceImpl implements RoomService {
	private final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Resource(name="roomDao")
	RoomDao roomDao;
	
	@Override
	public List<RoomVo> selectRoomList(RoomVo roomVo) throws Exception {
		return roomDao.selectRoomList(roomVo);
	}

	@Override
	public RoomVo selectRoom(RoomVo roomVo) throws Exception {
		return roomDao.selectRoom(roomVo);
	}

	@Override
	public void insertRoom(RoomVo roomVo) throws Exception {
		roomDao.insertRoom(roomVo);
		
	}

	@Override
	public void updateRoom(RoomVo roomVo) throws Exception {
		roomDao.updateRoom(roomVo);
		
	}

	@Override
	public void deleteRoom(RoomVo roomVo) throws Exception {
		roomDao.deleteRoom(roomVo);
		
	}

	@Override
	public List<RoomVo> listRoomReservation(String roomNo) throws Exception {
		return roomDao.listRoomReservation(roomNo);
	}
	
	@Override
	public List<RoomVo> listRoom(int start, int end, String search_option, String keyword) throws Exception {
		return roomDao.listRoom(start, end, search_option, keyword);
	}

	@Override
	public int findRoomReservation(HashMap<String, Object> map) {
		return roomDao.findRoomReservation(map);
	}
	
	@Override
	public List<RoomVo> listBlockSelect(HashMap<String, Object> map) {
		return roomDao.listBlockSelect(map);
	}

	@Override
	public RoomVo boardView(String id) {
		return roomDao.boardView(id);
	}

	@Override
	public List<RoomVo> listFindRoom(HashMap<String, Object> map) {
		return roomDao.listFindRoom(map);
	}

	@Override
	public int findRoomTotal(HashMap<String, Object> map) {
		return roomDao.findRoomTotal(map);
	}

	@Override
	public List<RoomVo> viewList(HashMap<String, Object> map) {
		return roomDao.viewList(map);
	}

	@Override
	public int findDateTotal(HashMap<String, Object> map) {
		return roomDao.findDateTotal(map);
	}

	@Override
	public int findRoom(HashMap<String, Object> map) {
		return roomDao.findRoom(map);
	}
	
	@Override
	public List<RoomVo> searchRoomList(ReservationVo reservation) throws Exception {
		return roomDao.searchRoomList(reservation);
	}

	@Override
	public List<RoomVo> searchSelectRoomList(ReservationVo reservation) throws Exception {
		return roomDao.searchSelectRoomList(reservation);
	}

	@Override
	public List<RoomVo> searchRoomListCnt(ReservationVo reservation) throws Exception {
		return roomDao.searchRoomListCnt(reservation);
	}

	@Override
	public List<RoomVo> searchSelectRoomListCnt(ReservationVo reservation) throws Exception {
		return roomDao.searchSelectRoomListCnt(reservation);
	}	
	@Override
	public List<RoomVo> listclassRoom(String room) throws Exception {
		// TODO Auto-generated method stub
		return roomDao.listclassRoom(room);
	}

	@Override
	public List<RoomVo> listRoom2() throws Exception {
		return roomDao.listRoom2();
	}

}
