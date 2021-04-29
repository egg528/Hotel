package com.khotel.Dao;

import com.khotel.Vo.RoomVo;

import java.util.List;

import com.khotel.Vo.ReservationVo;

public interface ReservationDao {
	public ReservationVo selectReservation(ReservationVo reservationVo) throws Exception;
	public void insertReservation(ReservationVo reservationVo) throws Exception;
	public void updateReservation(ReservationVo reservationVo) throws Exception;
	public void deleteReservation(ReservationVo reservationVo) throws Exception;
	public List<ReservationVo> listReservation(int start, int end, String search_option, String keyword) throws Exception;
	public List<ReservationVo> selectReservationList(ReservationVo reservationVo) throws Exception;
	public int countReservation();
}
